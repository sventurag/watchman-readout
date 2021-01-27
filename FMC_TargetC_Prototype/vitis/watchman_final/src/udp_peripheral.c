/**
 * @file 	udp_peripheral.c
 * @author	Anthony Schluchin
 * @date	24th October 2018
 * @version 0.0
 */

#include "udp_peripheral.h"
#include "iic_DAC_LTC2657.h"


/*********************** Global variables ****************/
/*********************************************************/
/** @brief UDP Protocol Control Block for data communication */
struct udp_pcb *pcb_data;
/** @brief UDP Protocol Control Block for command communication */
struct udp_pcb *pcb_cmd;
/** @brief Buffer structure used to send data packet */
struct pbuf *buf_data;
/** @brief Buffer structure used to send command packet */
struct pbuf *buf_cmd;

/**************** Extern global variables ****************/
/*********************************************************/
/** @brief Counter of the TTC */
extern volatile int count_ttcps_timer;
/** @brief Instance of AXI-DMA */
extern volatile int count_scu_timer;
/** @brief Number of bytes sent during streaming (trigger mode) */
extern int nbre_of_bytes;
/** @brief Flag reset when the user send the command "stop uC" */
extern volatile bool run_flag;
/** @brief Flag raised when the user send the command "start streaming" */
extern volatile bool stream_flag;
/** @brief Flag raised when the user send the command "get transfer function" */
extern volatile bool get_transfer_fct_flag;
/** @brief Flag raised when the user send the command "get windows" */
extern volatile bool get_windows_flag;
/** @brief Flag raised when the user send the command "get windows raw" */
extern volatile bool get_windows_raw_flag;


/** @brief Array containing registers of AXI-lite */
/** @brief Flag raised when a pedestal value is required by the user */
extern volatile bool pedestal_flag;

/** @brief Flag raised when a restart is required by the user */
extern volatile bool restart_flag;

extern int* regptr;
/** @brief Buffer used to send the command (50 bytes above it reserved for protocol header) */
extern char* frame_buf_cmd;

//******** To test the error detection********************/
/** @brief Flag raised when the user want to test the autonomous side of the system with a watchdog */
extern volatile bool simul_err_watchdog_flag;
/** @brief Flag raised when the user want to test the autonomous side of the system */
extern volatile bool simul_err_function_prob_flag;
/** @brief Flag raised when the user want to test the autonomous side of the system with a exception */
extern volatile bool simul_err_exception_flag;
/** @brief Flag raised when the user want to test the autonomous side of the system with a assertion */
extern volatile bool simul_err_assertion_flag;

/** @brief Flag raised for UDP connection restart */
extern volatile bool get_windows_raw_flag;


/** Value from the GUI for first window   */
extern int fstWindowValue;

/** Value from the GUI for the number of windows   */
extern int nmbrWindows;

/** Value from the GUI for the total number of windows   */
extern int totalWindows;

/** Value from the GUI for the channel to send over the udp   */
extern int channel;

/** Value from the GUI for delay in update WR   */
extern int  delay_UpdateWR;

/** Number of iterations for the average in pedestal calculation**/
extern int pedestalAvg;

/** Value from the GUI for the number of windows for pedestal calculation   */
extern int nmbrWindowsPed;

///** Value from the GUI for voltage value for comparators and vped  */
//extern int VPED_ANALOG;

///** Flag to start pedestal mode pedestal acquisition */
//extern bool pedestalTriggerModeFlag;

/**number of average for pedestals in trigger mode*/
extern int nbr_avg_ped_triggerMode;
/** Flag to start pedestal mode pedestal acquisition */
extern bool pedestalTriggerModeFlag;

