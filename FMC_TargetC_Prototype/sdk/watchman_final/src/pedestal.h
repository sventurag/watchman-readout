/**
 * @file 	pedestal.h
 * @author	Anthony Schluchin
 * @date	18th December 2018
 * @version 0.0
 */

#ifndef SRC_PEDESTAL_H_
#define SRC_PEDESTAL_H_

#include "data_analysis.h"
#include "axis_peripheral.h"
#include "xil_types.h"
#include "xstatus.h"
#include "TARGETC_RegisterMap.h"
#include "file_hm.h"
#include "xscuwdt.h"
//#include "get_15_windows"
//#include "udp_peripheral.h"

/*** Function prototypes *********************************************/
int init_pedestals(int* regptr, int targetcID);
int get_pedestal(int avg, int nmbrofWindows,int* regptr);
int get_windowsRaw(int startWindow, int nmbrofWindows,int* regptr); // FIX
int get_windows(int startWindow, int nmbrofWindows,int* regptr);

//int get_15_windows_fct(void);
void pedestal_triggerMode_init(void);
int pedestal_triggerMode_getArrays(volatile InboundRingManager_t *datatosave );
int divideByAverageNumber(void);
void sendPedestals( uint32_t pedestalArray[512][16][32] );


#endif /* SRC_PEDESTAL_H_ */
