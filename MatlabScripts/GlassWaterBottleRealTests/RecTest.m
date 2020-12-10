close all
clear all
clc
%%
info = audiodevinfo;%All the input/output devices
info.input(3);      %Displays the information and the ID of the microphone
path = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Signals\Measured\'; %%This path is OutOf date
test = 'test';
format = '.txt';
path=strcat(path,test,format);
fs=44100;
nBits=16;
nChannels=1;
ID=2;
n=5;

recObj=audiorecorder(fs,nBits,nChannels,ID);
disp('Starting...');
disp('3');
pause(1);
disp('2');
pause(1);
disp('1');
pause(1);
disp('0');

recordblocking(recObj,n);
disp('Stoping...');
disp(['Recorded time: ' num2str(n) 'S']);

y=getaudiodata(recObj);
L =length(y);
t=(0:L-1)/fs;
figure(1)
plot(t,y);
title('Recorded Signal')
xlabel('Time (s)'); ylabel('Magnitude');

%% Using fft
Y = fft(y);
P = abs(Y/L);
P1 = P(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;
figure(2)
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

id = find(max(P1(:,1))==P1(:,1));   %finds the ID of the value with the highest magnitude
domF = f(1,id);                     % returns the correposndent dominant frequency

disp(['Dominant frequency: ' num2str(domF) 'Hz']);