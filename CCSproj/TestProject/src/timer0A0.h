/*
 * timer0A0.h
 *
 *  Created on: 18/08/2020
 *      Author: JoaoAndre
 */

#ifndef TIMER0A0_H_
#define TIMER0A0_H_

#include <msp430.h>
#include <stdint.h>


void configTimer0A0(void);
void enTimer0A0(void);
void disTimer0A0(void);
uint16_t getCounterValue(void);
void clearCounterValue(void);



#endif /* TIMER0A0_H_ */
