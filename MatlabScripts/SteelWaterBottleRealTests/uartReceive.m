clear all
close all
clc
%% 
% Receiving uC data

path = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests27_04_2021\';
figure(1)
BUFF_SIZE = 1024;
s=serialport("COM4", 115200);
i=0;
arr = [];
rawData = [];
n=0;
tstart = tic;
while(n<1)
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
    plot(arr);
    % Characterization of the piezo sensor
%     folderPath = 'Free\Characterization4k\Small\';
    folderPath = 'Free\Characterization4k\Biggg\';
    savePath = strcat(path, folderPath);
    csvwrite(strcat(savePath,'f7000hz.txt'),arr);
    %Common stuff
%     arr = [];
    rawData = [];
    n=n+1;
    i=0;
end
tend = toc(tstart)