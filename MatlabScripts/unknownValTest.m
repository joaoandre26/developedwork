close all 
clear all
clc
%%
Fs = 4000;
ntest = 100;
Offset = 0;
Amplitude = 0.5;
Phase = 0;
%
emDf = zeros(1, ntest);
eDfa = zeros(1, ntest);
fv = randi([-150 150], 1, 10);
%
Ts = 1/Fs;
% wk = 2*Pi*k/T -> De forma discreta wk = 2*Pi*k/N
N = (2*pi)/Ts;
size = nextpow2(N);
for i = 1:100
    fa = 1000 + randi([-150 150], 1, 1);
    [y, t] = signalGen(Offset, Amplitude, fa, fv, Phase, Fs, 0, 0);
    [In, Ina, Df, Dfa, f, Sf] = freqAnalizer(y, Fs);
    emDf(1,i) = abs(mean(Df)-fa)/fa;
    eDfa(1,i) = abs(Dfa-fa)/fa;
end
pmDf = mean(emDf)*100;
pDfa = mean(eDfa)*100;