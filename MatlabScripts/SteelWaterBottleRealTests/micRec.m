close all
clear all
clc
%%
info = audiodevinfo;%All the input/output devices
info.input(2);      %Displays the information and the ID of the microphone
% basePath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests18_05_2021MIC\';
basePath = 'E:\Tests18_05_2021MIC\';
StimPath = ['Ma\'];
MeasPath = ['BotMid\';'TopMid\'];
BottlePath = ['Full\';'Half\';'Empt\'];

savePath = strcat(basePath,StimPath(1,:),MeasPath(2,:),BottlePath(3,:));
list = dir(savePath);
dirL = size(list);
dirL = dirL - 2;

fs=4000;
nBits=16;
nChannels=1;
ID=1;
n=2;

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

csvwrite(strcat(savePath,'test', num2str(dirL(1,1)),'.txt'),y);
disp(['Test nº' num2str(dirL(1,1))]);