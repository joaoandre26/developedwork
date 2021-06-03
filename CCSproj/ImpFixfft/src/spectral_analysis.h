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
uint16_t getID(int16_t *arr, uint16_t lID, int size);
//Identification of the first peak functions
uint16_t firstPeak(int16_t *data, uint16_t avgVal, uint16_t lowID, uint16_t upID);
//Identifying the average highest peak
uint16_t dominantMeanID(int16_t *data, uint16_t lID, int size, uint16_t thrVal, uint16_t rng);
uint16_t AvgAmp(int16_t *data, uint16_t id, uint16_t thr);
uint16_t averageAmpSpectrum(int16_t *data, uint16_t size);
#endif /* SPECTRAL_ANALYSIS_H_ */
