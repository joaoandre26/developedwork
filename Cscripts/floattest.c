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

#include "float_fft.h"
#include "spectral_analysisf.h"

#define BUFF_SIZE 512
#define LOG_2_BUFF 9
#define MULT_FACT 10
#define SAMP_FREQ 44100

void readData(double *data, int size, const char *path);
void writeResults(double domF, double excT, const char *path);
void printDouble(double *data, double *data1, int size);

void main(int argc, char *argv[])
{
    double domF;
    double reData[BUFF_SIZE];
    double imData[BUFF_SIZE] = {0};
    struct timeval start, stop;
    double exc;
    // Path of the file with signal to be read
    //char dataPath[200] = "/mnt/c/Users/JoaoAndre/Documents/masterthesis/signalsAndData/Signals/Synthetized/signal";
    char dataPath[200] = "/mnt/c/Users/JoaoAndre/Documents/masterthesis/MatlabScripts/GlassWaterBottleRealTests/Signals/Converted/signal";
    strcat(dataPath, argv[1]);
    strcat(dataPath, ".txt");
    //Path of the file to save information
    //const char resPath[200] = "/mnt/c/Users/JoaoAndre/Documents/masterthesis/signalsAndData/Info/FloatPointImpPCRes.txt";
    const char resPath[200] = "/mnt/c/Users/JoaoAndre/Documents/masterthesis/MatlabScripts/GlassWaterBottleRealTests/Results/PCFLRealResults.txt";
    readData(reData, BUFF_SIZE, dataPath);
    gettimeofday(&start, NULL);
    float_fft(reData,imData,LOG_2_BUFF,BUFF_SIZE);
    //printDouble(reData, imData, BUFF_SIZE);
    domF = dominantFreq(reData, imData, BUFF_SIZE, SAMP_FREQ, MULT_FACT);
    gettimeofday(&stop, NULL);
    exc = (stop.tv_sec-start.tv_sec) + (stop.tv_usec-start.tv_usec); 
    writeResults(domF, exc, resPath);
    //printf("F: %lf \n", domF);
    //printf("exc: %lf uS\n", id);
}
void readData(double *data, int size, const char *path)
{
    char tmp[20];
    int i = 0;
    int brk = 0;
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
            //printf("id: %d \t val: %lf \n", i, data[i]);
            i++;
        }
        fclose(fp);
    }
}
void printDouble(double *data, double *data1, int size)
{
    int i;
    for(i=0; i<size; i++)
    {
        printf("ID: %d \t re: %lf \t im: %lf \n", i, data[i], data1[i]);
    }
}
void writeResults(double domF, double excT, const char *path)
{
    FILE *fp;
    fp = fopen(path, "a");

    if(fp==NULL)
    {
        printf("Error creating/openning the file!\n");
    }
    
    fprintf(fp, "%lf, %lf\n", domF, excT);
    fclose(fp);
}