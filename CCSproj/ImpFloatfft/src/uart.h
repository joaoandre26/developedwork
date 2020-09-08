/*
 * uart.h
 *
 *  Created on: 11/08/2020
 *      Author: JoaoAndre
 */

#ifndef SRC_UART_H_
#define SRC_UART_H_

#include <stdint.h>
void configUART0(void);
void configUART0M2(void);
uint8_t getUART0Byte(void);
void sendUART0Byte(uint8_t value);
uint16_t getUART0Short(void);
void sendUART0Short(uint16_t value);

#endif /* SRC_UART_H_ */
