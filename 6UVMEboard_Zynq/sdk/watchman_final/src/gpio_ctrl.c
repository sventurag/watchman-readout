#include "gpio_ctrl.h"

XGpioPs Gpio;    /* The driver instance for GPIO Device. */
XGpioPs_Config *ConfigPtr;
int gpio_toggling(void)
{

int Status;
int pin_a=11;
int pin_b=12;
xil_printf("pins= %d, %d \r\n",pin_a,pin_b);
///* Initialize the GPIO driver. */
//ConfigPtr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_DEVICE_ID);
//Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddr);
//if (Status != XST_SUCCESS) {
//return XST_FAILURE;
//}
//
//	XGpioPs_SetDirectionPin(&Gpio, pin_a, 1);
//	usleep(10);
//	XGpioPs_SetOutputEnablePin(&Gpio, pin_a, 1);
//	usleep(10);
//	XGpioPs_SetDirectionPin(&Gpio, pin_b, 1);
//	usleep(10);
//	XGpioPs_SetOutputEnablePin(&Gpio, pin_b, 1);
//	usleep(10);
//	int j;
// for (j=0;j<1;j++){
//	 while(1) {
	XGpioPs_WritePin(&Gpio, pin_a, 0);
	XGpioPs_WritePin(&Gpio, pin_b, 0);

	usleep(10);
	XGpioPs_WritePin(&Gpio, pin_a, 1);
	XGpioPs_WritePin(&Gpio, pin_b, 1);
    usleep(10);
	XGpioPs_WritePin(&Gpio, pin_a, 0);
	XGpioPs_WritePin(&Gpio, pin_b, 0);

	usleep(10);
	XGpioPs_WritePin(&Gpio, pin_a, 1);
	XGpioPs_WritePin(&Gpio, pin_b, 1);
    usleep(10);
	XGpioPs_WritePin(&Gpio, pin_a, 0);
	XGpioPs_WritePin(&Gpio, pin_b, 0);

	usleep(10);
	XGpioPs_WritePin(&Gpio, pin_a, 1);
	XGpioPs_WritePin(&Gpio, pin_b, 1);
	usleep(10);
	XGpioPs_WritePin(&Gpio, pin_a, 0);
	XGpioPs_WritePin(&Gpio, pin_b, 0);

	usleep(10);
	XGpioPs_WritePin(&Gpio, pin_a, 1);
	XGpioPs_WritePin(&Gpio, pin_b, 1);
//	//usleep(10);

	xil_printf("Toggling finished \r\n");

//}
return XST_SUCCESS;
}


int gpio_init(void){
xil_printf("gpio_init \r\n");

int Status;
//int gpio_pins[5]={11,12,0,13,10};
//int i;
int pin_a=11;
int pin_b=12;

/* Initialize the GPIO driver. */
ConfigPtr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_DEVICE_ID);
Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddr);
if (Status != XST_SUCCESS) {
return XST_FAILURE;
}

XGpioPs_SetDirectionPin(&Gpio, pin_a, 1);
usleep(10);
XGpioPs_SetOutputEnablePin(&Gpio, pin_a, 1);
usleep(10);
XGpioPs_SetDirectionPin(&Gpio, pin_b, 1);
usleep(10);
XGpioPs_SetOutputEnablePin(&Gpio, pin_b, 1);
usleep(10);




return XST_SUCCESS;

}




void gpio_write(int pin, u32 value){
	XGpioPs_WritePin(&Gpio, pin, value);

}


void gpio_set_direction(int pin, u32 direction){
	XGpioPs_SetDirectionPin(&Gpio, pin, direction);

}




