/**
 * @file 	features_extraction.c
 * @author	Anthony Schluchin
 * @date	28th November 2018
 * @version 0.0
 */

#include "data_analysis.h"

/**************** Extern global variables ****************/
/*********************************************************/
/** @brief Array containing the pedestal correction for every sample */
uint16_t  pedestal[512][16][32];
/** @brief Lookup table to correct the transfer function */
extern uint16_t lookup_table[2048];
/** @brief Buffer used to send the data (50 bytes above it reserved for protocol header) */
extern char* frame_buf;
/* data structure from PL */
InboundRingManager_t inboundRingManager;
/****************************************************************************/
/**
* @brief	Correct the data received from the PL side (pedestal subtraction &
* 			transfer function correction) and choose the gain stage (channel)
*
* @param	data: pointer on array to return the data corrected
* @param	pmt: PMT's ID (4 PMTs per ASIC, 16 ch per ASIC -> 4 ch per PMT)
* @param	nbr_wdo: number of window for the pulse
* @param	info: pointer to return info of pulse too long or not
*
* @return	ch: channel chose (gain stage chose)
*
* @note		-
*
****************************************************************************/
int correct_data(uint16_t* data, int pmt, char nbr_wdo, uint32_t* info, data_list* tmp_first_element){
	int ch = 4*pmt+3;
	int ch_last = ch-3;
	data_list* ptr;
	int wdo, sample;
	int index = 0;
	bool gain_good = false;
	bool too_long = false;
	uint16_t data_tmp;

	// Look for best gain stage (channel)
	while(!gain_good){
		gain_good = true;
		ptr = tmp_first_element;
		index = 0;
		for(wdo=0; wdo<nbr_wdo; wdo++){
			for(sample=0; sample<32; sample++){
				// Pedestal subtraction
				data_tmp = (uint16_t)ptr->data.data_struct.data[ch][sample] + VPED_DIGITAL - pedestal[ptr->data.data_struct.wdo_id][ch][sample];
				// Transfer function correction
				if(data_tmp > 2047) data_tmp = 2047;
				data[index] = lookup_table[data_tmp];
				// If pulse goes under threshold, take next gain stage
				if(data[index] < THRESHOLD_PULSE){
					if(ch > ch_last){
						ch--;
						gain_good = false;
						sample = 32;
						wdo = nbr_wdo;
					}
					else too_long = true;	// Amplitude too high with all gain stage -> consider pulse as "too long"
				}
				index++;
			}
			ptr = ptr->next;
		}
	}
	if(too_long) *info |= 0x1 << (TOO_LONG_SHIFT+pmt); // if all gain stage are saturated
	return ch;
}

/****************************************************************************/
/**
* @brief	Extract the minimum amplitude of the pulse, and the time when
* 			it was 20% of its value
*
* @param	data: pointer on the pulse's data
* @param	length: size of data
* @param	features: pointer on structure to return the amplitude and the time
*
* @return	None
*
* @note		-
*
****************************************************************************/
void extract_features(uint16_t* data, int length, features_ext* features){
	int vped = VPED_DIGITAL;
	int i, sample, amplitude;
	float amp_start, a, b;
	coordinates p1, p2;

	/* Get the minimum amplitude of the pulse */
	amplitude = vped;
	for(i=0; i<length; i++){
		if(data[i] < amplitude){
			amplitude = data[i];
			sample = i;
		}
	}

	features->amplitude = amplitude;

	/* Get the moment where the curve was at 20% of the difference between vped and the minimum amplitude */
	amp_start = vped - 0.2*(vped - features->amplitude);

	i=sample;
	while((float)data[i] < amp_start){
		i--;
		if(i < 0){
			i = 0;
			break;
		}
	}
	p1.x = (float)i;	// extrapolate the line between the two point surrounding the amplitude we're looking for
	p1.y = (float)data[i];
	i++;
	p2.x = (float)i;
	p2.y = (float)data[i];
	a = (p2.y - p1.y)/(p2.x - p1.x);
	b = p1.y - a*p1.x;
	features->time.time_fl = (amp_start - b)/a;
}




void updateInboundCircBuffer() {
	disable_interrupts();
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
	enable_interrupts();
}


void udp_transfer_WM( volatile InboundRingManager_t *data_to_send )
{
 int index;
 data_axi *Data2send = data_to_send -> procPointer;
 uint16_t data_tmp;
 int window, i, j;
 int offset_avoid_negative = 200;

 window = Data2send->wdo_id;
 xil_printf("windowNumber:%d \r\n",window);
//	xil_printf(".Pulse...\r\n");
	index = 0;
				frame_buf[index++] = 0x55;
				frame_buf[index++] = 0xAA;
				frame_buf[index++] = (char)window;
				frame_buf[index++] = (char)(window >> 8);

				//xil_printf("\r\n window = %d\r\n",window);
				for(i=0; i<16; i++){
					for(j=0; j<32; j++){
						/* Pedestal subtraction */
						data_tmp = (uint16_t)  (Data2send->data[i][j]-  pedestal[window][i][j]+ offset_avoid_negative);

						frame_buf[index++] = (char)data_tmp;
					    //xil_printf("int_number = %d\r\n ", (char)(int_number));

						frame_buf[index++] = (char)(data_tmp >> 8);
						//xil_printf("int_number >> 8 = %d\r\n", (char)((int_number >> 8)));

					}

					//xil_printf("\r\n");
				}
				//xil_printf("\r\n");
				frame_buf[index++] = 0x33;
			//    xil_printf("Test\r\n");
				frame_buf[index++] = 0xCC;
			//	xil_printf("%d\r\n", index);
				transfer_data(frame_buf, index);
			//	sleep(5);


}


void PrintInboundRingStatus(InboundRingManager_t inboundRing) {
	//char string[256];
	xil_printf(          "--------------------------- Inbound Ring status ---------------------------\r\n");
	xil_printf( "0x%08lx inboundRingManager.writePointer\r\n", (u32) inboundRing.writePointer);
	//usleep(100);

	xil_printf( "0x%08lx inboundRingManager.writePointer\r\n", (u32) inboundRing.writePointer);
	//usleep(100);

	//usleep(100);
	xil_printf( "  %08ld inboundRingManager.writeLocation\r\n", (u32) inboundRing.writeLocation);
	//usleep(100);

	xil_printf( "  %08d inboundRingManager.packetSize at write\r\n",(int) inboundRing.packetSize[inboundRing.writeLocation]);
	//usleep(100);
	xil_printf( "0x%08lx inboundRingManager.procPointer\r\n", (u32) inboundRing.procPointer);
     //usleep(100);
	xil_printf( "  %08ld inboundRingManager.procLocation\r\n", (u32) inboundRing.procLocation);
    //usleep(100);
	xil_printf( "  %08d inboundRingManager.packetSize at proc\r\n",(int) inboundRing.packetSize[inboundRing.procLocation]);
        //usleep(100);
	xil_printf( "0x%08lx inboundRingManager.firstAllowedPointer\r\n", (u32) inboundRing.firstAllowedPointer);
        //usleep(100);
	xil_printf( "0x%08lx inboundRingManager.lastAllowedPointer\r\n", (u32) inboundRing.lastAllowedPointer);
        //usleep(100);
	xil_printf( "  %08d inboundRingManager.pendingCount\r\n",(int) inboundRing.pendingCount);
        //usleep(100);
	xil_printf( "  %08d inboundRingManager.totalCount\r\n",(int) inboundRing.totalCount);
        //usleep(100);
	xil_printf( "  %08d inboundRingManager.processedCount\r\n",(int) inboundRing.processedCount);
        //usleep(100);
	return;
}

