#include <msp430.h>
#include <stdint.h>
#include "timer0A0.h"
/*
 * timer0A0.c
 *
 *  Created on: 18/08/2020
 *      Author: JoaoAndre
 */
uint16_t cnt = 0;
void (*callbackptr)(void);

void configTimer0A0(void (*callbackfnc)(void))
{
    TA0CTL |= TACLR;       //clear the taxR variable
    TA0CTL |= TASSEL_2;    //Selects SMCLK as clk source
    TA0CTL |= ID_0;        //Clk division factor is 1
    TA0CTL |= MC_1;        //selects UP mode until TAxCCR0

    TA0CCR0 = 249;        //TAxR will count until this value, the it resets and starts over
    callbackptr=callbackfnc;
}
void enTimer0A0(void)
{                   //resets the counter value
    TA0CCTL0 |= CCIE;           //Interrupt enable
}
void disTimer0A0(void)
{
    TA0CCTL0 &= ~CCIE;        //Interrupt disable
}
uint16_t getCounterValue(void)
{
    return cnt;
}
void clearCounterValue(void)
{
    cnt = 0;
}
#pragma vector = TIMER0_A0_VECTOR
__interrupt void TIMER0_A0_ISR(void)
{
    (*callbackptr)();
    cnt++;
}


