/**
 * @file 	main.c
 * @author	Anthony Schluchin
 * @date	16th November 2018
 * @version 0.0
 */

#include <stdint.h>
#include "lwip/init.h"
#include "netif/xadapter.h"
#include "platform_config.h"
#include "xparameters.h"
#include "udp_peripheral.h"
#include "axis_peripheral.h"
#include "file_hm.h"
#include "global.h"
//#include "iic_DAC_LTC2657.h"
#include "pedestal.h"
#include "xscuwdt.h"
//#include "xiicps.h"
#include "get_15_windows.h"
#include "get_transfer_fct.h"
#include "transfer_function.h"
#include "xtime_l.h"
#include "data_analysis.h"
#include "I2C_bit_banging.h"
#include "gpio_ctrl.h"
//#include "gpio_ctrl.h"
/**************** External global variables ****************/
/*********************************************************/
/** @brief Pointer on the network interface */
extern struct netif *echo_netif;
/** @brief Flag reset when the user send the command "stop uC" */
extern volatile bool run_flag;
/** @brief Flag raised when the user send the command "start streaming" */
extern volatile bool stream_flag;
/** @brief Flag raised when the Triple Timer Counter overflows */
extern volatile bool flag_ttcps_timer;
/** @brief Flag raised when the SCU timer overflows*/
extern volatile bool flag_scu_timer;
/** @brief Flag raised when AXI-DMA has an error */
extern volatile bool flag_axidma_error;
/** @brief Instance of the device watchdog */
extern XScuWdt WdtScuInstance;
/** @brief Flag raised when the program has entered the while loop */
extern volatile bool flag_while_loop;
/** @brief Array of flag, one for each PMT */
extern int flag_axidma_rx[4];
/** @brief Array containing registers of AXI-lite */
extern int* regptr;
/** @brief Flag raised when the user send the command "get transfer function" */
extern volatile bool get_transfer_fct_flag;
/** @brief Flag raised when the user send the command "get windows" */
extern volatile bool get_windows_flag;

/** @brief Flag raised when the user send the command "get windows raw data" */
extern volatile bool get_windows_raw_flag;

extern volatile bool restart_flag;


/** @brief Flag raised when a pedestal value is required by the user */
extern volatile bool pedestal_flag;


/** @brief Flag true when the list is empty (first_element = last_element) */
extern volatile bool empty_flag;
/** @brief Pointer on the first element of the list used in trigger mode */
extern data_list* first_element;
/** @brief Flag raised when AXI-DMA has finished an transfer, in OnDemand mode */
extern volatile bool flag_axidma_rx_done;
//******** To test the error detection********************/
/** @brief Flag raised when the user want to test the autonomous side of the system with a watchdog */
extern volatile bool simul_err_watchdog_flag;
/** @brief Flag raised when the user want to test the autonomous side of the system */
extern volatile bool simul_err_function_prob_flag;
/** @brief Flag raised when the user want to test the autonomous side of the system with a exception */
extern volatile bool simul_err_exception_flag;
/** @brief Flag raised when the user want to test the autonomous side of the system with a assertion */
extern volatile bool simul_err_assertion_flag;
/** @brief UDP Protocol Control Block for command communication */
/** @brief Flag raised for UDP connection restart */
extern volatile bool restart_UDP_flag;

extern struct udp_pcb *pcb_cmd;
/** @brief Buffer structure used to send command packet */
extern struct pbuf *buf_cmd;

/** Number of iterations for the average in pedestal calculation**/
extern int pedestalAvg;

/** Value from the GUI for the number of windows for pedestal calculation   */
extern int nmbrWindowsPed;
///** Value from the GUI for voltage value for comparators and vped  */
//extern int VPED_ANALOG;

/** @brief Buffer used to send the data (50 bytes above it reserved for protocol header) */
 extern char* frame_buf;

 /* data structure from PL */
 extern InboundRingManager_t inboundRingManager;

 /** Flag to start pedestal mode pedestal acquisition */
 extern bool pedestalTriggerModeFlag;

 /**number of average for pedestals in trigger mode*/
 extern int nbr_avg_ped_triggerMode;
 /** Flag to start division by  nbr_avg_ped_triggerMode */
 extern bool dividePedestalsFlag;

 extern int *regptr_0;

 extern int *regptr_1;

/*********************** Global variables ****************/
/*********************************************************/
/** @brief Network interface */
static struct netif server_netif;

