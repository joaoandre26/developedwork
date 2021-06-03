#include <msp430.h>
#include <stdint.h>

#include "sw.h"
/*
 * sw.c
 *
 *  Created on: 20/04/2021
 *      Author: JoaoAndre
 */
void (*callbackptrsw1)(void);   //SW1 CallBack Pointer
void (*callbackptrsw2)(void);   //SW2 CallBack Pointer

/*SW1 configuration and interruption setting*/
void configSW1(void (*callbackfunction1)(void))
{
    P2DIR &= ~BIT3;         //sw1 as input
    P2REN |= BIT3;          //enables resistor
    P2OUT |= BIT3;          //makes pull-up
    P2IES |= BIT3;          //set iqr sensitivity from H-to-L
    P2IE |= BIT3;           //local enable
    P2IFG &= ~BIT3;         //clears flag

    callbackptrsw1 = callbackfunction1;
}
void SW1ClearFlag(void)
{
    P2IFG &= ~BIT3;         //clears flag
}
/*SW2 configuration and interruption setting*/

void configSW2(void (*callbackfunction2)(void))
{
    P2DIR &= ~BIT7;         //sw1 as input
    P2REN |= BIT7;          //enables resistor
    P2OUT |= BIT7;          //makes pull-up
    P2IES |= BIT7;          //set iqr sensitivity from H-to-L
    P2IE |= BIT7;           //local enable
    P2IFG &= ~BIT7;         //clears flag

    callbackptrsw2 = callbackfunction2;
}
void SW2ClearFlag(void)
{
    P2IFG &= ~BIT7;         //clears flag
}

/*Interrupts*/
#pragma vector = PORT2_VECTOR   //The vector is the same for both
/*SW1*/
__interrupt void SW1_PORT2_ISR(void)
{
    (*callbackptrsw1)();
}
/*SW2*/
__interrupt void SW2_PORT2_ISR(void)
{
    (*callbackptrsw2)();
}
