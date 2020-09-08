#include <msp430.h> 

#include "./src/uart.h"
#include "./src/timer0A0.h"
#define BUFF_SIZE 512

void delayMS(uint16_t ms);
void configSW1(void);
//uint8_t FLAG = 0;
//uint16_t cnt = 0;

void main(void)
{
    P1DIR |= (BIT1|BIT0);
    P1OUT &= ~(BIT1|BIT0);
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	configUART0M2();
    PM5CTL0 &= ~LOCKLPM5;
    configTimer0A0();
    //configSW1();
    __enable_interrupt();

    while(1)
    {
        enTimer0A0();
        delayMS(100);
        disTimer0A0();
        P1OUT ^= BIT0;
        sendUART0Short(getCounterValue());
        delayMS(100);
        clearCounterValue();
    }
}

/*
#pragma vector = PORT2_VECTOR
__interrupt void SW1_PORT2_ISR(void)
{
    P1OUT ^= BIT1;
    if(!FLAG)
    {
        enTIMER0_A0();
    }
    else
    {
        disTIMER0_A0();
    }
    P2IFG &= ~BIT3;         //clears flag
}*/
void delayMS(uint16_t ms)
{
    uint16_t i;
    for(i = 0; i < ms; i++)
    {
        __delay_cycles(1000);   //each 1000 cycles correspond to 1ms if CLK = SMCLK and SMCLK = 1MHz
    }
}
/*
void configSW1(void)
{
    P2DIR &= ~BIT3;         //sw1 as input
    P2REN |= BIT3;          //enables resistor
    P2OUT |= BIT3;          //makes pull-up
    P2IES |= BIT3;          //set iqr sensitivity from H-to-L

    P2IE |= BIT3;           //local enable

    P2IFG &= ~BIT3;         //clears flag
}*/
