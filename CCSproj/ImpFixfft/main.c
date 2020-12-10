#include <msp430.h> 
#include <stdint.h>

//Local Libraries
#include "./src/uart.h"
#include "./src/fix_fft.h"
#include "./src/spectral_analysis.h"
#include "./src/timer0A0.h"


#define BUFF_SIZE 512
#define LOG_2_BUFF_SIZE 9
#define SAMP_FREQ 44100
#define MULT_FACT 10

void clearBuffer(int16_t *buff, int size);

void main(void)
{
    uint16_t domF, excT;
    uint16_t n, i;
    int16_t reData[BUFF_SIZE];
    int16_t imData[BUFF_SIZE]={0};
    //excT = 4000;    //nr of ticks
    P1DIR |= (BIT0|BIT1);
    P1OUT &= ~(BIT0|BIT1);
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	configUART0M2();
	configTimer0A0();
	PM5CTL0 &= ~LOCKLPM5;
	__enable_interrupt();
	n = 0;
	while(n<18)
	{
	    //Reads the data from uart and saves it on the buffer
	    i=0;
	    while(i<BUFF_SIZE)
	    {
	        P1OUT ^= BIT0;
	        reData[i] = getUART0Short();
	        //__delay_cycles(10);
	        //sendUART0Short(reData[i]);
	        i++;
	    }
	    //P1OUT ^= BIT0;
	    //Process the data using the developed algorithm of the fft
	    enTimer0A0();
	    fix_fft(reData, imData, LOG_2_BUFF_SIZE);
	    //Process the spectral analysis
	    domF = dominantFreq(reData, imData, BUFF_SIZE, SAMP_FREQ, MULT_FACT);
	    disTimer0A0();
	    excT = getCounterValue();
	    //Send via uart the value of the dominant frequency
	    __delay_cycles(100);
	    sendUART0Short(domF);
	    //Send via uart the value of the dominant frequency
	    __delay_cycles(100);
	    sendUART0Short(excT);
	    clearCounterValue();
	    clearBuffer(imData, BUFF_SIZE);
	    n++;
	}
	P1OUT ^= BIT1;
}
void clearBuffer(int16_t *buff, int size)
{
    uint16_t i;
    for(i=0;i<size;i++)
    {
        buff[i] = 0;
    }
}
