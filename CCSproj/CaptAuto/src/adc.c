#include <msp430.h>
#include <stdint.h>

#include "adc.h"
/*
 * adc.c
 *
 *  Created on: 20/04/2021
 *      Author: JoaoAndre
 */
void configADC(void)
{
    //Pins 0 and 1 are used as Leds for debug
    //Set A2 input with analog function
    P1SEL1 |= BIT2;
    P1SEL0 |= BIT2;

    //SYSCFG2 |= ADCPCTL2;
    //Configuration of the ADC
    ADCCTL0 &= ~(ADCSHT3 | ADCSHT2 | ADCSHT1 | ADCSHT0);    //clears default setting of 4 bin(01)
    ADCCTL0 |= ADCSHT_2;   // Set conv clock cycles = 16 bin(10)
    ADCCTL0 |= ADCON;       // Turn ON the ADC

    ADCCTL1 |= ADCSSEL_2;   // Selects SMCLK = 1MHz
    ADCCTL1 |= ADCSHP;      // Uses ADC timer to trigger conversion
    //ADCCTL1 |= ADCISSH;     // Inverts input

    // Selects the input
    ADCMCTL0 |= ADCINCH_2;
}
void enNConv(void)
{
    ADCCTL0 |= ADCENC | ADCSC;  //Enable and start conversion
}
uint16_t readAN2(void)
{
    while((ADCIFG & ADCIFG0) == 0);
    return ADCMEM0;
}
