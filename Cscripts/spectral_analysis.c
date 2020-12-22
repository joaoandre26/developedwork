/*  --------------------------------------------
    Author  : João André Cruz
    E-mail  : jacruz@ua.pt/jcruz26595@gmail.com
    Date    : 30/07/2020 (Last Version)
    -------------------------------------------- */
#ifndef SPECTRAL_ANALYSIS_C
#define SPECTRAL_ANALYSIS_C
#include <stdint.h>
#include <stdio.h>
#include "spectral_analysis.h"
/*
  Computing the square root of an integer or a fixed point integer into a 
  fixed point integer. A fixed point is a 32 bit value with the comma between
  the bits 15 and 16, where bit 0 is the less significant bit of the value. 
  
  The algorithms can be easily extended to 64bit integers, or different 
  fixed point comma positions. 
  The algorithm uses the property that computing x² is trivial compared to the
  sqrt. It will thus search the biggest x so that x² <= v, assuming we compute
  sqrt(v).  
    
  The algorithm tests each bit of x starting with the most significant toward
  the less significant. It tests if the bit must be set or not. 
  
  The algorithm uses the relation (x + a)² = x² + 2ax + a² to add the bit
  efficiently. Instead of computing x² it keeps track of (x + a)² - x².
  
  When computing sqrt(v), r = v - x², q = 2ax, b = a² and t = 2ax + a2. 
  Note that the input integers are signed and that the sign bit is used in 
  the computation. To accept unsigned integer as input, unfolding the initial
  loop is required to handle this particular case. See the usenet discussion
  for the proposed solution. 
  
 
  Algorithm and code Author Christophe Meessen 1993. 
  Initially published in usenet comp.lang.c, Thu, 28 Jan 1993 08:35:23 GMT, 
  Subject: Fixed point sqrt ; by Meessen Christophe
  
  https://groups.google.com/forum/?hl=fr%05aacf5997b615c37&fromgroups#!topic/comp.lang.c/IpwKbw0MAxw/discussion
  Note: there was a bug in the published sqrtL2L routine. It is corrected in
        this implementation.
  
*/
/*
 * int32_t sqrtI2I( int32_t v );
 *
 * Compute int32_t to int32_t square root
 * RETURNS the integer square root of v
 * REQUIRES v is positive
 */
 //Adapted by the author of the rest of the code for 32bit(Input)->16bit(output)
