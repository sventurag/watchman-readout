/**
 * @file 	pedestal.c
 * @author	Anthony Schluchin
 * @date	18th December 2018
 * @version 0.0
 */

#include "pedestal.h"

/**************** Extern global variables ****************/
/*********************************************************/
/** @brief Array containing registers of AXI-lite */
//extern int* regptr;
/** @brief Array containing the pedestal correction for every sample TARGETC_0 */
extern uint32_t  pedestal_0[512][16][32];
/** @brief Array containing the pedestal correction for every sample TARGETC_1*/
extern uint32_t  pedestal_1[512][16][32];
/** @brief Array containing raw data of the whole array */
extern uint32_t  data_raw[512][16][32];
/** @brief Array containing raw data of the whole array */
extern uint32_t  data_raw_1[512][16][32];
/** @brief Flag raised when AXI-DMA has an error */
extern volatile bool flag_axidma_error;
/** @brief Flag raised when AXI-DMA has finished an transfer, in OnDemand mode */
extern volatile bool flag_axidma_rx_done;
/** @brief Flag raised when the Triple Timer Counter overflows */
extern volatile bool flag_ttcps_timer;
/** @brief Flag raised when the SCU timer overflows*/
extern volatile bool flag_scu_timer;
/** @brief Instance of the device watchdog */
extern XScuWdt WdtScuInstance;

/** @brief Array containing the pedestal correction for every sample, the pedestal values
 * in trigger Mode follow the way is done with real data to minimize the differences
 * in data acquisition time for the same window. pedestal_A is for windows that contain the whole pulse
 * and for the windows that are first of two windows.*/

/** @brief Array containing raw data of the whole array */
extern uint32_t  data_rawA[512][16][32];
/** @brief Array containing raw data of the whole array */
extern uint32_t  data_rawB[512][16][32];


extern uint32_t  pedestal_A[512][16][32];

/** @brief Array containing the pedestal correction for every sample, the pedestal values
 * in trigger Mode follow the way is done with real data to minimize the differences
 * in data acquisition time for the same window. pedestal_B is for windows that are the second ones
 * in a two-window pulse */

extern uint32_t  pedestal_B[512][16][32];

/** Flag to start pedestal mode pedestal acquisition */
extern bool pedestalTriggerModeFlag;

/**number of average for pedestals in trigger mode*/
extern int nbr_avg_ped_triggerMode;

/* data structure from PL */
extern InboundRingManager_t inboundRingManager;

/** @brief Buffer used to send the data (50 bytes above it reserved for protocol header) */
extern char* frame_buf;

