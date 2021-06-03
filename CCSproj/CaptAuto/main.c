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
uint16_t count = 0;
uint16_t testcnt = 0;
static uint16_t adcData[BUFF_SIZE];
/*Global Flags*/
uint8_t reFLAG = 0;
/*Local Functions*/
void enMeasurment(void);
void readADC(void);
void configIOLed(void);
void delayMS(uint16_t ms);
void cleanArr(uint16_t *data, uint16_t size);
/*Main function*/
void main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	PM5CTL0 &= ~LOCKLPM5;
	configUART0M2();
	configADC();                //Config ADC AN2
	configSW1(enMeasurment);    //Config SW1 with call back for enable measurment function
	configTimer0A0(readADC);    //Configure timer with call back function to adc read function
	configTimerA1();
	configIOLed();              //Configure LED
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
                //P1OUT ^= BIT1;
            }
            reFLAG = 0;
            testcnt++;
            if(testcnt < 1)
            {
                count = 0;
                //move the line below before the if or add it to the else statement
                cleanArr(adcData, BUFF_SIZE);
                //testcnt = 0;
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
void enMeasurment(void)
{
    enTimer0A1();
    enTimer0A0();
    SW1ClearFlag();
}

void readADC(void)
{
    if(count<BUFF_SIZE)
    {
        enNConv();
        adcData[count] = readAN2();
        count++;
        //reFLAG = 0;
    }
    else
    {
        reFLAG = 1;
        count = 0;
        //disTimer0A0();
    }
    P1OUT ^= BIT0;
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
