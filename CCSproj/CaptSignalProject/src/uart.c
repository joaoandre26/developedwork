/*
 * uart.c
 *
 *  Created on: 11/08/2020
 *      Author: JoaoAndre
 */
#include <msp430.h>
#include <stdint.h>
#include "uart.h"

uint16_t TXVal = 0;
uint8_t TXENABLE = 0;

void configUART0(void)
{
    P1SEL0 |= BIT4 | BIT5;
    P1SEL1 &= ~(BIT4 | BIT5);

    UCA0CTLW0 |= UCSWRST;       //Reset hold
    UCA0CTLW0 |= UCSSEL__SMCLK; //Selects SMCLK as clk source(1MHz by default)
    UCA0CTLW0 &= ~(UC7BIT);     //Selects 8bit mode

    UCA0BR0 = 6;
    UCA0BR1 = 0x00;
    UCA0MCTLW = 0x2000 | UCBRF_8 | UCOS16;
    UCA0CTLW0 &= ~UCSWRST;
    //UCA0IE |= (UCTXIE|UCRXIE);
}
void configUART0M2(void)
{
    //configures the uart with a baud rate of 115200 and a clk of 1MHz
    P1SEL0 |= BIT4 | BIT5;
    P1SEL1 &= ~(BIT4 | BIT5);
    UCA0CTLW0 |= UCSWRST;       //Reset hold
    UCA0CTLW0 |= UCSSEL__SMCLK; //Selects SMCLK as clk source(1MHz by default)
    UCA0CTLW0 &= ~(UC7BIT);     //Selects 8bit mode

    UCA0BR0 = 8;
    UCA0BR1 = 0;
    UCA0MCTLW |= 0xD600;
    UCA0CTLW0 &= ~UCSWRST;

}
uint8_t getUART0Byte(void)
{
    while(!(UCA0IFG & UCRXIFG));    //Gets locked on while loop until there is a byte ready to read from the buffer
    return UCA0RXBUF;               //Returns the byte available on the buffer
}
void sendUART0Byte(uint8_t value)
{
    while(!(UCA0IFG & UCTXIFG));    //Gets locked on the while loop until the is cleared and the buffer is ready to send data
    UCA0TXBUF = value;              //Puts the value to send on the transmission buffer
}
uint16_t getUART0Short(void)
{
    uint8_t msb, lsb;
    msb = getUART0Byte();
    __delay_cycles(100);            //Can be removed if is just receiving
    lsb = getUART0Byte();
    //__delay_cycles(100);
    return (uint16_t)((msb<<8) | lsb);
}
void sendUART0Short(uint16_t value)
{
    sendUART0Byte((uint8_t)(value>>8)); //Send in the first place the 8 msb
    __delay_cycles(100);               //Small delay, to avoid data overlapping //Can be changed for 10 if is just receiving
    sendUART0Byte((uint8_t)value);      //Send the 8 lsb
    //__delay_cycles(100);
}
//
//void sendUART0ShortInt(uint16_t value)
//{
//    TXVal = value;
//}
//void enableInterrupts(void)
//{
//    UCA0IE |= UCTXIE;
//}
//void disableInterrupts(void)
//{
//    UCA0IE &= ~UCTXIE;
//}
//
//#pragma vector = USCI_A0_VECTOR
//__interrupt void ISR_EUSCI_A0(void)
//{
//    //Sends first MSB
//    if(!TXENABLE)
//    {
//        UCA0TXBUF = (uint8_t)(TXVal>>8);
//        UCA0IFG &= ~UCTXCPTIFG;
//        TXENABLE = !TXENABLE;
//    }
//    else
//    {
//        UCA0TXBUF = (uint8_t)TXVal;
//        UCA0IE &= ~UCTXIE;
//        UCA0IFG &= ~UCTXCPTIFG;
//        TXENABLE = !TXENABLE;
//        //disableInterrupts();
//
//    }
//    //UCA0IFG &= ~UCTXCPTIFG;
//}
//
//