int cnt_average;
/****************************************************************************/
/**
* @brief	Calculate the pedestal value for every memory location in the TARGET C
*
* @param	-
*
* @return	XST_SUCCESS or XST_FAILURE (defined in xstatus.h)
*
* @note		-
*
****************************************************************************/
int init_pedestals(int* regptr, int targetcID){

	uint64_t sqr_val[4][16][32];
	//double rms[4][16][32];
	uint32_t data[4][16][32];
	int window, window_index;
	int timeout;
	int i,j,count,pair, nmbrwindows;
	int ped_sample;
	int ped_channel;
	int avg = 10;

	/* Create an element for the DMA */
	data_list* tmp_ptr  = (data_list *)malloc(sizeof(data_list));
	if(!tmp_ptr){
		printf("malloc for tmp_ptr failed in function, %s!\r\n", __func__);
		return XST_FAILURE;
	}
	tmp_ptr->next = NULL;
	tmp_ptr->previous = NULL;
    nmbrwindows = 4;
	/* To avoid small offset problem , read window by pair, so the address change every time */
	for(window_index=0; window_index<512; window_index+=nmbrwindows){
		for(pair=0; pair<nmbrwindows; pair++){
			for(i=0; i<16; i++){
				for(j=0; j<32; j++){
					data[pair][i][j] = 0;
					sqr_val[pair][i][j] = 0;
				}
			}
		}
		for(count=0; count< avg; count++){
			//window = window_index;
			for(pair=0; pair<nmbrwindows; pair++){		// do the pedestal on pair of window to avoid the small offset
				window =  window_index + pair;
				/* Give the element's address to the DMA */
				XAxiDma_SimpleTransfer_hm((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

				/* Initiate transfer and measure */
				regptr[TC_FSTWINDOW_REG] = window;
				regptr[TC_NBRWINDOW_REG] = 1;
				regptr[TC_Delay_UpdateWR] = 0;
				ControlRegisterWrite(SMODE_MASK ,ENABLE, regptr);
				ControlRegisterWrite(SS_TPG_MASK ,ENABLE, regptr);
				ControlRegisterWrite(WINDOW_MASK,ENABLE, regptr);
				usleep(50);
				ControlRegisterWrite(WINDOW_MASK,DISABLE, regptr); // PL side starts on falling edge

				/* Wait on DMA transfer to be done */
				timeout = 200000; // 10sec
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
				}while(timeout && (!flag_axidma_rx_done));

				/* Update the cache with the data written by the DMA */
				Xil_DCacheInvalidateRange((UINTPTR)tmp_ptr->data.data_array, SIZE_DATA_ARRAY_BYT);

				/* DMA did not respond */
				if(timeout <= 0){
					if(flag_axidma_rx_done) xil_printf("done \r\n");
					printf("\r\nwindow = %d | count = %d\r\n", window, count);
					printf("wdo_time: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_time);
					printf("PL_spare: %d\r\n", (uint)tmp_ptr->data.data_struct.PL_spare);
					printf("info: 0x%X\r\n", (uint)tmp_ptr->data.data_struct.info);
					printf("wdo_id: %d\r\n", (uint)tmp_ptr->data.data_struct.wdo_id);
					for(j=1; j<32; j++){
						for(i=0; i<16; i++){
							printf("%d\t", (uint)tmp_ptr->data.data_struct.data[i][j]);
						}
						printf("\r\n");
					}
					printf("Timeout on window %d: pedestal initialization failed!\r\n", window);
					return XST_FAILURE;
				}
				else flag_axidma_rx_done = false;

    //           printf("window id= %d\r\n",(uint)tmp_ptr->data.data_struct.wdo_id);

				/* Test the returned values */
                if(tmp_ptr->data.data_struct.wdo_id != window){
					printf("window id is wrong! window = %d | wdo_id = %d | pair = %d | count = %d\r\n", window, (uint)tmp_ptr->data.data_struct.wdo_id, pair, count);
					return XST_FAILURE;
				}
				else{
					/* If data valid, calculate the average */
					for(i=0; i<16; i++){
						for(j=0; j<32; j++) {
							data[pair][i][j] += tmp_ptr->data.data_struct.data[i][j];
							sqr_val[pair][i][j] += tmp_ptr->data.data_struct.data[i][j]*tmp_ptr->data.data_struct.data[i][j];
						}
					}
				}
				/* Release the DMA */
				ControlRegisterWrite(PSBUSY_MASK,DISABLE, regptr);
			}
		}

		//window = window_index;
		for(pair=0; pair<nmbrwindows; pair++){
			window = window_index + pair;
			if (!targetcID){
				for(i=0; i<16; i++){
					for(j=0; j<32; j++){
						/* Divide the average by avg to have the pedestal value */
						pedestal_0[window][i][j]= data[pair][i][j]/avg;
						sqr_val[pair][i][j] = sqr_val[pair][i][j]/avg;
					//	rms[pair][i][j] = sqrt(sqr_val[pair][i][j] - (pedestal[window][i][j]*pedestal[window][i][j]));
						//printf("%d, ",pedestal[window][i][j]);
					}
			}

			}

			else{
				for(i=0; i<16; i++){
					for(j=0; j<32; j++){
						/* Divide the average by avg to have the pedestal value */
						pedestal_1[window][i][j]= data[pair][i][j]/avg;
						sqr_val[pair][i][j] = sqr_val[pair][i][j]/avg;
					//	rms[pair][i][j] = sqrt(sqr_val[pair][i][j] - (pedestal[window][i][j]*pedestal[window][i][j]));
						//printf("%d, ",pedestal[window][i][j]);
					}
					}
			}

//			if(window == 0){
//				printf("RMS values\r\n");
//				for(j=0; j<32; j++){
//					for(i=0; i<16; i++) printf("%lf\t", rms[pair][i][j]);
//					printf("\r\n");
//				}
//			}
		}
	}

	for (ped_channel = 0; ped_channel <16; ped_channel++ ){
        printf("channel = %d,", ped_channel);
		for (ped_sample=0; ped_sample<32; ped_sample++ ){
			printf("%d,",pedestal_0[0][ped_channel][ped_sample]);

		}
		printf("\r\n");

	}


	free(tmp_ptr);

	return XST_SUCCESS;
}


/*
**************************************************************************
*
* @brief	Get pedestals using get_windowsRaw
*
* @param	number of average, avg; number of windows for step, nmbrofWindows
*
* @return	Void function, updating data_raw and pedestal global variables
*
* @note		-
*
***************************************************************************
*/


int get_pedestal(int avg, int nmbrofWindows,int* regptr){

int i,j,k,window,channel,sample;

printf("Arrays Initialization\r\n");
for(window = 0; window< 512; window++ ){
	for(channel = 0; channel< 16; channel++ ){
		for(sample = 0; sample< 32; sample++ ){
			data_raw[window][channel][sample] = 0;
			data_raw_1[window][channel][sample] = 0;

     //       usleep(10);
	//		printf("%d\r\n", data_raw[window][channel][sample]);

	}
}
};



for(window = 0; window< 512; window++ ){
	for(channel = 0; channel< 16; channel++ ){
		for(sample = 0; sample< 32; sample++ ){
			pedestal_0[window][channel][sample] = 0;
		//	usleep(10);
		//	printf("%.2f\r\n", pedestal[window][channel][sample]);

	}
}
};


//printf("Getting data");
for (i=0; i<avg; i++ ){
	for(j=0; j<512; j+=nmbrofWindows){

         if (get_windowsRaw(j,nmbrofWindows,regptr)== XST_SUCCESS);
             else { printf("get Windows raw failed\r\n");
    //     usleep(300);
         }

	}
  //  printf("avg %d of  %d\r\n", i, avg);

};
// Average

	 for(window=0; window<512; window++){
			for(channel=0; channel<16; channel++){
				for(sample = 0; sample <32;sample++){
					pedestal_0[window][channel][sample] = data_raw[window][channel][sample] /avg ;
					pedestal_1[window][channel][sample] = data_raw_1[window][channel][sample] /avg ;

	     		}
	     	}
	     };
/*
for (window=0; window< 3; window++){
	 for(sample = 0; sample <32;sample++){
	 	printf("%d\r\n",data_raw[window][2][sample]);
	 }
	 for(sample = 0; sample <32;sample++){
	 	printf("%d\r\n",pedestal[window][2][sample]);
	 }
};

// Test

	for(k=0; k<512; k+=nmbrofWindows){

         if (get_windows(k,nmbrofWindows)== XST_SUCCESS);
             else { printf("get Windows raw failed\r\n");
         usleep(300);
         }
	};

*/


	 return XST_SUCCESS;


}


/*
**************************************************************************
*
* @brief	Initiation pedestals in trigger mode
*
* @param	number of average, avg;
*
* @return	Void function, updating data_raw and pedestal global variables
*
* @note		-
*
***************************************************************************
*/


void pedestal_triggerMode_init(void){

int window,channel,sample;
cnt_average =0;
printf("Arrays Initialization Pedestal trigger mode\r\n");
for(window = 0; window< 512; window++ ){
	for(channel = 0; channel< 16; channel++ ){
		for(sample = 0; sample< 32; sample++ ){
			pedestal_A[window][channel][sample] = 0;
			pedestal_B[window][channel][sample] = 0;
            usleep(10);
	//		printf("%d\r\n", data_raw[window][channel][sample]);

	}
}
}

for(window = 0; window< 512; window++ ){
	for(channel = 0; channel< 16; channel++ ){
		for(sample = 0; sample< 32; sample++ ){
			data_rawA[window][channel][sample] = 0;
            usleep(10);
	//		printf("%d\r\n", data_raw[window][channel][sample]);

	}
}
};

for(window = 0; window< 512; window++ ){
	for(channel = 0; channel< 16; channel++ ){
		for(sample = 0; sample< 32; sample++ ){
			data_rawB[window][channel][sample] = 0;
            usleep(10);
	//		printf("%d\r\n", data_raw[window][channel][sample]);

	}
}
};

// Start trigger mode

//usleep(10);
//pedestalTriggerModeFlag = true;
//usleep(30);
//ControlRegisterWrite(C_TRIGGER_MODE_PED_MASK,ENABLE);

};


/*
**************************************************************************
*
* @brief	Save pedestal window into a correspondent array pedestal_A or pedestal_B
*
* @param
*
* @return
*
* @note		-
*
***************************************************************************
*/


int  pedestal_triggerMode_getArrays(volatile InboundRingManager_t *datatosave ){

int window,channel,sample,window_order;
data_axi *Data2save = datatosave -> procPointer;
//uint16_t data_tmp;

window = Data2save-> wdo_id;
window_order = Data2save -> info;


 if ( (window_order == 0) || (window_order == 1) ){
	 cnt_average += 1;
//	xil_printf("%d, %d\r\n", window, window_order);
	 for(channel = 0; channel< 16; channel++ ){
	 	for(sample = 0; sample< 32; sample++ ){
	 		data_rawA[window][channel][sample] +=  Data2save->data[channel][sample];
	 	}
	 }
 }

if ( window_order == 2 ) {
	 cnt_average += 1;
	 for(channel = 0; channel< 16; channel++ ){
		for(sample = 0; sample< 32; sample++ ){
			data_rawB[window][channel][sample] +=   Data2save->data[channel][sample];
		}
	 }
}
/*
else {
			xil_printf("Wrong window_order Value: %d, %d\r\n", window, window_order);
     }
*/
if 	 (cnt_average == ( (nbr_avg_ped_triggerMode+1) *1024  )  ){
//	xil_printf("%d\r\n", cnt_average);
	divideByAverageNumber();
	cnt_average=0;
}

return XST_SUCCESS;
 };



/*
**************************************************************************
*
* @brief	divide average
*
* @param
*
* @return
*
* @note		-
*
***************************************************************************
*/

int divideByAverageNumber(void){

int window,channel,sample;

//xil_printf("avg %d\r\n", nbr_avg_ped_triggerMode);
//usleep(10);
//for(window=0; window<512; window++){
//		for(channel=0; channel<16; channel++){
//			for(sample = 0; sample <32;sample++){
//				tempA = pedestal_A[window][channel][sample];
//				tempB = pedestal_B[window][channel][sample];
//				xil_printf("tempB, %d \r\n", tempB);
////				pedestal_A[window][channel][sample] = tempA/(nbr_avg_ped_triggerMode + 1) ;
////				pedestal_B[window][channel][sample] = tempB/(nbr_avg_ped_triggerMode + 1);
//
//    		}
//    	}
//    };

for(window=0; window<512; window++){
		for(channel=0; channel<16; channel++){
			for(sample = 0; sample <32;sample++){
//				pedestal_A[window][channel][sample] = data_rawA[window][channel][sample]/(nbr_avg_ped_triggerMode + 1) ;
//				pedestal_B[window][channel][sample] = data_rawB[window][channel][sample]/(nbr_avg_ped_triggerMode + 1) ;
				pedestal_A[window][channel][sample] = data_rawA[window][channel][sample]/(nbr_avg_ped_triggerMode+1) ;
				pedestal_B[window][channel][sample] = data_rawB[window][channel][sample]/(nbr_avg_ped_triggerMode+1) ;

				//  xil_printf("pedestal_B, %d \r\n", tempB);

    		}

    	}


};
pedestalTriggerModeFlag = false;

//xil_printf("divfin\r\n");
//usleep(10000);
//sendPedestals(pedestal_A);
////xil_printf("pedestalA sent \r\n");
//usleep(100);
//sendPedestals(pedestal_B);
xil_printf("Pedestal transmission finished\r\n");
//cleanup_interrupts(false);
//enable_interrupts();
return XST_SUCCESS;
}



/*
**************************************************************************
*
* @brief	send pedestals
*
* @param
*
* @return
*
* @note		-
*
***************************************************************************
*/
void sendPedestals( uint32_t pedestalArray[512][16][32] ){
uint16_t data_tmp;
int window,channel,sample, index;

//xil_printf("starting transmission \r\n");

for(window=0; window<512; window++){
//	xil_printf("%d \r\n", window);
//	usleep(1000000)
data_tmp = 0;
channel=0;
sample=0;
index = 0;
frame_buf[index++] = 0x55;
frame_buf[index++] = 0xAA;
frame_buf[index++] = (char)window;
frame_buf[index++] = (char)(window >> 8);

		for(channel=0; channel<16; channel++){
//			xil_printf("channel %d \r\n", channel);
//			usleep(1000);
			for(sample = 0; sample <32;sample++){
				data_tmp = (uint16_t)pedestalArray[window][channel][sample];

				frame_buf[index++] = (char)data_tmp;
								    //xil_printf("int_number = %d\r\n ", (char)(int_number));

			   frame_buf[index++] = (char)(data_tmp >> 8);
									//xil_printf("int_number >> 8 = %d\r\n", (char)((int_number >> 8)));
			}
}
			frame_buf[index++] = 0x33;
				//    xil_printf("Test\r\n");
					frame_buf[index++] = 0xCC;
				//	xil_printf("%d\r\n", index);
					transfer_data(frame_buf, index);

}
//usleep(1000);
};

