/*  --------------------------------------------
    Author  : João André Cruz
    E-mail  : jacruz@ua.pt/jcruz26595@gmail.com
    Date    : 30/07/2020 (Last Version)
    -------------------------------------------- */
#ifndef SRC_SPECTRAL_ANALYSISF_H_
#define SRC_SPECTRAL_ANALYSISF_H_

#include <stdint.h>
#include <math.h>
#include <stdio.h>
void spectrumCalc(double *re, double *im, int size);
int getID(double *arr, int size);
double dominantFreq(double *re, double *im, int size, int samp, int mult);

#endif /* SRC_SPECTRAL_ANALYSISF_H_ */