/** Flag to start division by  nbr_avg_ped_triggerMode */
extern bool dividePedestalsFlag;
/****************************************************************************/
/**
* @brief	Send a frame trought UDP
*
* @param	frame: pointer to the frame to send
* @param	length: size of the frame
*
* @return	type err_enum_t: enumaration from err.h file
*
* @note		frame must take in consideration the header ex:
* 			for a buffer of size 6
* 			char* test_array = (char *)malloc(6 + BUF_HEADER_SIZE);
* 			and then
* 			transfer_data(&test_array[BUF_HEADER_SIZE], 6)
*
****************************************************************************/
err_t transfer_data(char* frame, uint16_t length) {
	if(sizeof(frame) <= MAX_DATA_SIZE){
		buf_data->payload = frame;
		buf_data->tot_len = length;
		buf_data->len = length;
		return udp_send(pcb_data, buf_data);
	}
	else return ERR_BUF;
}

/****************************************************************************/
/**
* @brief	Send a frame trought UDP
*
* @param	frame: pointer to the frame to send
* @param	length: size of the frame
*
* @return	type err_enum_t: enumaration from err.h file
*
* @note		frame must take in consideration the header ex:
* 			for a buffer of size 6
* 			char* test_array = (char *)malloc(6 + BUF_HEADER_SIZE);
* 			and then
* 			transfer_data(&test_array[BUF_HEADER_SIZE], 6)
*
****************************************************************************/
err_t transfer_cmd(char* frame, uint16_t length) {
	if(sizeof(frame) <= MAX_CMD_SIZE){
		buf_cmd->payload = frame;
		buf_cmd->tot_len = length;
		buf_cmd->len = length;
		return udp_send(pcb_cmd, buf_cmd);
	}
	else return ERR_BUF;
}

/****************************************************************************/
/**
* @brief	callback when a command is received
*
* @param	arg: not used
* @param	pcb: UDP Protocol Control Block used to send the data.
* @param	p: pointer to the buffer containing the data received
* @param	addr: IP address of the destination
* @param	port: UDP port of the destination
*
* @return	None
*
* @note		-
*
****************************************************************************/
void udp_cmd_recv(void *arg, struct udp_pcb *pcb, struct pbuf *p, const ip_addr_t *addr, u16_t port)
{
	int length;
    if (p != NULL) {
    	frame_buf_cmd[0] = 0x55;
    	frame_buf_cmd[1] = 0xAA;

    	length = command_parser(p, frame_buf_cmd);
    	if(length > 0){
    		//send data back
    		frame_buf_cmd[length-2] = 0x33;
    		frame_buf_cmd[length-1] = 0xCC;
    		transfer_cmd(frame_buf_cmd, length);
		}
    	else xil_printf("ERROR with the command received,payloadLast = %04x,%04x,%04x,%04x,%04x,%04x \r\n", frame_buf_cmd[0],frame_buf_cmd[1],frame_buf_cmd[2],frame_buf_cmd[3],frame_buf_cmd[4],frame_buf_cmd[5] );
    }
    //free(p);
    //pbuf_free(p);

}

