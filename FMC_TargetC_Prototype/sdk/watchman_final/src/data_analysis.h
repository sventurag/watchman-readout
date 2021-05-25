/**
 * @file 	data_analysis.h
 * @author	Anthony Schluchin
 * @date	28th November 2018
 * @version 0.0
 */

#ifndef SRC_DATA_ANALYSIS_H_
#define SRC_DATA_ANALYSIS_H_

#include <math.h>
#include <stdbool.h>
#include "xtime_l.h"
#include "interrupt.h"

/*** DEFINES *********************************************************/
/*********************************************************************/
/** @brief Size of an element given to the DMA for a transfer (32samples * 16ch + header = 518 int32_t)* 2 (TARGETC_0 and TARGETC_1 ) */
#define SIZE_DATA_ARRAY 	1036
/** @brief SIZE_DATA_ARRAY but in bytes (int32_t is 4 bytes) */
#define SIZE_DATA_ARRAY_BYT	SIZE_DATA_ARRAY*4
/** @brief Number of channels per TARGET C*/
#define CHANNEL 		16
/** @brief Number of sample per window */
#define SAMPLE 			32
/** @brief Maximum number of window to represent a pulse */
#define MAX_WINDOW		4
/** @brief Position of TRIG bit in window's information */
#define TRIG_SHIFT		0
/** @brief Position of LAST bit in window's information */
#define LAST_SHIFT		4
/** @brief Position of TOO_LONG bit in window's information */
#define	TOO_LONG_SHIFT	8
/** @brief Mask for one of the groupe of bit in window's information*/
#define MASK_INFO		0xF
/** @brief Vped value, but in digital (2.5V <=> 2047 -> 1.75V <=> 1434 or 1.25V <=> 1024)*/
#define VPED_DIGITAL	1434
/** @brief Vped voltage to set up in DAC (in float)*/
#define VPED_ANALOG		1.75//1.6 //1.75
/** @brief Threshold voltage to set up in DAC for the comparator of the trigger system (in float)*/
#define THRESHOLD_CMP_0	1.78  //1.78//1.78 //1.25/** @brief Treshold used to select the gain stage in function correct_data to send (digital value)*/

#define THRESHOLD_CMP_1 1.78

#define THRESHOLD_CMP_2	1.78

#define THRESHOLD_CMP_3	1.78

#define THRESHOLD_CMP_4	1.78

#define THRESHOLD_CMP_5	1.78

#define THRESHOLD_CMP_6	1.78

#define THRESHOLD_CMP_7	1.78


#define THRESHOLD_PULSE	500

#define WAVE_BUFFER_SIZE 2000
#define INBOUND_RING_BUFFER_LENGTH_IN_PACKETS  (WAVE_BUFFER_SIZE)
#define MAX_INBOUND_PACKET_BYTES  (SIZE_DATA_ARRAY_BYT) //

/*** Type definition *************************************************/
/*********************************************************************/
/**
 * @brief Union to convert access a float as an int without converting it in int
 */
typedef union time_union {
	float time_fl; /**< The time in float */
	int time_t; /**< The same time in float but considerate as int (without convertion) */
} time_un;

/**
 * @brief Structure containing the features extracted from a normal pulse
 */
typedef struct features_ext_st {
	int amplitude; /**< Amplitude maximum of the pulse */
	time_un time; /**< Time when the signal was a 20% of the maximum amplitude */
} features_ext;

/**
 * @brief Structure containing the coordinations of a point
 */
typedef struct coordinates_st {
	float x; /**< Coordination X */
	float y; /**< Coordination Y */
} coordinates;

/**
 * @brief Structure of an element of the list which represent a window.
 */
typedef struct data_axi_st {
	uint64_t wdo_time; /**< Timestampe of the window */
	uint64_t PL_spare; /**< Spare bits for the development used to return the command send to the round buffer */
	uint32_t info; /**< Information about the window, bits 0-3 TRIG bits | bits 4-7 LAST bits | bits 8-11 TOO_LONG bits (use the defines to access correctly these bits) */
	uint32_t wdo_id; /**< ID of the window (0 to 511) */
	uint32_t data[16][32]; /**< Voltage measured by every sample */

	uint64_t wdo_time_1; /**< Timestampe of the window */
	uint64_t PL_spare_1; /**< Spare bits for the development used to return the command send to the round buffer */
	uint32_t info_1; /**< Information about the window, bits 0-3 TRIG bits | bits 4-7 LAST bits | bits 8-11 TOO_LONG bits (use the defines to access correctly these bits) */
	uint32_t wdo_id_1; /**< ID of the window (0 to 511) */
	uint32_t data_1[16][32]; /**< Voltage measured by every sample */

// INCREASE SIZE OF STRUCTURE FOR TWO WINDOWS TARGETC0 and TARGETC1
} data_axi;




/**
 * @brief Union to access an element as an array, used to give the element's address to the DMA
 */
typedef union data_axi_union {
	struct data_axi_st data_struct; /**< Structure of the element */
	uint32_t data_array[SIZE_DATA_ARRAY]; /**< Array of same size, pointer passed to DMA */
} data_axi_un;

//struct data_axi_un dataArray ;

/**
 * @brief Structure to create the list of the element
 */
typedef struct data_list_st data_list;

struct data_list_st {
	data_axi_un data; /**< The element */
	data_list* previous; /**< Pointer on the previous element (NULL if this is the first one) */
	data_list* next; /**< Pointer on the next element (NULL if this is the last one) */
};

/*** Function prototypes *********************************************/
int correct_data(uint16_t* data, int pmt, char nbr_wdo, uint32_t* info,
		data_list* tmp_first_element);
void extract_features(uint16_t* data, int length, features_ext* features);

//// This is an inbound packet container
//typedef struct {
//	// Header
//	u32 eventHeader;
////	u8  hitWord;
////	u8  asicWord;
////	u16 triggerPosition;
//	u32 payload[MAX_INBOUND_PAYLOAD_WORDS]; //Including checksum
//} __attribute__ ((packed))GenericInboundPacket_t;

// This is a struct to help manage inbound buffering
typedef struct {
	// Pointer where next packet should be written
	data_axi *writePointer;
	u16 writeLocation;
	// Pointer where next packet should be processed
	data_axi *procPointer;

	u16 procLocation;
	// First/last allowed pointers that can be used
	data_axi *firstAllowedPointer;
	data_axi *lastAllowedPointer;
	// Array of received packet sizes
	u32 packetSize[SIZE_DATA_ARRAY];
	// Waveforms pending processing, total waveforms received, total waveforms processed
	u32 pendingCount;
	u32 totalCount;
	u32 processedCount;
} InboundRingManager_t;

void PrintInboundRingStatus(InboundRingManager_t inboundRing);

void udp_transfer_WM(volatile InboundRingManager_t *data_to_send);

#endif /* SRC_FEATURES_EXTRACTION_H_ */