/*** Type definition *************************************************/
/*********************************************************************/
/**
 * @brief This is the enumeration of the process to stop when exiting the program
 */
typedef enum clean_state_enum {
	GLOBAL_VAR=0x1,	/**< Free the global variable reserved in function init_global_var */
	LOG_FILE=0x2,	/**< From this step, problem can be logged */
	INTERRUPT=0x4,	/**< Stop the interrupt */
	UDP=0x8,		/**< Close both of the UDP communications */
} clean_state_en;
/**
 * @brief This is the enumeration of the state machine
 */
typedef enum dma_stm_enum{
	IDLE, 				/**< No data to send, waiting on a command */
	STREAM,				/**< System in mode streaming */
	GET_TRANSFER_FCT, 	/**< System sending the data for the transfer function in response to the corresponding command */
	GET_WINDOWS,		/**< System sending the data of consecutive windows in response to the corresponding command */
	GET_PEDESTAL,      /**< System getting the pedestal for an specific voltage and nmbr of windows, data saved into the pedestal variable */
	GET_WINDOWS_RAW,   /**< System getting the pedestal for an specific voltage and nmbr of windows, dat */
	DIVIDE_PEDESTALS,
	RESTART,           /**< Restart main() */
} dma_stm_en;


/*** Function prototypes *********************************************/
void end_main(clean_state_en state, char* error_txt);
void updateInboundCircBuffer();
void restart(void);
int s;
__attribute__((section(".ps7_ddr_0"))) data_axi  DDR_incoming_waveform_ring_buffer[INBOUND_RING_BUFFER_LENGTH_IN_PACKETS];

void clearInboundBuffer(void) {
	memset( (void *) DDR_incoming_waveform_ring_buffer, 0, MAX_INBOUND_PACKET_BYTES  * INBOUND_RING_BUFFER_LENGTH_IN_PACKETS );
}

