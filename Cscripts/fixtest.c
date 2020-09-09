/*  --------------------------------------------
    Author  : João André Cruz
    E-mail  : jacruz@ua.pt/jcruz26595@gmail.com
    Date    : 30/07/2020 (Last Version)
    -------------------------------------------- */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>

#include "fix_fft.h"
#include "spectral_analysis.h"

#define BUFF_SIZE 512
#define LOG_2_BUFF 9
#define MULT_FACT 10
#define SAMP_FREQ 4000

void readData(int16_t *data, int size, const char *path);
void writeResults(uint16_t domF, uint16_t excT, const char *path);
void printDouble(int16_t *data, int16_t *data1, int size);

void main(int argc, char *argv[])
{
    uint16_t domF;
    int16_t reData[BUFF_SIZE];
    int16_t imData[BUFF_SIZE] = {0};
    struct timeval start, stop;
    long exc;
    //printf("%s\n",argv[1]);
    // Path of the file with signal to be read
    char dataPath[200] = "/mnt/c/Users/JoaoAndre/Documents/masterthesis/signalsAndData/Signals/Synthetized/signal";
    strcat(dataPath, argv[1]);
    strcat(dataPath, ".txt");
    //Path of the file to save information
    const char resPath[200] = "/mnt/c/Users/JoaoAndre/Documents/masterthesis/signalsAndData/Info/FixPointImpPCRes.txt";
    
    readData(reData, BUFF_SIZE, dataPath);
    gettimeofday(&start, NULL);
    fix_fft(reData,imData,LOG_2_BUFF);
    //printDouble(reData, imData, BUFF_SIZE);
    domF = dominantFreq(reData, imData, BUFF_SIZE, SAMP_FREQ, MULT_FACT);
    gettimeofday(&stop, NULL);
    exc = (stop.tv_sec-start.tv_sec) + (stop.tv_usec-start.tv_usec); 
    //writeResults(domF, (uint16_t)exc, resPath);
    printf("F: %hu \n", domF);
    printf("exc: %li uS\n", exc);
}
void readData(int16_t *data, int size, const char *path)
{
    char tmp[20];
    uint16_t i = 0;
    uint8_t brk = 0;
    FILE *fp;
    fp = fopen(path,"r");
    if(fp == NULL)
    { 
        printf("Couldn't open the file");
        brk=1;
    }
    if(!brk)
    {
        while(!feof(fp))
        {
            fscanf(fp, "%s", tmp);
            data[i] = atoi(tmp);
            i++;
        }
        fclose(fp);
    }
}
void printDouble(int16_t *data, int16_t *data1, int size)
{
    uint16_t i;
    for(i=0; i<size; i++)
    {
        printf("ID: %hu \t re: %hu \t im: %hu \n", i, data[i], data1[i]);
    }
}
void writeResults(uint16_t domF, uint16_t excT, const char *path)
{
    FILE *fp;
    fp = fopen(path, "a");

    if(fp==NULL)
    {
        printf("Error creating/openning the file!\n");
    }
    
    fprintf(fp, "%d, %d\n", domF, excT);
    fclose(fp);
}