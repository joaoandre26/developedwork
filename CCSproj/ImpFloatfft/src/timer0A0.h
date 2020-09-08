/*
 * timer0A0.h
 *
 *  Created on: 18/08/2020
 *      Author: JoaoAndre
 */

#ifndef SRC_TIMER0A0_H_
#define SRC_TIMER0A0_H_

void configTimer0A0(void);
void enTimer0A0(void);
void disTimer0A0(void);
uint16_t getCounterValue(void);
void clearCounterValue(void);

#endif /* SRC_TIMER0A0_H_ */