int main()
{
//	XTime tStart, tEnd;
//    int i,j;
//    int timeout;
//    int index;
//    int window;
//	uint16_t data_tmp, data_tmp2;
//	int Windows_triggerMode;
//    int cnt_avg_number=0;

	//static XTime tStart, tEnd;
	ip_addr_t ipaddr, netmask, gw, pc_ipaddr;
	//int pmt;
    data_list* tmp_ptr_main  = (data_list *)malloc(sizeof(data_list));
           	if(!tmp_ptr_main){
           		printf("malloc for tmp_ptr failed in function, %s!\r\n", __func__);
           		return XST_FAILURE;
           	}
	dma_stm_en state_main = IDLE;

	/* the mac address of the board. this should be unique per board */
	unsigned char mac_ethernet_address[] = { 0x00, 0x0a, 0x35, 0x00, 0x01, 0x02 };

//	int cnt_pedestal_windows =0;

	xil_printf("\n\r\n\r------START------\r\n");

	/* Initialize the global variables */
	if(init_global_var() == XST_SUCCESS) xil_printf("Global variables initialization pass!\r\n");
	else{
		end_main(GLOBAL_VAR, "Global variables initialization failed!");
		return -1;
	}

	/* Initialize "echo_netif" to avoid warnings with function "xemac_add" */
	echo_netif = &server_netif;

	/* Mount SD Card and create log file */
	FRESULT result = mount_sd_card();
	if (result == FR_OK) xil_printf("Mounting SD card pass!\r\n");
	else{
		end_main(GLOBAL_VAR, "Mounting SD card failed!");
		return -1;
	}
	/* Create log file */
	if(create_logfile() == FR_OK) xil_printf("Log file creation pass!\r\n");
	else{
		end_main(GLOBAL_VAR, "Log file creation failed!");
		return -1;
	}

	/* Create time file */
	if(create_timefile() == FR_OK) xil_printf("Time file creation pass!\r\n");
	else{
		end_main(GLOBAL_VAR, "Time file creation failed!");
		return -1;
	}

	/* Initialize the devices timer, axidma, ... */
	if(devices_initialization() == XST_SUCCESS) xil_printf("Devices initialization pass!\r\n");
	else{
		end_main(GLOBAL_VAR | LOG_FILE, "Devices initialization failed!");
		return -1;
	}

	/* Initialize the interrupts */
	if(interrupts_initialization() == XST_SUCCESS) xil_printf("Interrupts initialization pass!\r\n");
	else{
		end_main(GLOBAL_VAR | LOG_FILE, "Interrupts initialization failed!");
		return -1;
	}

	/* Initialize the LWip */
	lwip_init();

	/* now enable interrupts */
	enable_interrupts();
//
//	/* Initialize the DAC (Vped, Comparator value) */
	if(gpio_init() == XST_SUCCESS) xil_printf("DAC initialization pass!\r\n");
	else{
		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT, "DAC initialization failed!");
		return -1;
	}

	if(set_DAC_CHANNEL(DAC_GRP_0,THRESHOLD_CMP_0) != XST_SUCCESS){
		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT, "DAC: setting group threshold PMT 0 voltage failed!");
		return -1;
	}
	if(set_DAC_CHANNEL(DAC_GRP_1,THRESHOLD_CMP_1) != XST_SUCCESS){
		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT, "DAC: setting group threshold PMT 1 voltage failed!");
		return -1;
	}
	if(set_DAC_CHANNEL(DAC_GRP_2,THRESHOLD_CMP_2) != XST_SUCCESS){
		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT, "DAC: setting group threshold PMT 2 voltage failed!");
		return -1;
	}
	if(set_DAC_CHANNEL(DAC_GRP_3,THRESHOLD_CMP_3) != XST_SUCCESS){
		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT, "DAC: setting group threshold PMT 3 voltage failed!");
		return -1;
	}
	if(set_DAC_CHANNEL(DAC_GRP_4,THRESHOLD_CMP_4) != XST_SUCCESS){
		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT, "DAC: setting group threshold PMT 0 voltage failed!");
		return -1;
	}
	if(set_DAC_CHANNEL(DAC_GRP_5,THRESHOLD_CMP_5) != XST_SUCCESS){
		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT, "DAC: setting group threshold PMT 1 voltage failed!");
		return -1;
	}
	if(set_DAC_CHANNEL(DAC_GRP_6,THRESHOLD_CMP_6) != XST_SUCCESS){
		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT, "DAC: setting group threshold PMT 2 voltage failed!");
		return -1;
	}
	if(set_DAC_CHANNEL(DAC_GRP_7,THRESHOLD_CMP_7) != XST_SUCCESS){
		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT, "DAC: setting group threshold PMT 2 voltage failed!");
		return -1;
	}
   usleep(30);
	if(set_DAC_CHANNEL_8574(VPED_ANALOG) != XST_SUCCESS){
	    end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT, "DAC: setting Vped voltage failed!");
		return -1;
	}

	/* Add network interface to the netif_list, and set it as default */
	ipaddr.addr = 0;
	gw.addr = 0;
	netmask.addr = 0;
	if (!xemac_add(echo_netif, &ipaddr, &netmask, &gw, mac_ethernet_address, PLATFORM_EMAC_BASEADDR)) {
		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT, "Error adding N/W interface");
		return -1;
	}

	/* specify that the network if is up */
	netif_set_default(echo_netif);
	netif_set_up(echo_netif);

	/* initliaze IP addresses to be used */
	IP4_ADDR(&(echo_netif->ip_addr),  192, 168,   1, 10);
	IP4_ADDR(&(echo_netif->netmask), 255, 255, 255,  0);
	IP4_ADDR(&(echo_netif->gw),      192, 168,   1,  1);
	ipaddr.addr = echo_netif->ip_addr.addr;
	gw.addr = echo_netif->gw.addr;
	netmask.addr = echo_netif->netmask.addr;
	print_ip_settings(&ipaddr, &netmask, &gw);

	/* Set the PC address */
	IP4_ADDR(&pc_ipaddr, 192, 168, 1, 11);
	print_ip("\r\nPC IP: ", &pc_ipaddr);

	/* Set the UDP connections and callback for data and commands */
	if(setup_udp_settings(pc_ipaddr) < 0){
		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT, "Error setting up the UDP interface");
		return -1;
	}
	else xil_printf("UDP started @ port %d for data and @ port %d for commands\n\r", PORT_DATA, PORT_CMD);

	/* TC_0 */

	// Initialise control register
	if (ControlRegisterWrite((int)NULL,INIT, regptr_0) != XST_SUCCESS) {
		printf("Control register Failed\r\n");
	}
	usleep(100000);

	// software reset PL side

	if (ControlRegisterWrite(SWRESET_MASK,DISABLE, regptr_0) != XST_SUCCESS) {
		printf("Control register Failed\r\n");
	}
	usleep(100000);
	// Reset TargetC's registers
	if (ControlRegisterWrite(REGCLR_MASK,DISABLE, regptr_0) != XST_SUCCESS) {
		printf("Control register Failed\r\n");
	}
	usleep(100000);
	if (ControlRegisterWrite(SWRESET_MASK,ENABLE, regptr_0) != XST_SUCCESS) {
		printf("Control register Failed\r\n");
	}
	usleep(1000);

	// Waiting on PL's clocks to be ready
	while((regptr_0[TC_STATUS_REG] & LOCKED_MASK) != LOCKED_MASK){
		sleep(1); //sleep 100ms
	}

	/* TC_1 */
	usleep(100000);


	if (ControlRegisterWrite((int)NULL,INIT, regptr_1) != XST_SUCCESS) {
		printf("Control register Failed\r\n");
	}
	usleep(100000);

	// software reset PL side

	if (ControlRegisterWrite(SWRESET_MASK,DISABLE, regptr_1) != XST_SUCCESS) {
		printf("Control register Failed\r\n");
	}
	usleep(100000);
	// Reset TargetC's registers
	if (ControlRegisterWrite(REGCLR_MASK,DISABLE, regptr_1) != XST_SUCCESS) {
		printf("Control register Failed\r\n");
	}
	usleep(100000);
	if (ControlRegisterWrite(SWRESET_MASK,ENABLE, regptr_1) != XST_SUCCESS) {
		printf("Control register Failed\r\n");
	}
	usleep(1000);


	while((regptr_1[TC_STATUS_REG] & LOCKED_MASK) != LOCKED_MASK){
		sleep(1); //sleep 100ms
	}


	printf("PL's clock ready\r\n");
