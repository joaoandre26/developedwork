/*  --------------------------------------------
    Author  : João André Cruz
    E-mail  : jacruz@ua.pt/jcruz26595@gmail.com
    Date    : 30/07/2020 (Last Version)
    -------------------------------------------- */
#ifndef _SPECTRAL_ANALYSISF_H
#define _SPECTRAL_ANALYSISF_H 

#include <stdint.h>
#include <math.h>
#include <stdio.h>
void spectrumCalc(double *re, double *im, int size);
int getID(double *arr, int size);
double dominantFreq(double *re, double *im, int size, int samp, int mult);

#endif