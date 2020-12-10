clear all
close all
clc
%% 
% Receiving uC data
path = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests02_12_2020\';

BUFF_SIZE = 1024;
s=serialport("COM4", 115200);
i=0;
arr = [];
rawData = [];
tic
while(i<BUFF_SIZE)
   disp(i);
   msb = read(s, 1, "uint8");
   lsb = read(s, 1, "uint8");
   rawData = [rawData; dec2bin(msb,8) dec2bin(lsb,8)];
   i=i+1;
end
toc
i=1;
while(i<=BUFF_SIZE)
    arr = [arr bin2dec(rawData(i,:))];
    i=i+1;
end
plot(arr);
circPath = 'MopekaSensor\';
bottlePath = 'Full\';
pointPath = 'Center.txt';
finalPath = strcat(path, circPath, bottlePath, pointPath);