//	 Initialize TargetC's registers
		if(SetTargetCRegisters(regptr_0) !=XST_SUCCESS){
			end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "TestPattern Generator failed!");
			return -1;
		}

		usleep(100000);

		//	 Initialize TargetC's registers
		if(SetTargetCRegisters(regptr_1) !=XST_SUCCESS){
			end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "TestPattern Generator failed!");
			return -1;
		}

	printf("sleep to set the debug core\r\n");
	sleep(1);
//
//
//	// Test pattern
//	if(test_TPG() == XST_SUCCESS) printf("TestPattern Generator pass!\r\n");
////	else{
////		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "TestPattern Generator failed!");
////		return -1;
////	}
//    sleep(5);
//


	/* Initialize pedestal
	if(get_pedestal(50, 1) == XST_SUCCESS) printf("Pedestal initialization pass!\r\n");
//	if(init_pedestals() == XST_SUCCESS) printf("Pedestal initialization pass!\r\n");

	else{
		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "Pedestal initialization failed!");
		return -1;
	}*/

//	/* Initialize transfer function coefficients */
//	if(init_transfer_function() == XST_SUCCESS) printf("Transfer function initialization pass!\r\n");
//	else{
//		end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "Transfer function initialization failed!");
//		return -1;
//	}

/*
	// Sweep over SSTOUTFB to get 1.6V in VADJN
	for (s=59;s<126;s++){
    	WriteRegister(TC_SSTOUTFB_REG, s);
    	sleep(.1);
    }
	usleep(100);
*/
	//get_pedestal(100,4);
	flag_while_loop = true;
	//pedestal_triggerMode_init();
	usleep(100);
	printf("Start while loop\r\n");
	while (run_flag){
		/* Simulate a infinity loop to trigger the watchdog  */
		if(simul_err_watchdog_flag){
			while(1);
		}

		/* Simulate a function which has a problem */
		if(simul_err_function_prob_flag){
			end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "Error function problem ask from user (simulation of function return error!)");
			return -1;
		}

		/* Simulate a exception */
		if(simul_err_exception_flag){
			char* ptr = (char *)pcb_cmd;
			for(int g=0; g<sizeof(struct udp_pcb); g++) ptr[g] = 0;
			udp_send(pcb_cmd, buf_cmd);
		}

		/* Simulate a assertion */
		if(simul_err_assertion_flag){
			Xil_Assert(__FILE__, __LINE__);
		}

		/* If needed, update timefile */
		if(flag_ttcps_timer){
			update_timefile();
			flag_ttcps_timer = false;
		}

		/* If needed, reload watchdog's counter */
		if(flag_scu_timer){
			XScuWdt_RestartWdt(&WdtScuInstance);
			flag_scu_timer = false;
		}

		if(flag_axidma_error){
			end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "AXI-DMA failed!");
			return -1;
		}
		switch(state_main){
			case IDLE:
				if(stream_flag){
				//	xil_printf("From IDLE to STREAM");

					state_main = STREAM;
				}
				if(get_transfer_fct_flag && (!stream_flag) && empty_flag){
					if (ControlRegisterWrite(CPUMODE_MASK,DISABLE, regptr_0) != XST_SUCCESS) {
						printf("Control register Failed\r\n");
					}
					if (ControlRegisterWrite(CPUMODE_MASK,DISABLE, regptr_1) != XST_SUCCESS) {
						printf("Control register Failed\r\n");
					}



					state_main = GET_TRANSFER_FCT;
				}
				if(get_windows_flag && (!stream_flag) && empty_flag){
					if (ControlRegisterWrite(CPUMODE_MASK,DISABLE, regptr_0) != XST_SUCCESS) {
						printf("Control register Failed\r\n");
					}
					if (ControlRegisterWrite(CPUMODE_MASK,DISABLE, regptr_1) != XST_SUCCESS) {
						printf("Control register Failed\r\n");
					}

					state_main = GET_WINDOWS;
				}
				if(pedestal_flag && (!stream_flag) && empty_flag){
					if (ControlRegisterWrite(CPUMODE_MASK,DISABLE, regptr_0) != XST_SUCCESS) {
						printf("Control register Failed\r\n");
					}
					if (ControlRegisterWrite(CPUMODE_MASK,DISABLE, regptr_1) != XST_SUCCESS) {
						printf("Control register Failed\r\n");
					}
					state_main = GET_PEDESTAL;
				}
				if(restart_flag){
					if (ControlRegisterWrite(CPUMODE_MASK,DISABLE, regptr_0) != XST_SUCCESS) {
						printf("Control register Failed\r\n");
					}
					if (ControlRegisterWrite(CPUMODE_MASK,DISABLE, regptr_1) != XST_SUCCESS) {
						printf("Control register Failed\r\n");
					}
								printf("restarting at idle\r\n");
								state_main = RESTART;
							}
				if(get_windows_raw_flag && (!stream_flag) && empty_flag){
					if (ControlRegisterWrite(CPUMODE_MASK,DISABLE, regptr_0) != XST_SUCCESS) {
						printf("Control register Failed\r\n");
					}
					if (ControlRegisterWrite(CPUMODE_MASK,DISABLE, regptr_1) != XST_SUCCESS) {
						printf("Control register Failed\r\n");
					}

						state_main = GET_WINDOWS_RAW;
					}
				if(dividePedestalsFlag){
					state_main = DIVIDE_PEDESTALS;
					}
				break;
			case STREAM:
				if((!stream_flag)){
					if (ControlRegisterWrite(SWRESET_MASK,DISABLE, regptr_0) != XST_SUCCESS) {
						printf ("Control register Failed\r\n");
					}
					if (ControlRegisterWrite(SWRESET_MASK,DISABLE, regptr_1) != XST_SUCCESS) {
						printf("Control register Failed\r\n");
					}

					state_main = IDLE;
				}

				if (ControlRegisterWrite(SMODE_MASK,ENABLE, regptr_0) != XST_SUCCESS) {
					printf("Control register Failed\r\n");
				}
				if (ControlRegisterWrite(SMODE_MASK,ENABLE, regptr_1) != XST_SUCCESS) {
					printf("Control register Failed\r\n");
				}

				if (ControlRegisterWrite(SS_TPG_MASK,ENABLE, regptr_0) != XST_SUCCESS) {
					printf("Control register Failed\r\n");
				}
				if (ControlRegisterWrite(SS_TPG_MASK,ENABLE, regptr_1) != XST_SUCCESS) {
					printf("Control register Failed\r\n");
				}

				if (ControlRegisterWrite(CPUMODE_MASK,ENABLE, regptr_0) != XST_SUCCESS) {
					printf("Control register Failed\r\n");
				}
				if (ControlRegisterWrite(CPUMODE_MASK,ENABLE, regptr_1) != XST_SUCCESS) {
					printf("Control register Failed\r\n");
				}


				usleep(100);


				xil_printf("flag_axidma_rx_done= %d \r\n",flag_axidma_rx_done);
				usleep(100);



				// setup inbound and outbound circular waveform/packet buffers
				memset((void *) (&inboundRingManager), 0, sizeof(inboundRingManager));
				inboundRingManager.writePointer        = DDR_incoming_waveform_ring_buffer;
				inboundRingManager.procPointer         = inboundRingManager.writePointer;
				inboundRingManager.firstAllowedPointer = inboundRingManager.writePointer;
				inboundRingManager.lastAllowedPointer  = inboundRingManager.writePointer + (INBOUND_RING_BUFFER_LENGTH_IN_PACKETS - 1);
				PrintInboundRingStatus(inboundRingManager);

				printf("after inboundRingManager init \r\n");
				usleep(100);
				clearInboundBuffer();
				usleep(100);
				// INIT PEDESTALS

			///	PrintInboundRingStatus(inboundRingManager);
				usleep(100);


				XAxiDma_SimpleTransfer_hm((UINTPTR)inboundRingManager.writePointer , SIZE_DATA_ARRAY_BYT);
			     usleep(100);
			     if (ControlRegisterWrite(WINDOW_MASK,ENABLE, regptr_0) != XST_SUCCESS) {   //register for starting the round buffer in trigger mode
					printf("Control register Failed\r\n");
			     }
			     if (ControlRegisterWrite(WINDOW_MASK,ENABLE, regptr_1) != XST_SUCCESS) {
					printf("Control register Failed\r\n");
			     }


				 Xil_DCacheInvalidateRange((UINTPTR)inboundRingManager.writePointer , SIZE_DATA_ARRAY_BYT);
					usleep(100);
			     xil_printf(" pendingCountBefore: %d \r\n",inboundRingManager.pendingCount);
			     usleep(100);
				printf("after inboundRingManager print, starting while loop \r\n");
				 usleep(100);

			//	 XTime_GetTime(&tStart);
				 while(stream_flag) {
						if(inboundRingManager.pendingCount > 0) {
							if (pedestalTriggerModeFlag == true) {
                            pedestal_triggerMode_getArrays(&(inboundRingManager));
							}
							if (pedestalTriggerModeFlag != true) {
								udp_transfer_WM( &(inboundRingManager));
							}

							Xil_DCacheInvalidateRange((UINTPTR)inboundRingManager.writePointer , SIZE_DATA_ARRAY_BYT);
						     updateInboundCircBuffer();

						//     Xil_DCacheInvalidateRange((UINTPTR)inboundRingManager.writePointer , SIZE_DATA_ARRAY_BYT);
						//     ControlRegisterWrite(PSBUSY_MASK,DISABLE);

							/* Wait on DMA transfer to be done */
					//	timeout = 200000;
						}

//							/* If needed, update timefile */
//							if(flag_ttcps_timer){
//								update_timefile();
//								flag_ttcps_timer = false;
//							}

							/* If needed, reload watchdog's counter */
							if(flag_scu_timer){
								XScuWdt_RestartWdt(&WdtScuInstance);
								flag_scu_timer = false;
							}

							/* The DMA had a problem */
//							if(flag_axidma_error){
//								printf("Error with DMA interrupt: TPG !\r\n");
//								return XST_FAILURE;
//
//					    	}
//							printf("inboundRingManager.pendingCount %d \r\n", (uint16_t)(inboundRingManager.pendingCount));

						}



				stream_flag= FALSE;
			//	XTime_GetTime(&tEnd);
				usleep(100);
				printf("leaving trigger mode\r\n");
			    xil_printf("p %d \r\n", (uint16_t)(inboundRingManager.processedCount));
				PrintInboundRingStatus(inboundRingManager);
			//	printf("Time1 %lld, Time2 %lld, Diff %lld \r\n", tStart, tEnd, tEnd-tStart);
				state_main = IDLE;
				clearInboundBuffer();

				break;
			case GET_TRANSFER_FCT:
				if(send_data_transfer_fct(regptr_0) == XST_SUCCESS) printf("Recover data pass!\r\n");
				else{
					end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "Recover data failed!");
					return -1;
				}
				get_transfer_fct_flag = false;
				state_main = IDLE;
				break;
			case GET_WINDOWS:
				if(PulseSweep() != XST_SUCCESS){// printf("Get a 15 windows pass!\r\n");
				//else{
					end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "Get a 15 windows failed!");
				return -1;
				}
				get_windows_flag = false;
				state_main = IDLE;
				break;
			case GET_WINDOWS_RAW:
				xil_printf("NADA\r\n");
				//if(get_windows_raw() != XST_SUCCESS){// printf("Get a 15 windows pass!\r\n");
				//else{
				//	end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "Get a 15 windows failed!");
				//return -1;
				//}
				get_windows_flag = false;
				state_main = IDLE;
				break;
			case GET_PEDESTAL:
				ControlRegisterWrite(SMODE_MASK ,ENABLE,  regptr_0);
				usleep(100000);
				ControlRegisterWrite(SMODE_MASK ,ENABLE,  regptr_1);
				usleep(100000);
				ControlRegisterWrite(SS_TPG_MASK ,ENABLE, regptr_0);
				usleep(100000);
				ControlRegisterWrite(SS_TPG_MASK ,ENABLE, regptr_1);
				usleep(100000);


