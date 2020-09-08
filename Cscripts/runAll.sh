#!/bin/bash
echo "Hello world!"

#Variables for the Fixed point version
MFX="fixtest.c"
FFX="fix_fft.c"
SFX="spectral_analysis.c"
RFX="fixtest"
#Variables for the Fixed point version
MFL="floattest.c"
FFL="float_fft.c"
SFL="spectral_analysisf.c"
RFL="floattest"

#Compiling both files
#gcc $MFX $FFX $SFX -o $RFX

#gcc $MFL $FFL $SFL -o $RFL -lm

for i in {0..9}
do
#echo "Iteration $i"
#Running fixed foint version
    ./$RFX $i 
#running floating point version
    ./$RFL $i
done