clear all
close all
clc
%%
%Signal path
path = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\TestRealSignals\realsignals";
%Files in path
list = dir(path);
L=size(list);
L=L(1,1);
%loads the file names to a array of strings
names=strings(1,L-2);   %-2 is because of the path . and .. in the folder
for i=3:L
    names(1, i-2) = list(i).name;
end
%signal is load to y1 variable
load(strcat(path,"\",names(1,6)), "y1");
%%
fs = 192000;    %sampling frequency

%normalizing signal
y=y1/max(y1);
% y=y1;

% Plot the recorded signal - Input 1/L
t=(0:length(y)-1)/fs;
figure(1)
plot(t,y);
title('Recorded Signal')
xlabel('Time (s)'); ylabel('Magnitude');
%addToolbarExplorationButtons(gcf) % Adds buttons to figure toolbar (MATLAB 2018b only)

%% Welch's Method
WINDOW=512;         % Divides the signal into segments of 512 samples
NOVERLAP=WINDOW/2;  % Number of overlapped samples (50%)
NFFT=2^8;          % Number of DFT points as integer

[pxx,F]=pwelch(y,hann(WINDOW),NOVERLAP,NFFT,fs);

%% Output
% Plot the spectrogram of the recorded signal
figure(2)
spectrogram(y,WINDOW,NOVERLAP,NFFT,fs,'yaxis')
%addToolbarExplorationButtons(gcf) % Adds buttons to figure toolbar (MATLAB 2018b only)


% Plot the frequency response with Welch's method
figure(3)
plot(F,10*log10(pxx))
%addToolbarExplorationButtons(gcf) % Adds buttons to figure toolbar (MATLAB 2018b only)
title('Frequency response')
xlabel('Frequency(Hz)'); ylabel('Magnitude(dB)');