#include "gpio_ctrl.h"

XGpioPs Gpio;    /* The driver instance for GPIO Device. */
XGpioPs_Config *ConfigPtr;
int gpio_toggling(void)
{

int Status;
int pin_a=14;
int pin_b=15;
xil_printf("pins= %d, %d \r\n",pin_a,pin_b);
/* Initialize the GPIO driver. */
ConfigPtr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_DEVICE_ID);
Status = XGpioPs_CfgInitialize(&Gpio, ConfigPtr, ConfigPtr->BaseAddr);
if (Status != XST_SUCCESS) {
return XST_FAILURE;
}

	XGpioPs_SetDirectionPin(&Gpio, pin_a, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, pin_a, 1);
	XGpioPs_SetDirectionPin(&Gpio, pin_b, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, pin_b, 1);

while(1){
	XGpioPs_WritePin(&Gpio, pin_a, 0);
	XGpioPs_WritePin(&Gpio, pin_b, 0);

	usleep(10);
	XGpioPs_WritePin(&Gpio, pin_a, 1);
	XGpioPs_WritePin(&Gpio, pin_b, 1);

}
return XST_SUCCESS;
}
