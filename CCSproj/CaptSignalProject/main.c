#include <msp430.h> 
#include <stdint.h>
#include "./src/uart.h"
#include "./src/timer0A1.h"
#define BUFF_SIZE 1024

void delayMS(uint16_t ms);
void configSW1(void);
void configADC2(void);
void enableADCConv(uint8_t flag);
void enMeasurment(void);
void cleanArr(uint16_t *data, uint16_t size);

//uint8_t FLAG = 0;
uint16_t ADCVal;
uint8_t TFLAG = 0;
uint8_t ENFLAG = 0;
uint8_t RFLAG = 0;
uint16_t adcData[BUFF_SIZE];
uint16_t count = 0;
uint16_t testcnt = 0;
void main(void)
{
    P1DIR |= (BIT1|BIT0);
    P1OUT &= ~(BIT1|BIT0);
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer
    configUART0M2();
    PM5CTL0 &= ~LOCKLPM5;
    configSW1();
    configADC2();
    configTimerA1();

    __enable_interrupt();
    while(1)
    {

        //disableInterrupts();
        if(ENFLAG)
        {
            count = 0;
            while(count<BUFF_SIZE)
            {
                sendUART0Short(adcData[count]);
                count++;
                delayMS(10);
                P1OUT ^= BIT1;
            }
            ENFLAG = 0;
            testcnt++;
            if(testcnt < 10)
            {
                count = 0;
                cleanArr(adcData, BUFF_SIZE);
                enMeasurment();
            }
        }

    }
}
void configSW1(void)
{
    P2DIR &= ~BIT3;         //sw1 as input
    P2REN |= BIT3;          //enables resistor
    P2OUT |= BIT3;          //makes pull-up
    P2IES |= BIT3;          //set iqr sensitivity from H-to-L
    P2IE |= BIT3;           //local enable
    P2IFG &= ~BIT3;         //clears flag

    TFLAG = 0;
}
void configADC2(void)
{
    //Pins 0 and 1 are used as Leds for debug
    //Set A2 input with analog function
    // See table 6-17 in msp430fr2433 datasheet for more detailed information
    P1SEL1 |= BIT2;
    P1SEL0 |= BIT2;

    //SYSCFG2 |= ADCPCTL2;
    //Configuration of the ADC
    ADCCTL0 &= ~(ADCSHT3 | ADCSHT2 | ADCSHT1 | ADCSHT0);
    ADCCTL0 |= ADCSHT_6;   // Sample-and-Hold at 256 factor CLK/256=3906Hz
    ADCCTL0 |= ADCON;       // Turn ON the ADC

    ADCCTL1 |= ADCSSEL_2;   // Selects SMCLK = 1MHz
    ADCCTL1 |= ADCSHP;      // Uses ADC timer to trigger conversion
    //ADCCTL1 |= ADCISSH;     // Inverts input

    // Selects the input
    ADCMCTL0 |= ADCINCH_2;

    // Sets IRQ
    ADCIE |= ADCIE0;
}
void enMeasurment(void)
{
//    enTimer0A1();
    P1OUT ^= BIT1;
    //delayMS(50);
    ADCCTL0 |= ADCENC | ADCSC;
    P2IFG &= ~BIT3;         //clears flag
}
void delayMS(uint16_t ms)
{
    uint16_t i;
    for(i = 0; i < ms; i++)
    {
        __delay_cycles(1000);   //each 1000 cycles correspond to 1ms if CLK = SMCLK and SMCLK = 1MHz
    }
}

#pragma vector = ADC_VECTOR
__interrupt void ADC_ISR(void)
{
    //Comment the following code if is to perform one at time, with automatic hit
    ADCVal = ADCMEM0;       //Reads adc value
    if(TFLAG==0)
    {
        if(ADCVal > 750)
        {
            TFLAG=1;
//            sendUART0ShortInt(ADCVal);
//            enableInterrupts();
            adcData[count] = ADCVal;
            count++;
        }
        ENFLAG = 0;
        ADCCTL0 |= ADCENC | ADCSC;
    }
    else
    {
        if(count<BUFF_SIZE)
        {
//            sendUART0ShortInt(ADCVal);
//            enableInterrupts();
            adcData[count] = ADCVal;
            count++;
            ENFLAG = 0;
            ADCCTL0 |= ADCENC | ADCSC;
        }
        else
        {
            count = 0;
            ENFLAG = 1;
            TFLAG=0;
        }
    }
// Uncoment the following code to perfor one test at a time
//
//
//    ADCVal = ADCMEM0;       //Reads adc value
//    if(count<BUFF_SIZE)
//    {
//        adcData[count] = ADCVal;
//        count++;
//        ENFLAG = 0;
//        ADCCTL0 |= ADCENC | ADCSC;
//    }
//    else
//    {
//        count = 0;
//        ENFLAG = 1;
//        TFLAG=0;
//    }
//
//    P1OUT ^= BIT0;

}

#pragma vector = PORT2_VECTOR
__interrupt void SW1_PORT2_ISR(void)
{
    testcnt = 0;
    enMeasurment();
    //Uncomment if manual automatic hit
//    enTimer0A1();
//    P1OUT ^= BIT1;
//    //delayMS(50);
//    ADCCTL0 |= ADCENC | ADCSC;
//    P2IFG &= ~BIT3;         //clears flag
}
void cleanArr(uint16_t *data, uint16_t size)
{
    uint16_t i;
    for(i=0; i<size; i++)
    {
        data[i] = 0;
    }
}
