clear all
close all
clc
%% 
% Receiving uC data

path = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests12_04_2021\';
figure(1)
BUFF_SIZE = 1024;
s=serialport("COM9", 115200);
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
    %uncomment to receive data from sensors in the bottles
%     circPath = ['PieBMa\';'PieBAu\';'PiezMa\';'PiezAu\';'AcImMa\';'AcImAu\';'AcCiMa\';'AcCiAu\';'AcEsMa\';'AcEsAu\'];
%     circPath = ['AcImMa\';'AcImAu\';'AcCiMa\';'AcCiAu\';'AcEsMa\';'AcEsAu\'];
%     MeasPath = ['BotMid\';'TopMid\'];
%     bottlePath = ['Full\';'Half\';'Empt\'];    
%     folderPath = strcat(circPath(6,:), MeasPath(1,:),bottlePath(3,:));
%     savePath = strcat(path, folderPath);
% 
%     list = dir(savePath);
%     dirL = size(list);
%     dirL = dirL - 2;
%     csvwrite(strcat(savePath,'test', num2str(dirL(1,1)),'.txt'),arr);
% 
%     disp([num2str(dirL(1,1)+1) ' Results from path ' folderPath]);
%     disp(num2str(n));

    % Characterization of the piezo sensor
    folderPath = 'Characterization\Small\';
%     folderPath = 'Characterization\Biggg\';
    savePath = strcat(path, folderPath);
%     csvwrite(strcat(savePath,'f',num2str((n+1)*100),'hz.txt'),arr);
    %Common stuff
%     arr = [];
    rawData = [];
    n=n+1;
    i=0;
%     plot(arr);

end
tend = toc(tstart)