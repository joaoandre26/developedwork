#include <msp430.h> 
#include <stdint.h>

//Local libraries
#include "./src/adc.h"
#include "./src/timer0A0.h"
#include "./src/timer0A1.h"
#include "./src/uart.h"
#include "./src/sw.h"
/*Constant Values*/
#define BUFF_SIZE 1024
/*Global Variables*/
uint16_t ADCVal = 0;
uint16_t count = 0;
uint16_t testcnt = 0;
uint16_t adcData[BUFF_SIZE];
/*Global Flags*/
uint8_t reFLAG = 0;
uint8_t TFLAG = 0;
/*Local Functions*/
void enMeasurment(void);
void readADC(void);
void configIOLed(void);
void delayMS(uint16_t ms);
void cleanArr(uint16_t *data, uint16_t size);
/*Main function*/
void main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer
    PM5CTL0 &= ~LOCKLPM5;
    configUART0M2();
    configADC();                //Config ADC AN2
    configSW1(enMeasurment);    //Config SW1 with call back for enable measurment function
    configTimer0A0(readADC);    //Configure timer with call back function to adc read function
    //configIOLed();              //Configure LED
    __enable_interrupt();       //Enable interrupts
    while(1)
    {

        //disableInterrupts();
        if(reFLAG)
        {
            count = 0;
            while(count<BUFF_SIZE)
            {
                sendUART0Short(adcData[count]);
                count++;
                delayMS(10);
            }
            reFLAG = 0;
            testcnt++;
            if(testcnt < 20)
            {
                count = 0;
                cleanArr(adcData, BUFF_SIZE);
                enMeasurment();
            }
            else
            {
                testcnt = 0;
            }
        }
    }
}
/*Functions*/
void enMeasurment(void) // ok
{
    enTimer0A0();
    SW1ClearFlag();
}

void readADC(void)
{
    //Comment the following code if is to perform one at time, with automatic hit
    enNConv();
    ADCVal = readAN2();       //Reads adc value
    if(TFLAG==0)
    {
        if(ADCVal > 750)
        {
            TFLAG=1;
            adcData[count] = ADCVal;
            count++;
        }
        reFLAG = 0;
    }
    else
    {
        if(count<BUFF_SIZE)
        {
            adcData[count] = ADCVal;
            count++;
            reFLAG = 0;
        }
        else
        {
            count = 0;
            reFLAG = 1;
            TFLAG=0;
        }
    }
}

/*Configurations functions*/
void configIOLed(void)
{
    P1DIR |= BIT0;   //Set P1.0 LED as output
    P1DIR |= BIT1;   //Set P1.1 LED as output
    P1OUT &= BIT0;  //Set P1.0 low
    P1OUT &= BIT1;   //Set P1.1 low
}
/*Additional functions*/
void delayMS(uint16_t ms)
{
    uint16_t i;
    for(i = 0; i < ms; i++)
    {
        __delay_cycles(1000);   //each 1000 cycles correspond to 1ms if CLK = SMCLK and SMCLK = 1MHz
    }
}
void cleanArr(uint16_t *data, uint16_t size)
{
    uint16_t i;
    for(i=0; i<size; i++)
    {
        data[i] = 0;
    }
}
