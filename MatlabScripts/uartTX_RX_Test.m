clear all
close all
clc
%%
signalPath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests28_04_2021\';
StimPath = ['AcCiMa\';'AcImMa\'];
MeasPath = ['BotMid\';'TopMid\']; 
BottlePath = ['Full\';'Half\';'Empt\'];
svPath = 'E:\ResultsThesis\NResults28_04_2021\uCDataResults\excTimeAlg\';
s=serialport("COM9", 115200);

pathData = strcat(StimPath(1,:),MeasPath(2,:),BottlePath(3,:));

tic
procData = [];
j = 10;
jend = j+1;
while j<jend
    i=0;
    Path = strcat(signalPath,pathData, 'test',num2str(j-1),'.txt');
    Data = csvread(Path);
    while i<512
%         for i=1:512
%             fprintf('%d',i);
%             pause(0.001)
%             if i<10
%                 fprintf(repmat('\b',1,1));
%             elseif i<100
%                 fprintf(repmat('\b',1,2));
%             else
%                 fprintf(repmat('\b',1,3));
%             end
%         end
        disp(num2str(i));
        DbinVal = dec2bin(Data(i+1),16); %Converts the value from j index into a 16bit value
        Dmsb=DbinVal(1:8);          %Splits the binary value, and saves the msByte into a specific variable
        Dlsb=DbinVal(9:16);         %Splits the binary value, and saves the lsByte into a specific variable 
        write(s,bin2dec(Dmsb),"uint8");      %Writes on the uart the 8 msb  
        write(s,bin2dec(Dlsb),"uint8");      %writes on the uart the 8 lsb

    %     msb = read(s,1,"uint8");
    %     lsb = read(s,1,"uint8");
    %     val = bin2dec(strcat(dec2bin(msb,8),dec2bin(lsb,8)));
    %     disp(val);
    %     res = [res val];
        i=i+1;
    end
    disp(num2str(j));
    disp('Waiting for domID');
    msb1 = read(s,1,"uint8");
    lsb1 = read(s,1,"uint8");
    bmsb1 = dec2bin(msb1,8);
    bmsb1(1,1) = '0';
    blsb1 = dec2bin(lsb1,8);
%     blsb1(1,1) = '0';
    domID = bin2dec(strcat(bmsb1,blsb1));

%     disp('Waiting for fID');
%     msb2 = read(s,1,"uint8");
%     lsb2 = read(s,1,"uint8");
%     bmsb2 = dec2bin(msb2,8);
%     bmsb2(1,1) = '0';
%     blsb2 = dec2bin(lsb2,8);
%     blsb2(1,1) = '0';
%     fID = bin2dec(strcat(bmsb2,blsb2));

%     disp('Waiting for mID');
%     msb3 = read(s,1,"uint8");
%     lsb3 = read(s,1,"uint8");
%     bmsb3 = dec2bin(msb3,8);
%     bmsb3(1,1) = '0';
%     blsb3 = dec2bin(lsb3,8);
% %     blsb3(1,1) = '0';
%     mID = bin2dec(strcat(bmsb3,blsb3));

    disp('Waiting for excT');
    msb = read(s,1,"uint8");
    lsb = read(s,1,"uint8");
    bmsb = dec2bin(msb,8);
    bmsb(1,1) = '0';
    excT = bin2dec(strcat(bmsb,dec2bin(lsb,8)));
    
%     disp(['domID: ' num2str(domID) ' fID: ' num2str(fID) ' mID: ' num2str(mID) ' excT: ' num2str(excT)]);
%     procData = [procData; domID fID mID excT];
procData = [procData; domID];
    toc
    j = j + 1;
    disp(num2str(j));
end
toc

% readinfoPath = strcat(svPath,erase(pathData,'\'), '.txt');
readinfoPath = strcat(svPath,'mIDexc.txt');
if exist(readinfoPath)==2
    eData = csvread(readinfoPath);
    csvwrite(readinfoPath, [eData; procData]);
else
    csvwrite(readinfoPath, procData);
end