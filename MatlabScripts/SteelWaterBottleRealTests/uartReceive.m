clear all
close all
clc
%% 
% Receiving uC data
path = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests21_12_2020\';

BUFF_SIZE = 1024;
s=serialport("COM9", 115200);
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
    rawData(i,1) = '0';
    arr = [arr bin2dec(rawData(i,:))];
    i=i+1;
end
%plot(arr);
circPath = ['Accele\';'Piezzo\'];
MeasPath = ['BotMid\';'TopMid\'];
bottlePath = ['Full\';'Half\';'Empt\'];
savePath = strcat(path, circPath(1,:), MeasPath(2,:),bottlePath(3,:));

list = dir(savePath);
dirL = size(list);
dirL = dirL - 2;

%csvwrite(strcat(savePath,'test', num2str(dirL(1,1)),'.txt'),arr);
disp([num2str(dirL(1,1)+1) ' Results from path ' circPath(1,:) MeasPath(1,:) bottlePath(1,:)]);