/****************************************************************************/
/**
* @brief	Process the data received and report a command
*
* @param	p: pointer to the buffer containing the data received
* @param	return_buf: pointer to the data to be echoed back
*
* @return	-1 if there is a problem or the number of byte in return_bf
*
* @note		-
*
****************************************************************************/
int command_parser(struct pbuf *p, char* return_buf){
	char* payload = p->payload;
	uint16_t length = p->len;
	uint16_t start = 0;
	uint16_t end = 0;
	bool flag_start = false;
	bool flag_end = false;
	int i, regID;
	time_cplt offset_time;
	int regVal;
	int regVal_one_reg;
	int regID_one_reg;
	int avg;
	int  delay_RB;
	//int pedestalNmbrWindows;
//	int temp;

	while((start < (length-1)) && (flag_start == false)){
		if((payload[start] == 0x55) && (payload[start+1] == 0xAA)) flag_start = true;
		else start++;
	}

	while((end < (length-1)) && (flag_end == false)){
		if((payload[end] == 0x33) && (payload[end+1] == 0xCC)) flag_end = true;
		else end++;
	}

	if(flag_start && flag_end){
		return_buf[2] = payload[start+2];
		return_buf[3] = payload[start+3];
		switch(payload[start+2]){
			case 0: // cmd write all reg.
				if(start + 4 + 2*REGMAP_SIZE_UDP == end){
					regID = 1;
					for(i = 4; i < (4 + 2*REGMAP_SIZE_UDP); i += 2){
				//		if(regID <= TC_MISCDIG_REG || regID == TC_TPG_REG){
				//		if(regID == 127){
				//			regVal = payload[i]*256 + payload[i+1];
				//			WriteRegister(regID, regVal);
				//			WriteRegister(TC_FSTWINDOW_REG, regVal);

				//		}

						regID++;
					}
				//	fstWindowValue = regVal;
					xil_printf("Command write_all_reg received\r\n");
	//				xil_printf("regVal = %d\r\n", regVal);
				//	xil_printf("FSTWINDOW = %d\r\n", regptr[151]);

					return 6;
				}
				else return -1;
				break;
			case 1: // cmd read all reg
				if(start + 4 == end){
					regID = 1;
					for(i = 4; i < (4 + 2*REGMAP_SIZE_UDP); i += 2){
						return_buf[i] = (char)(regptr[regID] >> 8);
						return_buf[i+1] = (char)(regptr[regID]);
						regID++;
					}
					xil_printf("Command read_all_reg received\r\n");
					return (6 + 2*REGMAP_SIZE_UDP);
				}
				else return -1;
				break;
			case 2: // cmd ping
				if(start + 4 == end){
					xil_printf("Command ping received\r\n");
					return 6;
				}
				else return -1;
				break;
			case 3: // cmd start stream
				if(start + 4 == end){
					if(stream_flag){
						stream_flag = false;
						xil_printf("Command stop_stream received\r\n");
					}
					else{
						stream_flag = true;

						xil_printf("Command start_stream received\r\n");
						count_ttcps_timer = 0;
						count_scu_timer = 0;
						nbre_of_bytes = 0;
					}
					return 6;
				}
				else return -1;
				break;
			case 4: // cmd stop uC
				if(start + 4 == end){
					xil_printf("Command stop_uC received\r\n");
					run_flag = false;
					return 6;
				}
				else return -1;
				break;
			case 5: // set time
				if(start + 4 + 6 == end){
					offset_time.year = payload[4] + 2000;
					offset_time.month = payload[5];
					offset_time.day = payload[6];
					offset_time.hour = payload[7];
					offset_time.minute = payload[8];
					offset_time.second = payload[9];
					offset_time.milisecond = 0;
					settime_hm(&offset_time);
					xil_printf("Command settime received\r\n");
					return 6;
				}
				else return -1;
				break;
			case 6: // get data for the transfer function
				if(start + 4 == end){
					//xil_printf("Command get_transfer_fct received\r\n");
					get_transfer_fct_flag = true;
					return 6;
				}
				else return -1;
				break;
			case 7: // get 15 windows
				if(start + 4 == end){
				//	xil_printf("Command get_15_windows received\r\n");
	//				i = 4;
			//		nmbrWindows = payload[i];
			//		fstWindowValue = payload[i+1]*256 + payload[i+2];

				//	usleep(50);
		//			WriteRegister(TC_NBRWINDOW_REG, payload[i]);
			//		WriteRegister(TC_FSTWINDOW_REG, payload[i+1]*256 + payload[i+2]);
				//	usleep(150);


			//		xil_printf("%d,%d\r\n",payload[i], payload[i+1]*256 + payload[i+2]);
				    get_windows_flag = true;

					return 6;
				}
				else return -1;
				break;
			case 8: // cmd write ONE reg.
				if(start + 4 + 3 == end){
					i = 4;
				    regID_one_reg = payload[i];
	//				regVal = payload[i]*256 + payload[i+1];
				    regVal_one_reg = payload[i+1]*256 + payload[i+2];
			  //      xil_printf("regID_one_reg = %d\r\n", regID_one_reg);
				//    xil_printf("regVal_one_reg = %d\r\n", regVal_one_reg);
				    if(regID_one_reg == TC_FSTWINDOW_REG){
				    	fstWindowValue = regVal_one_reg;
						xil_printf("FSTWINDOW = %d\r\n", regVal_one_reg);

				         }
				    else if((regID_one_reg == TC_NBRWINDOW_REG)){
				    	nmbrWindows = regVal_one_reg;
						//xil_printf("NMBRWINDOWS = %d\r\n", regID_one_reg);

				   			         }
				    else if((regID_one_reg == TC_Delay_UpdateWR))
				    {
				    	delay_UpdateWR = regVal_one_reg;
						xil_printf("delay_UpdateWR = %d\r\n", delay_UpdateWR);

//								   			         }
//				    else if((regID_one_reg == DAC_VOLTAGE))
//				      {
//				          temp = (float) regVal_one_reg;
//				       VPED_ANALOG = temp/100;



				   }

				    else if((regID_one_reg == TOTAL_WINDOWS)){
				    	totalWindows = regVal_one_reg;
						//xil_printf("NMBRWINDOWS = %d\r\n", regID_one_reg);

				   			         }
				    else if((regID_one_reg == CHANNEL2SEND)){
				    	channel = regVal_one_reg;
						//xil_printf("NMBRWINDOWS = %d\r\n", regID_one_reg);

				   			         }

				    else if((regID_one_reg == TC_Delay_RB))
				  				    {
				  				    	delay_RB = regVal_one_reg;
				  						xil_printf("delay_RB = %d\r\n", delay_RB);
                                        regptr[TC_Delay_RB]= delay_RB;
				  				   }


				    else if((regID_one_reg == PEDESTAL_TRIGGER_AVG))

				 				  				    {

				 				  						xil_printf("PEDESTAL_TRIGGER_AVG = %d\r\n", regID_one_reg);
				                                         regptr[PEDESTAL_TRIGGER_AVG]= regVal_one_reg;
				 				  				   }


				    else
				    {
				        WriteRegister(regID_one_reg, regVal_one_reg);
				    			                     }
								return 6;
					}
				      else return -1;
										break;


			case 9:	// Pedestal
				if(start + 4 + 2 == end){
					i = 4;
					pedestalAvg = payload[i];
					nmbrWindowsPed = payload[i+1];
					xil_printf("pedestaAvg = %d\r\n", pedestalAvg);
					xil_printf("pedestalNmbrWindows = %d\r\n", nmbrWindowsPed);
					pedestal_flag = true;

					return 6;
					}

						else return -1;
						break;

			case 10:	// Pedestal triggermode
					if(start + 4 + 3 == end){
						i = 4;
						//value0 = payload[i];
						avg = payload[i+1]*256 + payload[i+2];
					//	pedestal_triggerMode_init(avg);
						regptr [PEDESTAL_TRIGGER_AVG]= avg;
						nbr_avg_ped_triggerMode= avg;
						usleep(10);
						pedestalTriggerModeFlag = true;
						usleep(30);
						ControlRegisterWrite(C_TRIGGER_MODE_PED_MASK,ENABLE);
						usleep(10);
						ControlRegisterWrite(C_TRIGGER_MODE_PED_MASK,DISABLE);
					//	pedestalTriggerModeFlag = true;
					//	xil_printf("Starting pedestals in trigger mode %d\r\n", avg);
//						pedestalTriggerModeFlag= true;
							return 6;
						}
						else return -1;
						break;

			case 11:	// restart ALL
						if(start + 4 == end){
						xil_printf("Command RESTART received\r\n");

						restart_flag = true ;
							return 6;
						}
						else return -1;
						break;

			case 12:	// flat pedestals
				if(start + 4 + 3 == end){
					i = 4;
					//value0 = payload[i];
					avg = payload[i+1]*256 + payload[i+2];
				//	pedestal_triggerMode_init(avg);
					regptr [PEDESTAL_TRIGGER_AVG]= avg;
					nbr_avg_ped_triggerMode= avg;
					usleep(10);
					pedestalTriggerModeFlag = false;
				//	usleep(30);
					ControlRegisterWrite(C_TRIGGER_MODE_PED_MASK,ENABLE);
				//    usleep(10);
					ControlRegisterWrite(C_TRIGGER_MODE_PED_MASK,DISABLE);

					//	pedestalTriggerModeFlag = true;
					xil_printf("Starting flat pedestals in trigger mode %d\r\n", avg);
//						pedestalTriggerModeFlag= true;
						return 6;
					}
					else return -1;
					break;
			case 13:	// error function problem asked
				if(start + 4 == end){
					 dividePedestalsFlag = true;
	          xil_printf("DividePedestal command received\r\n");

					return 6;
				}
				else return -1;
				break;
			case 14:	// error exception asked
				if(start + 4 == end){
					xil_printf("Print circular buffer\r\n");
	//				PrintInboundRingStatus(inboundRingManager);
					return 6;
				}
				else return -1;
				break;
			case 15:	// error assertion asked
				if(start + 4 == end){
					xil_printf("Command err_assertion received\r\n");
					simul_err_assertion_flag = true;
					return 6;
				}
				else return -1;
				break;





			default:
				return -1;

		}
	}
	else return -1;
}

