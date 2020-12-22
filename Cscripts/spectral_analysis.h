/*  --------------------------------------------
    Author  : João André Cruz
    E-mail  : jacruz@ua.pt/jcruz26595@gmail.com
    Date    : 30/07/2020 (Last Version)
    -------------------------------------------- */
#ifndef _SPECTRAL_ANALYSIS_H
#define _SPECTRAL_ANALYSIS_H 

#include <stdint.h>
#include <stdio.h>

int16_t sqrtI2I( int32_t x );
void spectrumCalc(int16_t *re, int16_t *im, int size);
uint16_t getID(int16_t *arr, int size);
uint16_t dominantFreq(int16_t *re, int16_t *im, int size);

uint16_t maxAmp(int16_t *re, int size);
uint16_t nrPeaksAboveThreshold(int16_t *re, int size, uint16_t thrVal, uint16_t rng);
void saveIDs(uint16_t *idVector, int16_t *re, int size, uint16_t thrVal, uint16_t rng);
uint16_t meanEngPeak(int16_t *re, uint16_t id, uint16_t rng);
uint16_t AvgAmp(uint16_t *re, uint16_t size, uint16_t id, uint16_t thr);
uint16_t relDomFreq(uint16_t *IDs, uint16_t nIDs, int16_t *re, uint16_t size, uint16_t threshold);
uint16_t returnFreq(uint16_t ID, uint16_t samp, uint16_t size, uint16_t mult);
uint16_t thresholdValue(int16_t *re, int size, uint16_t thrFactMult,uint16_t thrFactDiv, uint16_t mult);

//-------------------
uint16_t averageAmpSpectrum(uint16_t *re, uint16_t size);
uint16_t firstPeak(uint16_t *re, uint16_t size);
#endif