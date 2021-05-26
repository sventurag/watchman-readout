/**
 * @file 	get_1000_windows.c
 * @author	Anthony Schluchin
 * @date	21st January 2019
 * @version 0.0
 */


#include "get_15_windows.h"

/**************** Extern global variables ****************/
/*********************************************************/
/** @brief Array containing registers of AXI-lite */
//extern int* regptr;
/** @brief Flag raised when AXI-DMA has an error */
extern volatile bool flag_axidma_error;
/** @brief Flag raised when AXI-DMA has finished an transfer, in OnDemand mode */
extern volatile bool flag_axidma_rx_done;
/** @brief Array containing the pedestal correction for every sample */
extern uint32_t  pedestal[512][16][32];
/** @brief Array containing the pedestal correction for every sample TARGETC_0 */
extern uint32_t  pedestal_0[512][16][32];
/** @brief Array containing the pedestal correction for every sample TARGETC_1 */
extern uint32_t  pedestal_1[512][16][32];

/** @brief Buffer used to send the data (50 bytes above it reserved for protocol header) */
extern char* frame_buf;
/** @brief Lookup table to correct the transfer function */
extern uint16_t lookup_table[2048];
/** @brief Flag raised when the Triple Timer Counter overflows */
extern volatile bool flag_ttcps_timer;
/** @brief Flag raised when the SCU timer overflows*/
extern volatile bool flag_scu_timer;
/** @brief Instance of the device watchdog */
extern XScuWdt WdtScuInstance;
/** Value from the GUI for first window   */
extern int fstWindowValue;
/** Value from the GUI for the number of windows per iteration  */
extern int nmbrWindows;
/** Value from the GUI for the total number of windows   */
extern int totalWindows;
/** Value from the GUI for the channel to send over the udp   */
extern int channel;
/** Value from the GUI for delay in update WR   */
//extern int  delay_UpdateWR;

/** Raw data for pedestal calculation   */
extern uint32_t  data_raw_0[512][16][32];

extern uint32_t  data_raw_1[512][16][32];

/** @brief Array containing registers of AXI-lite for TARGETC_0 */
extern int* regptr_0;
/** @brief Array containing registers of AXI-lite TARGETC_1 */
extern int* regptr_1;

/****************************************************************************/
/**
* @brief	Pulse sweep
*
* @param	-
*
* @return	XST_SUCCESS or XST_FAILURE (defined in xstatus.h)
*
* @note		Requires that variables fstWindowValue, totalWindows and nmbrWindows to be updated
*
****************************************************************************/

int PulseSweep(){
int rep;


	for ( rep =0; rep<1 ; rep++ ){
		if(PulseRange()!= XST_SUCCESS){
	       xil_printf("Error in WindowRange \r\n");
		}
	//	usleep(150);
	}
	return XST_SUCCESS;
};







/****************************************************************************/
/**
* @brief   Selecting the window range to do the Pulse Sweep.
* This function allows specify the number of windows to be digitized in each iteration
*
* @param	-
*
* @return	XST_SUCCESS or XST_FAILURE (defined in xstatus.h)
*
* @note		Requires that variables fstWindowValue, totalWindows and nmbrWindows to be updated
*
****************************************************************************/

int PulseRange(){
int fstWindow;
ControlRegisterWrite(SMODE_MASK ,ENABLE,  regptr_0);
usleep(10);
ControlRegisterWrite(SMODE_MASK ,ENABLE,  regptr_1);
usleep(10);
ControlRegisterWrite(SS_TPG_MASK ,ENABLE, regptr_0);
usleep(10);
ControlRegisterWrite(SS_TPG_MASK ,ENABLE, regptr_1);
usleep(10);


	for (fstWindow=fstWindowValue ; fstWindow<totalWindows ; fstWindow+=nmbrWindows ){
		if(SendWindows(fstWindow,nmbrWindows)!= XST_SUCCESS){
	       xil_printf("Error in SendWindows \r\n");

		}
	//	usleep(30);
	}
	return XST_SUCCESS;
};