/****************************************************************************/
/**
* @brief	Setup all the settings for the UDP communication (data and command)
*
* @param	pc_ipaddr: IP address of the computer
*
* @return	0 if ok, negative values if there is a problem
*
* @note		-
*
****************************************************************************/
int setup_udp_settings(ip_addr_t pc_ipaddr)
{
	int ret = 0;
	/* Initialize the regmap for test */
	for(int i = 0; i<REGMAP_SIZE_UDP; i++) regptr[i] = i;


	/* create new UDP PCB structure for the data */
	ret = setup_pcb_data(pc_ipaddr, PORT_DATA);
	if(ret < 0){
		xil_printf("set up the pcb for data failed, in function %s returned: %d\r\n", __func__, ret);
		return ret;
	}
	buf_data = pbuf_alloc(PBUF_TRANSPORT,MAX_DATA_SIZE,PBUF_RAM);

	/* create new UDP PCB structure for the commands */
	ret = setup_pcb_cmd(pc_ipaddr, PORT_CMD);
	if(ret < 0){
		xil_printf("set up the pcb for command failed, in function %s returned: %d\r\n", __func__, ret);
		return ret;
	}
	buf_cmd = pbuf_alloc(PBUF_TRANSPORT,MAX_CMD_SIZE,PBUF_RAM);

	return ret;
}

