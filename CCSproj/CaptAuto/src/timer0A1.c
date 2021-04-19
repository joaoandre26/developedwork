/*
 * timerA1.c
 *
 *  Created on: 03/12/2020
 *      Author: JoaoAndre
 */
/*
 * Timer will be used as trigger for the solenoid
 */
#include <msp430.h>
#include <stdint.h>
#include "timer0A1.h"

#define ACTIVE_TICKS 4001 //This value times the resolution will result in a active output of 0.5s
uint16_t actTimeCnt;

void configTimer0A1(void)
{
    TA1CTL |= TACLR;       //clear the taxR variable
    TA1CTL |= TASSEL_2;    //Selects SMCLK as clk source
    TA1CTL |= ID_0;        //Clk division factor is 1
    TA1CTL |= MC_1;        //selects UP mode until TAxCCR0

    TA1CCR0 = 499;        //TAxR will count until this value, the it resets and starts over
    //Res = 500us
}
void configIO(void)
{
    P2DIR |= BIT5;
    P2OUT &= ~BIT5;
}
void configTimerA1(void)
{
    configTimer0A1();
    configIO();
}
void enTimer0A1(void)
{
    actTimeCnt = 0;
    TA1CCTL0 |= CCIE;           //Interrupt enable
    P2OUT |= BIT5;
}
void disTimer0A1(void)
{
    TA1CCTL0 &= ~CCIE;          //Interrupt disable
}
#pragma vector = TIMER1_A0_VECTOR
__interrupt void ISR_TIMER1_A0(void)
{
    actTimeCnt++;
    if(actTimeCnt>=(ACTIVE_TICKS))
    {
        actTimeCnt = 0;
        P2OUT &= ~BIT5;
        disTimer0A1();
    }
}
