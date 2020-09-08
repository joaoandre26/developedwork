clear all
close all 
clc
%% Frequency analysis of real signals

Fs = 4000;

reSignalPath = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Signals\Measured\G3Z1a_3.txt';
path2 = 'C:\Users\JoaoAndre\Downloads\RepsolGasKnock81.mat';
load(path2, 'y1');

signal = csvread(reSignalPath);

Ls = length(signal);
n=2^nextpow2(Ls);
f = Fs*(0:n/2)/n;
nBits=24;

WINDOW = 512;
NOVERLAP=WINDOW/2;
NFFT=2^8;
maxs=max(signal);
mins = abs(min(signal));
if mins > maxs 
    maxs=mins
end

y=signal/maxs;

% [pxx, F] = pwelch(y, hann(WINDOW), NOVERLAP, NFFT, Fs);
% figure(1)
% subplot(2,1,1)
% spectrogram(y,WINDOW,NOVERLAP,NFFT,Fs,'yaxis')
% subplot(2,1,2)
% plot(F, pxx);
Y = fft(y, n);
P = abs(Y/n);
Sf = P(1:n/2+1)/max(P(1:n/2+1));

subplot(2,1,1)
plot(y);
subplot(2,1,2)
plot(f, Sf);

