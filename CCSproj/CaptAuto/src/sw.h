/*
 * sw.h
 *
 *  Created on: 20/04/2021
 *      Author: JoaoAndre
 */

#ifndef SRC_SW_H_
#define SRC_SW_H_

#include <msp430.h>
#include <stdint.h>

void configSW1(void (*callbackfunction)(void));
void SW1ClearFlag(void);
void configSW2(void (*callbackfunction)(void));
void SW2ClearFlag(void);



#endif /* SRC_SW_H_ */
