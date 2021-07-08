/**
 * @file 	get_1000_windows.h
 * @author	Anthony Schluchin
 * @date	21st January 2019
 * @version 0.0
 */

#ifndef SRC_GET_15_WINDOWS_H_
#define SRC_GET_15_WINDOWS_H_

#include "xstatus.h"
#include "data_analysis.h"
#include "xil_types.h"
#include "axis_peripheral.h"
#include "TARGETC_RegisterMap.h"
#include "iic_DAC_LTC2657.h"
#include "udp_peripheral.h"
#include "file_hm.h"
#include "xscuwdt.h"

/*** Function prototypes *********************************************/
int PulseSweep(int* regptr);
int PulseRange(int* regptr);
int SendWindows(int firstWindow, int nmbrWindows,int* regptr);
int get_windowsRaw(int startWindow, int nmbrofWindows,int* regptr);
int get_windows(int startWindow, int nmbrofWindows, int* regptr);

#endif /* SRC_GET_15_WINDOWS_H_ */
