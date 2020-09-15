/**
 * @file 	iic_DAC_LTC2657.c
 * @author	Anthony Schluchin
 * @date	15th December 2018
 * @version 0.0
 */

#include "iic_DAC_LTC2657.h"


/*********************** Global variables ****************/
/*********************************************************/
/** @brief Instance of the I2C device */
// XIic I2cInstance;
XIicPs Iic;			/* Instance of the IIC Device */


/****************************************************************************/
/**
* @brief	Initialize the device I2C to communicate with the DAC
*
* @param	-
*
* @return	XST_SUCCESS or XST_FAILURE (defined in xstatus.h)
*
* @note		-
*
****************************************************************************/
/*
int DAC_LTC2657_initialize(void){

	int Status = XST_SUCCESS;
	
	// Recover i2c IP configuration
	XIic_Config * ConfigPtr = XIic_LookupConfig(IIC_DEVICE_ID);
	if (ConfigPtr == NULL) {
		xil_printf("In %s: DAC Look up config failed...\r\n",
		__func__);
		return XST_FAILURE;
	}

	// Create and initialize the i2c instance
	Status = XIic_CfgInitialize(&I2cInstance, ConfigPtr,
					ConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("In %s: DAC Cfg initialization failed...\r\n",
		__func__);
		return XST_FAILURE;
	}
	
	// No interrupt like it is only write only
	
	// Start the driver and its interrupt (in this case, no interrupt like it is only write only)
	XIic_Start(&I2cInstance);
		
	return Status;	
}
*/
/****************************************************************************/
/**
* @brief	Set the voltage of a channel of the DAC
*
* @param	channel: which channel to change (see DEFINES)
* @param	voltage: voltage to set
*
* @return	XST_SUCCESS or XST_FAILURE (defined in xstatus.h)
*
* @note		-
*
****************************************************************************/
/*
int DAC_LTC2657_SetChannelVoltage(int channel, float voltage){

	int Status;
	int intvolt;
	char WriteBuffer[3];

	// set the ADC address (pdf p.19) and the fact that it's a slave
	Status = XIic_SetAddress(&I2cInstance, XII_ADDR_TO_SEND_TYPE, IIC_SLAVE_ADDRESS);
	if (Status != XST_SUCCESS) {
		xil_printf("In %s: DAC setting address failed...\r\n",
		__func__);
		return XST_FAILURE;
	}
	
	//Channel
	switch(channel){
		case DAC_GRP_0:		xil_printf("DAC_GRP_0:%d\t",channel);	break;
		case DAC_GRP_1:		xil_printf("DAC_GRP_1:%d\t",channel);	break;
		case DAC_GRP_2:		xil_printf("DAC_GRP_2:%d\t",channel);	break;
		case DAC_GRP_3:		xil_printf("DAC_GRP_3:%d\t",channel);	break;
		case CHANNEL_E:		xil_printf("Channel E:%d\t",channel);	break;
		case CHANNEL_F:		xil_printf("Channel F:%d\t",channel);	break;
		case CHANNEL_G:		xil_printf("Channel G:%d\t",channel);	break;
		case DAC_VPED:		xil_printf("DAC_VPED:%d\t",channel);	break;
		case CHANNEL_ALL:	xil_printf("Channel ALL:%d\t",channel);	break;
		default :		
			return XST_FAILURE;
			break;	
	}
	
		//Voltage
	if(voltage >= 2.5) intvolt = 65535;
	else intvolt = (int)(65536.0 * voltage / 2.5);
	printf("%lf V\r\n",voltage);
	
	
	WriteBuffer[0] = 0x30 | channel;	// 0x30 command to write and update | channel is channel
	WriteBuffer[1] = intvolt>>8;	//0b10000000; // MSB First
	WriteBuffer[2] = intvolt & 0x00FF;	//0b00000000; // LSB Last

	int i;
	for(i=0; i <5 ; i++){			// 5 time, because sometime it's busy
		Status = XIic_MasterSend(&I2cInstance,WriteBuffer,(int)4); // length = 4, because data + 1 for the address
		if(Status == XST_SUCCESS){
			break;
		}
	}
	if(i ==5) return XST_FAILURE;
		
	sleep(1);	//Time for the DAC to ouput and stabilize the voltages
	return Status;	

}
*/

/****************************************************************************/
/**
* @brief	Set the voltage of a channel of the DAC
*
* @param	channel: which channel to change (see DEFINES)
* @param	voltage: voltage to set
*
* @return	XST_SUCCESS or XST_FAILURE (defined in xstatus.h)
*
* @note		-
*
****************************************************************************/
int DAC_LTC2657_initialize_PS(void){
int Status;

/*
 * Initialize the IIC driver so that it's ready to use
 * Look up the configuration in the config table, then initialize it.
 */
//XIic_Config * ConfigPtr = XIic_LookupConfig(IIC_DEVICE_ID);
XIicPs_Config *Config;
 Config = XIicPs_LookupConfig(IIC_DEVICE_ID);
if (NULL == Config) {
	return XST_FAILURE;
}

Status = XIicPs_CfgInitialize(&Iic, Config, Config->BaseAddress);
if (Status != XST_SUCCESS) {
	return XST_FAILURE;
}

/*
 * Perform a self-test to ensure that the hardware was built correctly.
 */
Status = XIicPs_SelfTest(&Iic);
if (Status != XST_SUCCESS) {
	return XST_FAILURE;
}
return Status;

}


int DAC_LTC2657_SetChannelVoltage_PS(int channel, float voltage){

	int Status=XST_SUCCESS;
	int intvolt;
	u8 WriteBuffer[3];
	xil_printf("CHANNEL:%d\t",channel);

	//Channel
	switch(channel){
		case CHANNEL_A:		xil_printf("DAC_GRP_0:%d\t",channel);	break;
		case CHANNEL_B:		xil_printf("DAC_GRP_1:%d\t",channel);	break;
		case CHANNEL_C:		xil_printf("DAC_GRP_2:%d\t",channel);	break;
		case CHANNEL_D:		xil_printf("DAC_GRP_3:%d\t",channel);	break;
		case CHANNEL_E:		xil_printf("Channel E:%d\t",channel);	break;
		case CHANNEL_F:		xil_printf("Channel F:%d\t",channel);	break;
		case CHANNEL_G:		xil_printf("Channel G:%d\t",channel);	break;
		case CHANNEL_H:		xil_printf("DAC_VPED:%d\t",channel);	break;
		case CHANNEL_ALL:	xil_printf("Channel ALL:%d\t",channel);	break;
		default :
			return XST_FAILURE;
			break;
	}

		//Voltage
	if(voltage >= 2.5) intvolt = 65535;
	else intvolt = (int)(65536.0 * voltage / 2.5);
	printf("%lf V\r\n",voltage);


	WriteBuffer[0] = 0x30 | channel;	// 0x30 command to write and update | channel is channel
	WriteBuffer[1] = intvolt>>8;	//0b10000000; // MSB First
	WriteBuffer[2] = intvolt & 0x00FF;	//0b00000000; // LSB Last
	while (XIicPs_BusIsBusy(&Iic)) {
		/* NOP */
	}
	int i;
	for(i=0; i <5 ; i++){			// 5 time, because sometime it's busy
		XIicPs_MasterSend(&Iic, (u8*)&WriteBuffer, (int) 4, IIC_SLAVE_ADDRESS);
		if(Status == XST_SUCCESS){
			break;
		}
	}
	if(i ==5) return XST_FAILURE;

	sleep(1);	//Time for the DAC to ouput and stabilize the voltages
	return Status;




}
