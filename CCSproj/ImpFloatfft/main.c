#include <msp430.h> 
#include <stdint.h>

//Local Libraries
#include "./src/uart.h"
#include "./src/float_fft.h"
#include "./src/spectral_analysisf.h"
#include "./src/timer0A0.h"


#define BUFF_SIZE 512
#define LOG_2_BUFF_SIZE 9
#define SAMP_FREQ 4000
#define MULT_FACT 10

void clearBuffer(double *buff, int size);
void main(void)
{
    uint16_t domF, excT;
    int n, i;
    double reData[BUFF_SIZE];
    double imData[BUFF_SIZE]={0};
    P1DIR |= (BIT0|BIT1);
    P1OUT &= ~(BIT0|BIT1);
    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer
    configUART0M2();
    configTimer0A0();
    PM5CTL0 &= ~LOCKLPM5;
    __enable_interrupt();
    n = 0;
    while(n<10)
    {
        //Reads the data from uart and saves it on the buffer
        i=0;
        while(i<BUFF_SIZE)
        {
            P1OUT ^= BIT0;
            reData[i] = (double)getUART0Short();
            //__delay_cycles(10);
            //sendUART0Short(reData[i]);
            i++;
        }
        //P1OUT ^= BIT0;
        //Process the data using the developed algorithm of the fft
        enTimer0A0();
        float_fft(reData, imData, LOG_2_BUFF_SIZE, BUFF_SIZE);
        //Process the spectral analysis
        domF = (uint16_t)dominantFreq(reData, imData, BUFF_SIZE, SAMP_FREQ, MULT_FACT);
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
void clearBuffer(double *buff, int size)
{
    int i;
    for(i=0;i<size;i++)
    {
        buff[i] = 0;
    }
}
