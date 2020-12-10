clear all
close all
clc
%% 
%Signal path
path = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\TestRealSignalstest.txt";
fs=44100;
y = csvread(path);
%% Welch's Method
WINDOW=512;         % Divides the signal into segments of 512 samples
NOVERLAP=WINDOW/2;  % Number of overlapped samples (50%)
NFFT=2^8;          % Number of DFT points as integer

[pxx,F]=pwelch(y,hann(WINDOW),NOVERLAP,NFFT,fs);
%% Output
% Plot the spectrogram of the recorded signal
figure(2)
[s,f,t] = spectrogram(y,WINDOW,NOVERLAP,NFFT,fs,'yaxis')
%addToolbarExplorationButtons(gcf) % Adds buttons to figure toolbar (MATLAB 2018b only)
figure(3)
plot(F,10*log10(pxx))
%addToolbarExplorationButtons(gcf) % Adds buttons to figure toolbar (MATLAB 2018b only)
title('Frequency response')
xlabel('Frequency(Hz)'); ylabel('Magnitude(dB)');