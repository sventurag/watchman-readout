#include "I2C_bit_banging.h"

/*
 * c3k_i2cbb.c
 *
 * Copyright 2018  Calvin A. Cherry (calvincherry@gmail.com)
 *                 calcium3000.wordpress.com
 *
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 */

#include <stdint.h>
#include <stdbool.h>
int gpio_SCL;
int gpio_SDA;


//static uint8_t _read_byte( bool, bool );

/* Basic I2C functions */
void I2C_SET_SCL(void){
	gpio_set_direction(gpio_SCL,0);
//	gpio_write(gpio_SCL, 1);
};

void I2C_CLR_SCL(void){
	gpio_set_direction(gpio_SCL, 1);
	gpio_write(gpio_SCL, 0);
};

void I2C_SET_SDA(void){
	gpio_set_direction(gpio_SDA, 0);
//	gpio_write(gpio_SDA, 1);
};

void I2C_CLR_SDA(void){
	gpio_set_direction(gpio_SDA, 1);
	gpio_write(gpio_SDA, 0);
};
//
//
void I2C_DELAY(void){
	usleep(20);
};
//
///* PIC */
//#ifdef PIC
//
//void i2c_init( void )
//{
//    /* Enable digital I/O */
//    I2C_ANSEL &= ~( SCL | SDA );
//
//    I2C_SET_SCL
//    I2C_SET_SDA
//
//    I2C_DELAY
//}
//
//#endif
//
//
///* MSP430 */
//#ifdef MSP430
//
//void i2c_init( void )
//{
//    /* Enable digital I/O */
//    I2C_PSEL &= ~( SCL | SDA );
//    I2C_P2SEL &= ~( SCL | SDA );
//
//    I2C_SET_SCL
//    I2C_SET_SDA
//
//    I2C_DELAY
//}
//#endif
//
//
///* AVR */
//#ifdef AVR
//
//void i2c_init( void )
//{
//    I2C_SET_SCL
//    I2C_SET_SDA
//
//    I2C_DELAY
//}
//
//#endif


/* Initiating a start condition */
 void _start_condition( void )
{
    I2C_SET_SCL();
    I2C_SET_SDA();

    I2C_DELAY();

    I2C_CLR_SDA();

    I2C_DELAY();

    I2C_CLR_SCL();

    I2C_DELAY();
//    xil_printf("start_condition finished \r\n");
}


/* Initiating a stop condition */
 void _stop_condition( void )
{
    I2C_CLR_SDA();

    I2C_DELAY();

    I2C_SET_SDA();

    I2C_DELAY();

    I2C_CLR_SDA();

    I2C_DELAY();

	I2C_SET_SCL();

    I2C_DELAY();
    I2C_DELAY();

      I2C_SET_SDA();


}


/* Writing a bit */
 void _write_bit( uint8_t b )
{
    if( b > 0 )
    	I2C_SET_SDA();
    else I2C_CLR_SDA();


    I2C_DELAY();

	I2C_SET_SCL();

    I2C_DELAY();

    I2C_CLR_SCL();
}



///* Reading a bit */
//static uint8_t _read_bit( void )
//{
//    uint8_t b;
//
//    I2C_SET_SDA
//
//    I2C_DELAY
//
//    I2C_SET_SCL
//
//    I2C_DELAY
//
//    if( ( I2C_INPORT & SDA ) > 0 ) b = 1;
//    else b = 0;
//
//    I2C_CLR_SCL
//
//    return b;
//}



 /* Write */

  bool _wait_write(void){

         I2C_DELAY();

 	     I2C_SET_SCL();

 	     I2C_DELAY();

 	     I2C_CLR_SCL();

// 	     I2C_DELAY();
//
// 	     I2C_SET_SCL();
//
// 	   	 I2C_DELAY();
//
// 	     I2C_CLR_SCL();


 	     return true;

  }

/* Acknowledge */

 bool _wait_ack(void){

	    I2C_SET_SDA();
//
        I2C_DELAY();

	     I2C_SET_SCL();

	     I2C_DELAY();

	     I2C_CLR_SCL();

//
//	     I2C_DELAY();
//
//	     I2C_SET_SCL();
//
//	   	 I2C_DELAY();
//
//	     I2C_CLR_SCL();


	     return true;

 }

/* Writing a byte */
 bool _write_byte( uint8_t B,bool isSlaveADDRESS,
                         bool start,
                         bool stop )
{
	int numBits;
	int msbMask;
    if (isSlaveADDRESS){
    	numBits=7; //Slave address is 7-bit
        msbMask=0x40;
    }
    else {numBits=8; //It is a command or data
        msbMask=0x80;
    }
	//uint8_t ack = 0;

    if( start ) _start_condition();

    uint8_t i;

    for( i = 0; i < numBits; i++ )
    {
        /* Write the most-significant bit */
        _write_bit( B & msbMask );
        B <<= 1;
    }

  //  ack = _read_bit();

    if( stop ){
        _wait_ack();
    	_stop_condition();
    }

    return true; //Not ack in account
}


///* Reading a byte */
//static uint8_t _read_byte( bool ack,
//                           bool stop )
//{
//    uint8_t B = 0;
//
//    uint8_t i;
//    for( i = 0; i < 8; i++ )
//    {
//        B <<= 1;
//        B |= _read_bit();
//    }
//
//    if( ack ) _write_bit( 0 );
//    else _write_bit( 1 );
//
//    if( stop ) _stop_condition();
//
//    return B;
//}


/* Sending a byte with I2C */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Sends slave address plus write bit and one byte of data.
Params:
    address = 7-bit slave address
    data = one byte of data to send following slave address
