/**
 * @file 	iic_DAC_LTC2657.c
 * @author	Anthony Schluchin
 * @date	15th December 2018
 * @version 0.0
 */

#include "iic_DAC_LTC2657.h"

//static s32 XcPs_SetupMaster_2(XIicPs *InstancePtr, s32 Role);
static void bin(int n);
// C Program for the binary
// representation of a given number
//void bin(int n)
//{
//    /* step 1 */
//    if (n > 1)
//        bin(n/2);
//
//    /* step 2 */
//    printf("%d\r\n", n % 2);
//}

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
int fsclkHz=100000;
int freq;
u32 ControlReg;
int BestDivB= 16;
int BestDivA =2;
int actualSClk;
int options;
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
//XIicPs_SetSClk(&Iic, XPAR_XIICPS_0_I2C_CLK_FREQ_HZ);

/*
 * Perform a self-test to ensure that the hardware was built correctly.
 */
Status = XIicPs_SelfTest(&Iic);
if (Status != XST_SUCCESS) {
	return XST_FAILURE;
}


/*
 * Read the control register and mask the Divisors.
 */
ControlReg = XIicPs_ReadReg(Config->BaseAddress,
				  (u32)XIICPS_CR_OFFSET);
ControlReg &= ~((u32)XIICPS_CR_DIV_A_MASK | (u32)XIICPS_CR_DIV_B_MASK);
ControlReg |= (BestDivA << XIICPS_CR_DIV_A_SHIFT) |
	(BestDivB << XIICPS_CR_DIV_B_SHIFT);

XIicPs_WriteReg(Config->BaseAddress, (u32)XIICPS_CR_OFFSET,
		  ControlReg);

actualSClk = XIicPs_GetSClk(&Iic);
printf("%d \r\n", actualSClk);
options = XIicPs_GetOptions(&Iic);

//bin(options);

printf("Options= %d \r\n", options);
//printf("numptions= %d \r\n", XIICPS_NUM_OPTIONS);

XIicPs_ClearOptions(&Iic, 0X02U);
//XIicPs_Reset(&Iic);

//XIicPs_SetOptions(&Iic, 0X2U );
options = XIicPs_GetOptions(&Iic);

printf("Options=%d \r\n", options);

return Status;

}


int DAC_LTC2657_SetChannelVoltage_PS(int channel, float voltage){

	int Status;
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
//	printf("%d \r\n", (int)WriteBuffer);
//	printf("%d \r\n", WriteBuffer[0]);
//	printf("%d \r\n", WriteBuffer[1]);
//	printf("%d \r\n", WriteBuffer[2]);

//	printf("%d \r\n",(int) &WriteBuffer);
	//printf("%d \r\n",(u8 *)&WriteBuffer);

	while (XIicPs_BusIsBusy(&Iic)) {
//		/* NOP */
	}
	int i;
//	for(i=0; i <10 ; i++){			// 5 time, because sometime it's busy
	XIicPs_MasterSendPolled(&Iic, &WriteBuffer, (int) 4, IIC_SLAVE_ADDRESS);
//	}
	Status = XST_SUCCESS;
// 		"CHANGE BUFFER SIZE"

/*		if(Status == XST_SUCCESS){
			break;*/
//		}
//		}

//	if(i ==10){
//		printf("Status: %d\, %d \r\n",Status,i);
//		return XST_FAILURE;
//	}


	sleep(1);	//Time for the DAC to ouput and stabilize the voltages
	return Status;




}

/**
* This function initiates an interrupt-driven send in master mode.
*
* It tries to send the first FIFO-full of data, then lets the interrupt
* handler to handle the rest of the data if there is any.
*
* @param	InstancePtr is a pointer to the XIicPs instance.
* @param	MsgPtr is the pointer to the send buffer.
* @param	ByteCount is the number of bytes to be sent.
* @param	SlaveAddr is the address of the slave we are sending to.
*
* @return	None.
*
* @note		This send routine is for interrupt-driven transfer only.
*
 ****************************************************************************/