/****************************************************************************/
/**
* @brief	Setup the UDP Protocol Control Block for the data frame
*
* @param	pc_ipaddr: IP address of the computer
* @param	port: UDP port of the computer used for the data
*
* @return	0 if ok, negative values if there is a problem
*
* @note		-
*
****************************************************************************/
int setup_pcb_data(ip_addr_t pc_ipaddr, uint16_t port){

	err_t err;

	/* create new UDP PCB structure */
	pcb_data = udp_new_ip_type(IPADDR_TYPE_ANY);
	if (!pcb_data) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind zynq to specified @port */
	err = udp_bind(pcb_data, IP_ANY_TYPE, port); //bind = port we are listenning to (zynq input port)
	if (err != ERR_OK) {
		xil_printf("Unable to bind port %d: err = %d\n\r", port, err);
		return -2;
	}

	/*connect zynq to pc @ip addr & port*/
	err = udp_connect(pcb_data, &pc_ipaddr, port); // connect = the input port of the PC
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}

	return 0;
}

/****************************************************************************/
/**
* @brief	Setup the UDP Protocol Control Block for the command frame
*
* @param	pc_ipaddr: IP address of the computer
* @param	port: UDP port of the computer used for the command
*
* @return	0 if ok, negative values if there is a problem
*
* @note		-
*
****************************************************************************/
int setup_pcb_cmd(ip_addr_t pc_ipaddr, uint16_t port){
	err_t err;

	/* create new UDP PCB structure */
	pcb_cmd = udp_new_ip_type(IPADDR_TYPE_ANY);
	if (!pcb_cmd) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind to specified @port */
	err = udp_bind(pcb_cmd, IP_ANY_TYPE, port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind port %d: err = %d\n\r", port, err);
		return -2;
	}

	/*connect zynq to pc @ip addr & port*/
	err = udp_connect(pcb_cmd, &pc_ipaddr, port); // connect = the input port of the PC
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}

	/* connect the function udp_cmd_recv as the callback when a command is received*/
	udp_recv(pcb_cmd, udp_cmd_recv, NULL);
	return 0;
}

