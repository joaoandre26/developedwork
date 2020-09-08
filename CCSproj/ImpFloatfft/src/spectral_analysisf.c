/*  --------------------------------------------
    Author  : João André Cruz
    E-mail  : jacruz@ua.pt/jcruz26595@gmail.com
    Date    : 30/07/2020 (Last Version)
    -------------------------------------------- */
#ifndef SPECTRAL_ANALYSISF_C
#define SPECTRAL_ANALYSISF_C
#include <stdint.h>
#include <math.h>
#include <stdio.h>
#include "spectral_analysisF.h"

void spectrumCalc(double *re, double *im, int size)
{
    int i;
    for(i=0;i<size;i++)
    {
        re[i] = sqrt(re[i]*re[i] + im[i]*im[i]);
    }
}
int getID(double *arr, int size)
{
    int id, tmp, i;
    tmp = 0;
    for(i=1;i<size/2;i++)
    {
        if(arr[i]>tmp)
        {
            tmp = arr[i];
            id = i;
        }
    }
    return id;
}
double dominantFreq(double *re, double *im, int size, int samp, int mult)
{
    int id;
    double domF;
    spectrumCalc(re, im, size);
    id = getID(re, size);
    domF = ((double)((samp*mult*id)/size))/mult;
    return domF;
}
#endif