Returns:
    true if slave has ACK'd both sent bytes
*/
//bool i2c_send_byte( uint8_t address,
//                    uint8_t data )
//{
//    /* Start, send address */
//    if( _write_byte( address << 1, true, false ) )
//    {
//        /* Send data, stop */
//        if( _write_byte( data, false, true ) ) return true;
//    }
//
//    /* Make sure to impose a stop if NAK'd */
//    _stop_condition();
//    return false;
//}
//

//
///* Receiving a byte with I2C */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Sends slave address plus read bit and receives one byte of data.
Params:
    address = 7-bit slave address
Returns:
    byte received from slave
*/
//uint8_t i2c_receive_byte( uint8_t address )
//{
//    /* Start, send address */
//    if( _write_byte( ( address << 1 ) | 0x01, true, false ) )
//    {
//        /* Read, stop */
//        return _read_byte( false, true );
//    }
//
//    /* Return zero if NAK'd */
//    return 0;
//}


/* Sending a byte of data with I2C */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Sends slave address plus write bit, then two consecutive data bytes.
(The first byte is typically used as a register address, and the second
as a data byte.)
Params:
    address = 7-bit slave address
    reg = first byte of data after the slave address
    data = second byte of data after the slave address
Returns:
    true if slave has ACK'd all three sent bytes
*/
bool i2c_send_byte_data( uint8_t address,
                         uint8_t reg,
                         uint16_t data )
{
	uint8_t msbData= data >> 8;
	uint8_t lsbData = data & 0x00FF;
    /* Start, send address */
    if( _write_byte( address, true, true, false ) )
    {
    	_wait_write();
    	_wait_ack();
        /* Send register */
        if( _write_byte( reg,false ,false, false ) )
        {
        	_wait_ack();
            /* Send data, stop */
            if( _write_byte( msbData,false , false, false ) ){
                _wait_ack();
                if( _write_byte( lsbData,false, false, true ) ){
                 	return true;

                }
            }

        }
    }

    /* Make sure to impose a stop if NAK'd */
//    _stop_condition();
    return false;
}

/* Sending a byte of data with I2C */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Sends slave address plus write bit, then two consecutive data bytes.
(The first byte is typically used as a register address, and the second
as a data byte.)
Params:
    address = 7-bit slave address
    reg = first byte of data after the slave address
    data = second byte of data after the slave address
Returns:
    true if slave has ACK'd all three sent bytes
*/
bool i2c_send_byte_data_8574( uint8_t address,
                         uint8_t reg,
                         uint16_t data )
{
	uint8_t msbData= data >> 8;
	uint8_t lsbData = data & 0x00FF;
    /* Start, send address */
    if( _write_byte( address, true, true, false ) )
    {
    	_wait_write();
    	_wait_ack();
        /* Send register */
        if( _write_byte( reg,false ,false, false ) )
        {
        	_wait_ack();
            /* Send data, stop */
            if( _write_byte( msbData,false , false, false ) ){
                _wait_ack();
                if( _write_byte( lsbData,false, false, false ) ){
                	_wait_ack();
          	      I2C_CLR_SDA();

                	   I2C_DELAY();

                		I2C_SET_SCL();

                	    I2C_DELAY();
//                	    I2C_DELAY();

                	      I2C_SET_SDA();
                	return true;

                }
            }

        }
    }

    /* Make sure to impose a stop if NAK'd */
//    _stop_condition();
    return false;
}

///* Receiving a byte of data with I2C */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Sends slave address plus read bit and a data byte, and receives one byte
of data.
Params:
    address = 7-bit slave address
    data = one byte of data to send following slave address
Returns:
    byte received from slave
*/

//uint8_t i2c_receive_byte_data( uint8_t address,
//                               uint8_t reg )
//{
//    /* Start, send address */
//    if( _write_byte( address << 1, true, false ) )
//    {
//        /* Send desired register */
//        if( _write_byte( reg, false, false ) )
//        {
//            /* Start again, send address */
//            if( _write_byte( ( address << 1 ) | 0x01, true, false ) )
//            {
//                /* Read, stop */
//                return _read_byte( false, true );
//            }
//        }
//    }
//
//    /* Make sure to impose a stop if NAK'd */
//    _stop_condition();
//    return 0;
//}

int set_DAC_CHANNEL(int channel, float voltage ){
	xil_printf("set channel % \r\n", channel);
gpio_SCL=11;
gpio_SDA=12;
int Status;
uint16_t intvolt;
		if(voltage >= 2.5) intvolt = 65535;
		else intvolt = (uint16_t)(65535.0 * voltage / 3.68);
		xil_printf("%f V\r\n",voltage);
//	_start_condition();

	if (i2c_send_byte_data(IIC_SLAVE_ADDRESS,WRITE_REG| channel, intvolt)) {
//	if (i2c_send_byte_data(IIC_SLAVE_ADDRESS,0x30|2, intvolt)) {
		return XST_SUCCESS;
	}
return XST_SUCCESS;

}

int set_DAC_CHANNEL_8574( float voltage ){
gpio_SCL=12;
gpio_SDA=11;
int Status;
uint16_t intvolt;
		if(voltage >= 2.5) intvolt = 65535;
		else intvolt = (uint16_t)(65535.0 * voltage / 2.7);
		xil_printf("%f V\r\n",voltage);
//	_start_condition();

	if (i2c_send_byte_data(IIC_SLAVE_ADDRESS_8574,0x20, intvolt)) {
//	if (i2c_send_byte_data(IIC_SLAVE_ADDRESS,0x30|2, intvolt)) {
		return XST_SUCCESS;
	}
return XST_SUCCESS;

}