//				if(get_pedestal(pedestalAvg,nmbrWindowsPed) == XST_SUCCESS) printf("Pedestal pass! pedestalAvg= %d,nmbrWindowsPed = %d, \r\n", pedestalAvg, nmbrWindowsPed);
//				else{
//					end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "Get pedestal failed!");
//					return -1;
//				}
//
//				if(get_windowsRaw(0,1) == XST_SUCCESS) printf("Pedestal pass! pedestalAvg= %d,nmbrWindowsPed = %d, \r\n", pedestalAvg, nmbrWindowsPed);
//				else{
//					end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "Get pedestal failed!");
//					return -1;
//				}


				if(get_windowsRaw(3,1) == XST_SUCCESS) printf("Pedestal pass! pedestalAvg= %d,nmbrWindowsPed = %d, \r\n", pedestalAvg, nmbrWindowsPed);
				else{
					end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "Get pedestal failed!");
					return -1;
				}

//

				pedestal_flag = false;
				state_main = IDLE;
				break;
			case DIVIDE_PEDESTALS:
			    if(dividePedestalsFlag) {
			     divideByAverageNumber();
			     usleep(10);
			     dividePedestalsFlag=false;

			    printf("Restarting");
			    }
				break;
			case RESTART:
			    if(restart_flag) {
				restart_flag = false;
			    restart();

			    printf("Restarting");
			    }
				break;
			default:
				state_main = IDLE;
				break;
		}
	}

	/* Close and clear everything */
	cleanup_interrupts(true);
	cleanup_udp();
	cleanup_global_var();
	printf("-------END-------\r\n");

	return 0;
}