int16_t sqrtI2I( int32_t v )
{
    uint32_t t, q, b, r;
    r = v;           // r = v - x²
    b = 0x40000000;  // a²
    q = 0;           // 2ax
    while( b > 0 )
    {
        t = q + b;   // t = 2ax + a²
        q >>= 1;     // if a' = a/2, then q' = q/2
        if( r >= t ) // if (v - x²) >= 2ax + a²
        {
            r -= t;  // r' = (v - x²) - (2ax + a²)
            q += b;  // if x' = (x + a) then ax' = ax + a², thus q' = q' + b
        }
        b >>= 2;     // if a' = a/2, then b' = b / 4
    }
    return (int16_t)q;
}
void spectrumCalc(int16_t *re, int16_t *im, int size)
{
    uint16_t i;
    for(i=0;i<size;i++)
    {
        re[i] = sqrtI2I(re[i]*re[i] + im[i]*im[i]);
    }
}
uint16_t getID(int16_t *arr, int size)
{
    uint16_t id, tmp, i;
    tmp = 0;
    for(i=1;i<size;i++)
    {
        if(arr[i]>tmp)
        {
            tmp = arr[i];
            id = i;
        }
    }
    return id;
}
uint16_t dominantFreq(int16_t *re, int16_t *im, int size)
{
    uint16_t id;
    spectrumCalc(re, im, size);
    id = getID(re, size/2);
    return id;
}
uint16_t maxAmp(int16_t *re, int size)
{
    uint16_t id;
    id = getID(re, size/2);
    return re[id];
}
uint16_t nrPeaksAboveThreshold(int16_t *re, int size, uint16_t thrVal, uint16_t rng)
{
    uint16_t i, k, lID;
    lID = 0;        //Last id with amplitude above the threshold value
    k = 0;          // number of peaks above the threshold value
    for(i=1; i<size; i++)
    {
        if(re[i]>=thrVal)
        {
            if(lID <(i-rng))
            {
                k++;
                lID = i;
            }
            else if(re[i]>re[lID])
            {
                lID = i;
            }
        }
    }
    return k;
}
void saveIDs(uint16_t *idVector, int16_t *re, int size, uint16_t thrVal, uint16_t rng)
{
    uint16_t i, lID, k;
    lID = 0;        //Last id with amplitude above the threshold value
    k = 0;
    for(i=1; i<size; i++)
    {
        if(re[i]>=thrVal)
        {
            if(lID <(i-rng))
            {
                idVector[k]=i;
                k++;
                lID = i;
            }
            else if(re[i]>re[lID])
            {
                idVector[k-1]=i;
                lID = i;
            }
        }
    }
}
uint16_t meanEngPeak(int16_t *re, uint16_t id, uint16_t rng)
{
    uint16_t sumVal, i;
    uint16_t mVal;
    sumVal = 0;
    for(i=id-rng; i<=id+rng;i++)
    {
        sumVal += re[i];
    }
    mVal = ((uint16_t)((sumVal*10)/(2*rng+1)))/10;
    return mVal;
}
uint16_t AvgAmp(uint16_t *re, uint16_t size, uint16_t id, uint16_t thr)
{
    uint16_t i, imin, sumVal, avg;
    i=id;
    while(re[i]>thr)
    {
        i--;
    }
    i=i+1;
    imin=i;
    while(re[i]>thr)
    {
        sumVal += re[i];
        printf("Avg: %hu\t\n",re[i]);
        i++;
    }
    i=i-1;
    avg = (uint16_t)(sumVal/(imin-i));
    printf("Avg: %hu\t\n",avg);
    return avg; 
}
uint16_t relDomFreq(uint16_t *IDs, uint16_t nIDs, int16_t *re, uint16_t size, uint16_t threshold)
{
    uint16_t maxID, Eng, maxEng, i;
    maxEng = 0;
    maxID = 0;
    for(i = 0; i<nIDs; i++)
    {
        printf("pass");
        Eng = AvgAmp(re, size, IDs[i], threshold); 
        if(Eng>maxEng)
        {
            maxEng = Eng;
            maxID = IDs[i];
        }
    }
    return maxID;
}
uint16_t returnFreq(uint16_t ID, uint16_t samp, uint16_t size, uint16_t mult)
{
    return ((uint16_t)((samp*mult*ID)/size))/mult;    
}
uint16_t thresholdValue(int16_t *re, int size, uint16_t thrFactMult,uint16_t thrFactDiv, uint16_t mult)
{
    uint16_t maxVal, thrVal, nrPeaks;
    uint16_t maxID;
    maxVal = maxAmp(re, size/2);
    thrVal = ((uint16_t)((maxVal*mult*thrFactMult)/thrFactDiv))/mult;
    
    nrPeaks = nrPeaksAboveThreshold(re, size/2, thrVal, 3);     //finds hos many peaks are above thethreshold value
    uint16_t IDs[nrPeaks];                                      //creates an array to save the ids
    saveIDs(IDs, re, size/2, thrVal, 3);
    maxID = relDomFreq(IDs, nrPeaks, re, size, thrVal);  
    return maxID;
}

/* Steps to find the first peak of all 
 * 1 - determine the average amplitude of the spectrum to use as reference
 * 2 - Find the first value above the average and return the ID 
 */

uint16_t averageAmpSpectrum(uint16_t *re, uint16_t size)
{
    uint16_t sum = 0;
    uint16_t avgVal = 0;
    uint16_t i;
    for(i=0;i<size;i++)
    {
        sum += re[i];
    }
    avgVal = (uint16_t)(sum/size);
    //printf("Sum: %hu \t Avg: %hu\t\n", sum, avgVal);
    return avgVal;
}
uint16_t firstPeak(uint16_t *re, uint16_t size)
{
    uint16_t avgVal, i;
    avgVal = averageAmpSpectrum(re,size);
    for(i=1; i<size;i++)
    {
        if(re[i]>avgVal)
        {
            break;
        }
    }
    return i;
}
#endif