/****************************************************************************/
/**
* @brief	Disable and clean the UDP PCB for the data and the command
*
* @param	None
*
* @return	None
*
* @note		-
*
****************************************************************************/
void cleanup_udp(void){
	udp_disconnect(pcb_data);
	udp_remove(pcb_data);
	udp_remove(pcb_cmd);
}

/****************************************************************************/
/**
* @brief	Function to print an IP address with a message (used in debug mostly)
*
* @param	msg: pointer to the message to print before the IP address
* @param	ip: pointer to the IP address to print
*
* @return	None
*
* @note		-
*
****************************************************************************/
void print_ip(char *msg, ip_addr_t *ip)
{
	printf("%s", msg);
	printf("%d.%d.%d.%d\n\r", ip4_addr1(ip), ip4_addr2(ip),
			ip4_addr3(ip), ip4_addr4(ip));
}

/****************************************************************************/
/**
* @brief	Function to print all the settings of an Internet connection (used in debug mostly)
*
* @param	ip: pointer to the IP address to print
* @param	mask: pointer to the mask to print
* @param	gw: pointer to the gateway to print
*
* @return	None
*
* @note		-
*
****************************************************************************/
void print_ip_settings(ip_addr_t *ip, ip_addr_t *mask, ip_addr_t *gw)
{

	print_ip("Board IP: ", ip);
	print_ip("Netmask : ", mask);
	print_ip("Gateway : ", gw);
}