//void XIicPs_MasterSendNOint(XIicPs *InstancePtr, u8 *MsgPtr, s32 ByteCount,u16 SlaveAddr)
//{
//	u32 BaseAddr;
//	u32 Platform = XGetPlatform_Info();
//
//	/*
//	 * Assert validates the input arguments.
//	 */
//	Xil_AssertVoid(InstancePtr != NULL);
//	Xil_AssertVoid(MsgPtr != NULL);
//	Xil_AssertVoid(InstancePtr->IsReady == (u32)XIL_COMPONENT_IS_READY);
//	Xil_AssertVoid(XIICPS_ADDR_MASK >= SlaveAddr);
//
//
//	BaseAddr = InstancePtr->Config.BaseAddress;
//	InstancePtr->SendBufferPtr = MsgPtr;
//	InstancePtr->SendByteCount = ByteCount;
//	InstancePtr->RecvBufferPtr = NULL;
//	InstancePtr->IsSend = 1;
//
////
////	/*
////	 * Set repeated start if sending more than FIFO of data.
////	 */
////	if (((InstancePtr->IsRepeatedStart) != 0)||
////		((ByteCount > XIICPS_FIFO_DEPTH) != 0U)) {
////		XIicPs_WriteReg(BaseAddr, (u32)XIICPS_CR_OFFSET,
////			XIicPs_ReadReg(BaseAddr, (u32)XIICPS_CR_OFFSET) |
////				(u32)XIICPS_CR_HOLD_MASK);
////	}
//
//	/*
//	 * Setup as a master sending role.
//	 */
//	(void)XIicPs_SetupMaster_2(InstancePtr, SENDING_ROLE);
//
//	(void)TransmitFifoFill(InstancePtr);
////
////	XIicPs_EnableInterrupts(BaseAddr,
////		(u32)XIICPS_IXR_NACK_MASK | (u32)XIICPS_IXR_COMP_MASK |
////		(u32)XIICPS_IXR_ARB_LOST_MASK);
//	/*
//	 * Do the address transfer to notify the slave.
//	 */
//	XIicPs_WriteReg(BaseAddr, XIICPS_ADDR_OFFSET, (u32)SlaveAddr);
//
//	/* Clear the Hold bit in ZYNQ if receive byte count is less than
//	 * the FIFO depth to get the completion interrupt properly.
//	 */
//	if ((ByteCount < XIICPS_FIFO_DEPTH) && (Platform == (u32)XPLAT_ZYNQ))
//	{
//		XIicPs_WriteReg(BaseAddr, XIICPS_CR_OFFSET,
//				XIicPs_ReadReg(BaseAddr, (u32)XIICPS_CR_OFFSET) &
//				(u32)(~XIICPS_CR_HOLD_MASK));
//	}
//
//}
//
///*****************************************************************************/
///*
//* This function prepares a device to transfers as a master.
//*
//* @param	InstancePtr is a pointer to the XIicPs instance.
//*
//* @param	Role specifies whether the device is sending or receiving.
//*
//* @return
//*		- XST_SUCCESS if everything went well.
//*		- XST_FAILURE if bus is busy.
//*
//* @note		Interrupts are always disabled, device which needs to use
//*		interrupts needs to setup interrupts after this call.
//*
//****************************************************************************/
//static s32 XIicPs_SetupMaster_2(XIicPs *InstancePtr, s32 Role)
//{
//	u32 ControlReg;
//	u32 BaseAddr;
//
//	Xil_AssertNonvoid(InstancePtr != NULL);
//
//	BaseAddr = InstancePtr->Config.BaseAddress;
//	ControlReg = XIicPs_ReadReg(BaseAddr, XIICPS_CR_OFFSET);
//
//
//	/*
//	 * Only check if bus is busy when repeated start option is not set.
//	 */
//	if ((ControlReg & XIICPS_CR_HOLD_MASK) == 0U) {
//		if (XIicPs_BusIsBusy(InstancePtr) == (s32)1) {
//			return (s32)XST_FAILURE;
//		}
//	}
//
//	/*
//	 * Set up master, AckEn, nea and also clear fifo.
//	 */
//	ControlReg |= (u32)XIICPS_CR_ACKEN_MASK | (u32)XIICPS_CR_CLR_FIFO_MASK |
//			(u32)XIICPS_CR_NEA_MASK | (u32)XIICPS_CR_MS_MASK;
//
//	if (Role == RECVING_ROLE) {
//		ControlReg |= (u32)XIICPS_CR_RD_WR_MASK;
//	}else {
//		ControlReg &= (u32)(~XIICPS_CR_RD_WR_MASK);
//	}
//
//	XIicPs_WriteReg(BaseAddr, XIICPS_CR_OFFSET, ControlReg);
//
////	XIicPs_DisableAllInterrupts(BaseAddr);
//
//	return (s32)XST_SUCCESS;
//}
//
