#include <msp430.h> 
#include <stdint.h>

//#include "./src/timer0A0.h"
#include "./src/sw.h"
#include "./src/uart.h"

#define BUFF_SIZE 1024

int16_t reData[BUFF_SIZE];

uint16_t count = 0;
uint16_t testcnt = 0;
uint8_t DONE = 0;

void configAll(void);
void configTimer0A0(void);
void configADC(void);

void enMeasurment(void);
void delayMS(uint16_t ms);
/**
 * main.c
 */

void main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	PM5CTL0 &= ~LOCKLPM5;

	configUART0M2();
	configSW1(enMeasurment);    //Config SW1 with call back for enable measurment function
	configAll();
	__enable_interrupt();       //Enable interrupts
	while(1)
	{
	    if(DONE)
        {
            count = 0;
            while(count<BUFF_SIZE)
            {
                sendUART0Short(reData[count]);
                count++;
                delayMS(10);
                //P1OUT ^= BIT1;
            }
            //reFLAG = 0;
            testcnt++;
            if(testcnt < 1)
            {
                count = 0;
                //move the line below before the if or add it to the else statement
                //cleanArr(adcData, BUFF_SIZE);
                //testcnt = 0;
                TA0CCTL0 |= CCIE;
            }
            else
            {
                testcnt = 0;
            }
        }
	}
}

/**/
void configAll(void)
{
    configTimer0A0();
    configADC();
}
void configTimer0A0(void)// (*callbackfnc)(void))
{
    TA0CTL |= TACLR;       //clear the taxR variable
    TA0CTL |= TASSEL_2;    //Selects SMCLK as clk source
    TA0CTL |= ID_0;        //Clk division factor is 1
    TA0CTL |= MC_1;        //selects UP mode until TAxCCR0

    TA0CCR0 = 73;//263;        //TAxR will count until this value, the it resets and starts over
    //Note: The actual value of TA0CCR0 should be 249, but in reality it doesn't sample the signal every 250us, but in 237us, the difference
    //was added to the TA0CCR0, now samples every 250us
    //callbackptr=callbackfnc;
    P1DIR |= BIT0;   //Set P1.0 LED as output
    P1OUT &= BIT0;  //Set P1.0 low
}
void configADC(void)
{
    //Pins 0 and 1 are used as Leds for debug
    //Set A2 input with analog function
    P1SEL1 |= BIT2;
    P1SEL0 |= BIT2;

    //SYSCFG2 |= ADCPCTL2;
    //Configuration of the ADC
    ADCCTL0 &= ~(ADCSHT3 | ADCSHT2 | ADCSHT1 | ADCSHT0);    //clears default setting of 4 bin(01)
    ADCCTL0 |= ADCSHT_0;   // Set conv clock cycles = 16 bin(10)
    ADCCTL0 |= ADCON;       // Turn ON the ADC

    ADCCTL1 |= ADCSSEL_2;   // Selects SMCLK = 1MHz
    ADCCTL1 |= ADCSHP;      // Uses ADC timer to trigger conversion
    //ADCCTL1 |= ADCISSH;     // Inverts input

    // Selects the input
    ADCMCTL0 |= ADCINCH_2;
}
/**/
#pragma vector = TIMER0_A0_VECTOR
__interrupt void TIMER0_A0_ISR(void)
{
    if(count<1024)
    {
        ADCCTL0 |= ADCENC | ADCSC;
        while((ADCIFG & ADCIFG0) == 0);
        reData[count] = ADCMEM0;
        //count = 0;
        count++;
        DONE = 0;
    }
    else
    {
        count = 0;
        TA0CCTL0 &= ~CCIE;
        DONE = 1;
    }
    //P1OUT ^= BIT0;
    //(*callbackptr)();
    //cnt++;
}
/**/
void enMeasurment(void)
{
    TA0CCTL0 |= CCIE;
    SW1ClearFlag();
}

void delayMS(uint16_t ms)
{
    uint16_t i;
    for(i = 0; i < ms; i++)
    {
        __delay_cycles(1000);   //each 1000 cycles correspond to 1ms if CLK = SMCLK and SMCLK = 1MHz
    }
}