//
//
//
//
//	ControlRegisterWrite(SMODE_MASK ,ENABLE); // mode for selecting the interrupt, 1 for dma
//	usleep(100);
//
//	ControlRegisterWrite(SS_TPG_MASK ,ENABLE); // 0 for test pattern mode, 1 for sample mode (normal mode)
//	usleep(100);
//
//	ControlRegisterWrite(CPUMODE_MASK,ENABLE); // mode trigger, 0 for usermode (cpu mode), 1 for trigger mode
//
//	usleep(100);
//
//	xil_printf("flag_axidma_rx_done= %d \r\n",flag_axidma_rx_done);
//	usleep(100);
//
//	for (Windows_triggerMode=0; Windows_triggerMode<4;Windows_triggerMode++ ) {
//
//	XAxiDma_SimpleTransfer_hm((UINTPTR)first_element->data.data_array, SIZE_DATA_ARRAY_BYT);
//	XTime_GetTime(&tStart);
//	//sleep(10);
//	ControlRegisterWrite(WINDOW_MASK,ENABLE); //  register for starting the round buffer in trigger mode
//
//
//
//	Xil_DCacheInvalidateRange((UINTPTR)first_element->data.data_array, SIZE_DATA_ARRAY_BYT);
//
//	//////////////////////////////////////
//	timeout = 200000; // Timeout of 10 sec
//	printf("Waiting for the pulse...");
//
//	do{
//		/* If needed, update timefile */
//		if(flag_ttcps_timer){
//			update_timefile();
//			flag_ttcps_timer = false;
//		}
//
//		/* If needed, reload watchdog's counter */
//		if(flag_scu_timer){
//			XScuWdt_RestartWdt(&WdtScuInstance);
//			flag_scu_timer = false;
//		}
//
//		/* The DMA had a problem */
//		if(flag_axidma_error){
//			printf("Error with DMA interrupt: TPG !\r\n");
//			return XST_FAILURE;
//		}
//
//		usleep(0.1);
//		timeout--;
//		printf(".");
//	}while(!flag_axidma_rx_done || !timeout);
//	if (timeout==0) {
//		printf("\r\n timeout, trigger mode aborted\r\n");
//	}
//   /////////
////		while(!flag_axidma_rx_done){};
//	XTime_GetTime(&tEnd);
//
//	xil_printf("flag_axidma_rx_done= %d \r\n",flag_axidma_rx_done);
//	ControlRegisterWrite(PSBUSY_MASK,DISABLE);
//	flag_axidma_rx_done =false;
//	usleep(1);
// 	xil_printf("wdo_id=%d \r\n", (uint16_t)first_element-> data.data_struct.wdo_id );
// 	window=(uint16_t)first_element-> data.data_struct.wdo_id ;
// 	printf("Time1 %lld, Time2 %lld, Diff %lld\n\r", tEnd, tStart, tEnd-tStart);
//	printf( "XAxiDma_SimpleTransfer_hm took %.4f\n", 1.0*((tEnd - tStart) / (COUNTS_PER_SECOND/1000000)));
////
////                usleep(100);
////
////                for(i=0; i<16; i++){
////					for(j=0; j<32; j++){
////						/* Pedestal subtraction */
////						data_tmp = (uint16_t) (first_element->data.data_struct.data[i][j]);
////                        xil_printf(",%d",data_tmp);
////					}
////
////					//printf("\r\n");
////				}
////
////				usleep(1);
//
///* If data valid, send them to computer */
//	index = 0;
//	frame_buf[index++] = 0x55;
//	frame_buf[index++] = 0xAA;
//	frame_buf[index++] = (char)window;
//	frame_buf[index++] = (char)(window >> 8);
//
//	//printf("\r\n window = %d\r\n",window);
//	for(i=0; i<16; i++){
//		for(j=0; j<32; j++){
//			/* Pedestal subtraction */
//			data_tmp = (uint16_t) (first_element->data.data_struct.data[i][j]);//-  pedestal[window][i][j]+ offset_avoid_negative);
//
//			frame_buf[index++] = (char)data_tmp;
//			//printf("int_number = %d\r\n ", (char)(int_number));
//
//			frame_buf[index++] = (char)(data_tmp >> 8);
//			//printf("int_number >> 8 = %d\r\n", (char)((int_number >> 8)));
//
//		}
//
//		//printf("\r\n");
//	}
//	//printf("\r\n");
//	frame_buf[index++] = 0x33;
////    printf("Test\r\n");
//	frame_buf[index++] = 0xCC;
//	printf("%d\r\n", index);
//	transfer_data(frame_buf, index);
//
//
//
//
//
//	ControlRegisterWrite(PSBUSY_MASK,DISABLE);
//	//Windows_triggerMode++;
//	printf("Windows_triggerMode %d", Windows_triggerMode);
//	}
//    ControlRegisterWrite(WINDOW_MASK,DISABLE);
////				free(tmp_ptr_main);
////				tmp_ptr_main= NULL;
//
//	usleep(100);
//    xil_printf("after freeing ptr\r\n");
//
//    for(i=0; i<16; i++){
//		for(j=0; j<32; j++){
//			/* Pedestal subtraction */
//			tmp_ptr_main->data.data_struct.data[i][j]=0;
//		}
//    }
//}
//





