/*
 * adc.h
 *
 *  Created on: 20/04/2021
 *      Author: JoaoAndre
 */

#ifndef SRC_ADC_H_
#define SRC_ADC_H_

#include <msp430.h>
#include <stdint.h>

void configADC(void);
void enNConv(void);
uint16_t readAN2(void);


#endif /* SRC_ADC_H_ */