/****************************************************************************/
/**
* @brief	Recover consecutive windows and send them to the computer
*
* @param	-
*
* @return	XST_SUCCESS or XST_FAILURE (defined in xstatus.h)
*
* @note		-
*
****************************************************************************/
int SendWindows(int firstWindow, int numWindows){
	//int window_start;
	int timeout;
	int window,i,j,index;
	uint16_t data_tmp;
	//uint16_t int_number;
	//float float_decimal;
	//uint16_t int_decimal;
	//int pedestal_avg = 1;
    int offset_avoid_negative=200;
	/* Create an element for the DMA */
	data_list* tmp_ptr  = (data_list *)malloc(sizeof(data_list));
/*
	if(!tmp_ptr){
		printf("malloc for tmp_ptr failed in function, %s!\r\n", __func__);
		return XST_FAILURE;
	}
	tmp_ptr->next = NULL;
	tmp_ptr->previous = NULL;
*/
	/* First window */
	//window_start = fstWindowValue;
     //usleep(10);
    //printf("fstWindow %d \r\n", firstWindow);
	/* Number of windows */
	//nmbrWindows = 16;


	/* Give the element's address to the DMA */
//	 XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);
//	 Xil_DCacheInvalidateRange((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);
   // usleep(10);
	/* Initiate transfer and measure */
	regptr_0[TC_FSTWINDOW_REG] = firstWindow;
	usleep(1);
	regptr_0[TC_NBRWINDOW_REG] = numWindows;
	usleep(1);
	regptr_1[TC_FSTWINDOW_REG] = firstWindow;
	usleep(1);
	regptr_1[TC_NBRWINDOW_REG] = numWindows;
	usleep(1);

	//	ControlRegisterWrite(SMODE_MASK ,ENABLE);
//	ControlRegisterWrite(SS_TPG_MASK ,ENABLE);
//	ControlRegisterWrite(WINDOW_MASK,ENABLE, regptr);
//	usleep(1);
//	ControlRegisterWrite(WINDOW_MASK,DISABLE, regptr); // PL side starts on falling edge
	//usleep(1);
	startDig();
	for(window =firstWindow ; window<numWindows+firstWindow; window++){

	//	if(window != window_start) XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);
		XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

		/* Wait on DMA transfer to be done */
		timeout = 200000; // Timeout of 10 sec
		do{

	/* If needed, update timefile
			if(flag_ttcps_timer){
				update_timefile();
				flag_ttcps_timer = false;
			}
*/
			/* If needed, reload watchdog's counter */
			if(flag_scu_timer){
				XScuWdt_RestartWdt(&WdtScuInstance);
				flag_scu_timer = false;
			}

			/* The DMA had a problem
			if(flag_axidma_error){
				printf("Error with DMA interrupt: TPG !\r\n");
				return XST_FAILURE;
			}
*/
//			usleep(50);
			timeout--;
		}while(timeout && !flag_axidma_rx_done);



		/* Update the cache with the data written by the DMA */
		Xil_DCacheInvalidateRange((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);
	//	printf("window = %d | wdo_id = %d\r\n", window, (uint)tmp_ptr->data.data_struct.wdo_id);

		/* DMA did not respond */
		if(timeout <= 0){
			printf("\r\nwindow = %d\r\n", window);
			printf("wdo_time: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_time);
			printf("PL_spare: %d\r\n", (uint)tmp_ptr->data.data_struct.PL_spare);
			printf("info: 0x%X\r\n", (uint)tmp_ptr->data.data_struct.info);
			printf("wdo_id: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_id);
			for(j=0; j<32; j++){
				for(i=0; i<16; i++){
					printf("%d\t", (uint)tmp_ptr->data.data_struct.data[i][j]);
				}
				printf("\r\n");
			}
			printf("Timeout on window %d: get 20 windows failed!\r\n", window);
			return XST_FAILURE;
		}
		else flag_axidma_rx_done = false;
  //      xil_printf("wdo_id=%d \r\n", (uint16_t)tmp_ptr-> data.data_struct.wdo_id );

		/* Test the returned values */
		if(tmp_ptr->data.data_struct.wdo_id != window){
			printf("window id is wrong! window = %d | wdo_id = %d\r\n", window, (uint)tmp_ptr->data.data_struct.wdo_id);
			return XST_FAILURE;
		}
		else{
			/* If data valid, send them to computer */
			index = 0;
			frame_buf[index++] = 0x55;
			frame_buf[index++] = 0xAA;
			frame_buf[index++] = (char)window;
			frame_buf[index++] = (char)(window >> 8);

			//printf("\r\n window = %d\r\n",window);

				for(j=0; j<32; j++){
					/* Pedestal subtraction */
					data_tmp = (uint16_t) (tmp_ptr->data.data_struct.data[channel][j]-  pedestal_0[window][channel][j]+ offset_avoid_negative);

					frame_buf[index++] = (char)data_tmp;
				    //printf("int_number = %d\r\n ", (char)(int_number));

					frame_buf[index++] = (char)(data_tmp >> 8);
					//printf("int_number >> 8 = %d\r\n", (char)((int_number >> 8)));

				}


				for(int k=0; k<32; k++){
					/* Pedestal subtraction */
					data_tmp = (uint16_t) (tmp_ptr->data.data_struct.data_1[channel][k]); //-  pedestal_1[window][channel][k]+ offset_avoid_negative);

					frame_buf[index++] = (char)data_tmp;
				    //printf("int_number = %d\r\n ", (char)(int_number));

					frame_buf[index++] = (char)(data_tmp >> 8);
					//printf("int_number >> 8 = %d\r\n", (char)((int_number >> 8)));

				}


				//printf("\r\n");

			//printf("\r\n");
			frame_buf[index++] = 0x33;
		//    printf("Test\r\n");
			frame_buf[index++] = 0xCC;
		//	printf("%d\r\n", index);
			transfer_data(frame_buf, index);
		}
		/* Release the DMA */
		  if (ControlRegisterWrite(PSBUSY_MASK,DISABLE, regptr_0) != XST_SUCCESS) {
			printf("Control register Failed\r\n");
		}
		if (ControlRegisterWrite(PSBUSY_MASK,DISABLE, regptr_1) != XST_SUCCESS) {
			printf("Control register Failed\r\n");
		}


	}

	free(tmp_ptr);

	return XST_SUCCESS;
}
/****************************************************************************/
/**
* @brief	Recover 20 consecutive windows and send them to the computer RAW
*
* @param	-
*
* @return	XST_SUCCESS or XST_FAILURE (defined in xstatus.h)
*
* @note		-
*
****************************************************************************/
int get_windowsRaw(int startWindow, int nmbrofWindows){
	int window_start;
		int timeout;
		int window,i,j;



		/* Create an element for the DMA */
		data_list* tmp_ptr  = (data_list *)malloc(sizeof(data_list));
		if(!tmp_ptr){
			printf("malloc for tmp_ptr failed in function, %s!\r\n", __func__);
			return XST_FAILURE;
		}
		tmp_ptr->next = NULL;
		tmp_ptr->previous = NULL;

		/* First window */
		window_start = startWindow;

		/* Number of windows */
		//nmbrWindows = 16;

		/* Give the element's address to the DMA */
		XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

		/* Initiate transfer and measure */


		regptr_0[TC_FSTWINDOW_REG] = startWindow;
//		usleep(100000);

		regptr_0[TC_NBRWINDOW_REG] = nmbrofWindows;
//		usleep(100000);

		regptr_1[TC_FSTWINDOW_REG] = startWindow;
//		usleep(100000);

		regptr_1[TC_NBRWINDOW_REG] = nmbrofWindows;

//		usleep(100000);

		//		ControlRegisterWrite(WINDOW_MASK,ENABLE, regptr);
		usleep(50);
//		ControlRegisterWrite(WINDOW_MASK,DISABLE, regptr); // PL side starts on falling edge
		startDig();

		for(window =window_start ; window<nmbrofWindows+window_start; window++){

			//XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

			if(window != window_start) XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

			/* Wait on DMA transfer to be done */
			timeout = 200000; // Timeout of 10 sec
			do{
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

				/* The DMA had a problem */
				if(flag_axidma_error){
					printf("Error with DMA interrupt: TPG !\r\n");
					return XST_FAILURE;
				}

				usleep(50);
				timeout--;
			}while(timeout && !flag_axidma_rx_done);



			/* Update the cache with the data written by the DMA */
			Xil_DCacheInvalidateRange((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);
		//	printf("window = %d | wdo_id = %d\r\n", window, (uint)tmp_ptr->data.data_struct.wdo_id);

			/* DMA did not respond */
			if(timeout <= 0){
				printf("\r\nwindow = %d\r\n", window);
				printf("wdo_time: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_time);
				printf("PL_spare: %d\r\n", (uint)tmp_ptr->data.data_struct.PL_spare);
				printf("info: 0x%X\r\n", (uint)tmp_ptr->data.data_struct.info);
				printf("wdo_id: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_id);

				for(j=0; j<32; j++){
					for(i=0; i<16; i++){
						printf("%d\t", (uint)tmp_ptr->data.data_struct.data[i][j]);
					}
					printf("\r\n");
				}

				printf("\r\nwindow = %d\r\n", window);
				printf("wdo_time_1: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_time_1);
				printf("PL_spare_1: %d\r\n", (uint)tmp_ptr->data.data_struct.PL_spare_1);
				printf("info_1: 0x%X\r\n", (uint)tmp_ptr->data.data_struct.info_1);
				printf("wdo_id_1: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_id_1);

				for(j=0; j<32; j++){
									for(i=0; i<16; i++){
										printf("%d\t", (uint)tmp_ptr->data.data_struct.data_1[i][j]);
										printf("Timeout on window %d: get 20 windows failed!\r\n", window);
					}
									printf("\r\n");
								}



				printf("Timeout on window %d: get 20 windows failed!\r\n", window);
				free(tmp_ptr);
				return XST_FAILURE;
			}
			else flag_axidma_rx_done = false;
     //       xil_printf("wdo_id=%d \r\n", (uint16_t)tmp_ptr-> data.data_struct.wdo_id );

			/* Test the returned values */
			if(tmp_ptr->data.data_struct.wdo_id != window){
				printf("window id is wrong! window = %d | wdo_id = %d\r\n", window, (uint)tmp_ptr->data.data_struct.wdo_id);
				printf("\r\nwindow = %d\r\n", window);
					printf("wdo_time: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_time);
					printf("PL_spare: %d\r\n", (uint)tmp_ptr->data.data_struct.PL_spare);
					printf("info: 0x%X\r\n", (uint)tmp_ptr->data.data_struct.info);
					printf("wdo_id: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_id);

					for(j=0; j<32; j++){
						for(i=0; i<16; i++){
							printf("%d\t", (uint)tmp_ptr->data.data_struct.data[i][j]);
						}
						printf("\r\n");
					}

					printf("\r\nwindow = %d\r\n", window);
					printf("wdo_time_1: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_time_1);
					printf("PL_spare_1: %d\r\n", (uint)tmp_ptr->data.data_struct.PL_spare_1);
					printf("info_1: 0x%X\r\n", (uint)tmp_ptr->data.data_struct.info_1);
					printf("wdo_id_1: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_id_1);

					for(j=0; j<32; j++){
										for(i=0; i<16; i++){
											printf("%d\t", (uint)tmp_ptr->data.data_struct.data_1[i][j]);
										}
										printf("\r\n");
									}

				free(tmp_ptr);
			//	return XST_FAILURE;

			}
			else{


				for(i=0; i<16; i++){
					for(j=0; j<32; j++){
						data_raw_0[window][i][j] += (uint32_t)(tmp_ptr->data.data_struct.data[i][j]);// + VPED_DIGITAL - pedestal[window][i][j]);
						data_raw_1[window][i][j] += (uint32_t)(tmp_ptr->data.data_struct.data_1[i][j]);// + VPED_DIGITAL - pedestal[window][i][j]);

						//         if ((uint16_t)(tmp_ptr->data.data_struct.data[i][j]) == 0){
                //        	printf("Value= 0");
                 //       	usleep(300);
                 //       }
					}
				}



			}
			/* Release the DMA */
			  if (ControlRegisterWrite(PSBUSY_MASK,DISABLE, regptr_0) != XST_SUCCESS) {
				printf("Control register Failed\r\n");
			}
				usleep(100000);

			if (ControlRegisterWrite(PSBUSY_MASK,DISABLE, regptr_1) != XST_SUCCESS) {
				printf("Control register Failed\r\n");
			}


		}

		free(tmp_ptr);

		return XST_SUCCESS;
	}

/****************************************************************************/
/**
* @brief	Recover 20 consecutive windows and send them to the computer
*
* @param	-
*
* @return	XST_SUCCESS or XST_FAILURE (defined in xstatus.h)
*
* @note		-
*
****************************************************************************/
int get_windows( int startWindow, int nmbrofWindows){
	int window_start;
	int timeout;
	int window,i,j,index;
	uint16_t data_tmp;
	//uint16_t int_number;
	//float float_decimal;
	//uint16_t int_decimal;
	//int pedestal_avg = 1;
    int offset_avoid_negative=200;
	/* Create an element for the DMA */
	data_list* tmp_ptr  = (data_list *)malloc(sizeof(data_list));
	if(!tmp_ptr){
		printf("malloc for tmp_ptr failed in function, %s!\r\n", __func__);
		return XST_FAILURE;
	}
	tmp_ptr->next = NULL;
	tmp_ptr->previous = NULL;

	/* First window */
	window_start = startWindow;
    usleep(10);
    printf("fstWindowValue %d \r\n", startWindow);
	/* Number of windows */
	//nmbrWindows = 16;

	/* Give the element's address to the DMA */
	 XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);
	 Xil_DCacheInvalidateRange((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);
    usleep(10);
	/* Initiate transfer and measure */
	regptr_0[TC_FSTWINDOW_REG] = startWindow;
	usleep(10);
	regptr_0[TC_NBRWINDOW_REG] = nmbrofWindows;
	usleep(10);
	regptr_1[TC_FSTWINDOW_REG] = startWindow;
	usleep(10);
	regptr_1[TC_NBRWINDOW_REG] = nmbrofWindows;
	usleep(10);
//	ControlRegisterWrite(SS_TPG_MASK ,ENABLE, regptr_0);
//	ControlRegisterWrite(SS_TPG_MASK ,ENABLE, regptr_1);
//	ControlRegisterWrite(WINDOW_MASK,ENABLE, regptr);
//	usleep(50);
//	ControlRegisterWrite(WINDOW_MASK,DISABLE, regptr); // PL side starts on falling edge
	startDig();

	for(window =window_start ; window<nmbrofWindows+window_start; window++){

	//	if(window != window_start) XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);
		XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

		/* Wait on DMA transfer to be done */
		timeout = 200000; // Timeout of 10 sec
		do{
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

			/* The DMA had a problem */
			if(flag_axidma_error){
				printf("Error with DMA interrupt: TPG !\r\n");
				return XST_FAILURE;
			}

			usleep(50);
			timeout--;
		}while(timeout && !flag_axidma_rx_done);



		/* Update the cache with the data written by the DMA */
		Xil_DCacheInvalidateRange((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);
	//	printf("window = %d | wdo_id = %d\r\n", window, (uint)tmp_ptr->data.data_struct.wdo_id);

		/* DMA did not respond */
		if(timeout <= 0){
			printf("\r\nwindow = %d\r\n", window);
			printf("wdo_time: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_time);
			printf("PL_spare: %d\r\n", (uint)tmp_ptr->data.data_struct.PL_spare);
			printf("info: 0x%X\r\n", (uint)tmp_ptr->data.data_struct.info);
			printf("wdo_id: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_id);
			for(j=0; j<32; j++){
				for(i=0; i<16; i++){
					printf("%d\t", (uint)tmp_ptr->data.data_struct.data[i][j]);
				}
				printf("\r\n");
			}
			printf("Timeout on window %d: get 20 windows failed!\r\n", window);
			return XST_FAILURE;
		}
		else flag_axidma_rx_done = false;
  //      xil_printf("wdo_id=%d \r\n", (uint16_t)tmp_ptr-> data.data_struct.wdo_id );

		/* Test the returned values */
		if(tmp_ptr->data.data_struct.wdo_id != window){
			printf("window id is wrong! window = %d | wdo_id = %d\r\n", window, (uint)tmp_ptr->data.data_struct.wdo_id);
			return XST_FAILURE;
		}
		else{
			/* If data valid, send them to computer */
			index = 0;
			frame_buf[index++] = 0x55;
			frame_buf[index++] = 0xAA;
			frame_buf[index++] = (char)window;
			frame_buf[index++] = (char)(window >> 8);

			//printf("\r\n window = %d\r\n",window);
			for(i=0; i<16; i++){
				for(j=0; j<32; j++){
					/* Pedestal subtraction */
					data_tmp = (uint16_t) (tmp_ptr->data.data_struct.data[i][j]-  pedestal[window][i][j]+ offset_avoid_negative);

					frame_buf[index++] = (char)data_tmp;
				    //printf("int_number = %d\r\n ", (char)(int_number));

					frame_buf[index++] = (char)(data_tmp >> 8);
					//printf("int_number >> 8 = %d\r\n", (char)((int_number >> 8)));

				}

				//printf("\r\n");
			}
			//printf("\r\n");
			frame_buf[index++] = 0x33;
		//    printf("Test\r\n");
			frame_buf[index++] = 0xCC;
		//	printf("%d\r\n", index);
			transfer_data(frame_buf, index);
		}
		/* Release the DMA */
		  if (ControlRegisterWrite(PSBUSY_MASK,DISABLE, regptr_0) != XST_SUCCESS) {
			printf("Control register Failed\r\n");
		}
		if (ControlRegisterWrite(PSBUSY_MASK,DISABLE, regptr_1) != XST_SUCCESS) {
			printf("Control register Failed\r\n");
		}



	}

	free(tmp_ptr);

	return XST_SUCCESS;
}
