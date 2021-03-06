/*  --------------------------------------------
    Author  : Jo�o Andr� Cruz
    E-mail  : jacruz@ua.pt/jcruz26595@gmail.com
    Date    : 30/07/2020 (Last Version)
    -------------------------------------------- */
#include <stdint.h>
#include "spectral_analysis.h"
/*
  Computing the square root of an integer or a fixed point integer into a
  fixed point integer. A fixed point is a 32 bit value with the comma between
  the bits 15 and 16, where bit 0 is the less significant bit of the value.

  The algorithms can be easily extended to 64bit integers, or different
  fixed point comma positions.
  The algorithm uses the property that computing x� is trivial compared to the
  sqrt. It will thus search the biggest x so that x� <= v, assuming we compute
  sqrt(v).

  The algorithm tests each bit of x starting with the most significant toward
  the less significant. It tests if the bit must be set or not.

  The algorithm uses the relation (x + a)� = x� + 2ax + a� to add the bit
  efficiently. Instead of computing x� it keeps track of (x + a)� - x�.

  When computing sqrt(v), r = v - x�, q = 2ax, b = a� and t = 2ax + a2.
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
    r = v;           // r = v - x�
    b = 0x40000000;  // a�
    q = 0;           // 2ax
    while( b > 0 )
    {
        t = q + b;   // t = 2ax + a�
        q >>= 1;     // if a' = a/2, then q' = q/2
        if( r >= t ) // if (v - x�) >= 2ax + a�
        {
            r -= t;  // r' = (v - x�) - (2ax + a�)
            q += b;  // if x' = (x + a) then ax' = ax + a�, thus q' = q' + b
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
uint16_t getID(int16_t *arr, uint16_t lID, int size)
{
    uint16_t id, tmp, i;
    tmp = 0;
    for(i=lID;i<size;i++)
    {
        if(arr[i]>tmp)
        {
            tmp = arr[i];
            id = i;
        }
    }
    return id;
}
// Identifying the first ID Functions
uint16_t firstPeak(int16_t *data, uint16_t avgVal, uint16_t lowID, uint16_t upID)
{
    uint16_t i, fi;
    for(i=lowID; i<upID;i++)
    {
        if(data[i]>(avgVal))
        {
            fi = i;
            i = upID;
        }
    }
    return fi;
}
//Identifying the average highest peak
uint16_t dominantMeanID(int16_t *data, uint16_t lID, int size, uint16_t thrVal, uint16_t rng)
{
    uint16_t i, lsID;
    uint16_t maxEn, En, thrValH, mID;
    thrValH = thrVal/2;
    maxEn = 0;
    mID = 1;
    En = 0;
    lsID = 0;        //Last id with amplitude above the threshold value
    for(i=lID; i<size/2; i++)
    {
        if(data[i]>=thrVal)
        {
            if(lsID <(i-rng))
            {
                //k++;
                lsID = i;
                En = AvgAmp(data, lsID, thrValH);
                if(En>maxEn)
                {
                    maxEn = En;
                    mID = lsID;
                }
            }
            else if(data[i]>data[lsID])
            {
                lsID = i;
            }
        }
    }
    return mID;
}
uint16_t AvgAmp(int16_t *data, uint16_t id, uint16_t thr)
{
    uint16_t i, imin, sumVal, avg;
    sumVal = 0;
    avg = 0;
    i=id;
    while(data[i]>=thr)
    {
        i--;
    }
    i=i+1;
    imin=i;
    while(data[i]>=thr)
    {
        sumVal += data[i];
        i++;
    }
    avg = (uint16_t)(sumVal/(i-imin));
    return avg;
}
// defines
uint16_t averageAmpSpectrum(int16_t *data, uint16_t size)
{
    uint16_t sum = 0;
    uint16_t avgVal = 0;
    uint16_t i, mult;
    mult = 10;
    for(i=0;i<size;i++)
    {
        sum += data[i];
    }
    avgVal = 4*(((uint16_t)((sum*mult)/size))/mult);
    return avgVal;
}