void updateInboundCircBuffer() {
	disable_interrupts();
 //   xil_printf("inboundRingManager.pendingCount %d \r\n", (uint16_t)(inboundRingManager.pendingCount));
	inboundRingManager.pendingCount--; // updated in interrupt handler, so have to be careful here
	inboundRingManager.processedCount++;
	// Reset circ buffer if out of bounds
	if(inboundRingManager.procPointer < inboundRingManager.lastAllowedPointer) {
		(inboundRingManager.procPointer)++;
		(inboundRingManager.procLocation)++;
	} else {
		inboundRingManager.procPointer  = inboundRingManager.firstAllowedPointer;
		inboundRingManager.procLocation = 0;
	}
  //  xil_printf("inboundRingManager.pendingCount %d \r\n", (uint16_t)(inboundRingManager.pendingCount));
   // xil_printf("inboundRingManager.processedCount %d \r\n", (uint16_t)(inboundRingManager.processedCount));
    enable_interrupts();
}


void end_main(clean_state_en state, char* error_txt){
	char text[100];

	sprintf((char *)text, "In main: %s", error_txt);
	if(state & GLOBAL_VAR) cleanup_global_var();
	if(state & INTERRUPT) cleanup_interrupts(false);
	if(state & UDP) cleanup_udp();
	if(state & LOG_FILE){
		log_event(text, strlen(text));
	}
	else xil_printf("%s\r\n", text);

	xil_printf("-------END-------\r\n");
	sleep(1); // to see the xil_printf
	// SYSTEM RESET
	system_reset_hm();
	main();
}


void restart(void){
    printf("restarting");
	usleep(1);
	end_main(GLOBAL_VAR | LOG_FILE | INTERRUPT | UDP, "Restart!");
	main();

}
