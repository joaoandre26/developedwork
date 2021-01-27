clear all
close all
clc
%% 
% Receiving uC data

path = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests20_01_2021\';
figure(1)
BUFF_SIZE = 1024;
s=serialport("COM4", 115200);
i=0;
arr = [];
rawData = [];
n=0;
tstart = tic;
while(n<10)
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
    circPath = ['Piezzo\';'PiezC1\';'PiezOp\';'AcC14k\';'AcC24k\';'Accele\'];
    MeasPath = ['BotMid\';'TopMid\'];
    bottlePath = ['Full\';'Half\';'Empt\'];
    folderPath = strcat(circPath(4,:), MeasPath(1,:),bottlePath(1,:));
    savePath = strcat(path, folderPath);

    list = dir(savePath);
    dirL = size(list);
    dirL = dirL - 2;
    csvwrite(strcat(savePath,'test', num2str(dirL(1,1)),'.txt'),arr);
    disp([num2str(dirL(1,1)+1) ' Results from path ' folderPath]);
    disp(num2str(n));
    n=n+1;
    i=0;
%     plot(arr);
    arr = [];
    rawData = [];
end
tend = toc(tstart)