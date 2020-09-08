close all
clear all
clc
%%
info = audiodevinfo;%All the input/output devices
info.input(3);      %Displays the information and the ID of the microphone
path = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Signals\Measured\';
test = 'G3Z3c_3';
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
plot(y)
% csvwrite(path, y);