/*  --------------------------------------------
    Author  : João André Cruz
    E-mail  : jacruz@ua.pt/jcruz26595@gmail.com
    Date    : 30/07/2020 (Last Version)
    -------------------------------------------- */
#ifndef SPECTRAL_ANALYSIS_H_
#define SPECTRAL_ANALYSIS_H_

#include <stdint.h>

int16_t sqrtI2I( int32_t x );
void spectrumCalc(int16_t *re, int16_t *im, int size);
uint16_t getID(int16_t *arr, int size);
uint16_t dominantFreq(int16_t *re, int16_t *im, int size, int samp, int mult);

#endif /* SPECTRAL_ANALYSIS_H_ */
