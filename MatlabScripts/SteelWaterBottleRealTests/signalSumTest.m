clear all
close all
clc
%%
signalPath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests18_05_2021MIC_1\';
% StimPath = ['AcCiMa\';'AcImMa\'];
StimPath = ['Ma\'];
MeasPath = ['BotMid\';'TopMid\']; 
BottlePath = ['Full\';'Half\';'Empt\'];

svPath = 'E:\ResultsThesis\NResults18_05_2021MIC\';

matPath = 'MatLabDataResults\';
uCPath = 'uCDataResults\';

pathData = strcat(StimPath(1,:),MeasPath(2,:),BottlePath(1,:));

list = dir(strcat(signalPath,pathData));
dirL = size(list);
dirL = dirL(1,1) - 2;

s=serialport("COM9", 115200);

% Sampling Sets
CLK = 1000000;
SampFac = 250;
Fs = CLK/SampFac;
% Variables Sets
x = zeros(1,512);
j=45;
if (j+5)<dirL
    jEnd = j+5;
else
    jEnd = dirL;
end
% Signals Sums
while j<jEnd
    disp(num2str(j))
    data = csvread(strcat(signalPath,pathData,'test',num2str(j),'.txt'));
%     [f Sf] = freqAnalizer(data(1:512),Fs);
%     x = x + Sf;
    x = x + data(1:512);
    j = j + 1;
end
x = round(x/5);
%% Processing in MatLab
dataRes = zeros(1,3);
lID = 65;
uID = 200;
[f,Sf] = freqAnalizer(x,Fs);
L = length(Sf);
%Mean of the spectrum
mAmp = 3*mean(Sf(2:end));
%identifies the first peak
fID = firstPeak(Sf, mAmp, lID, uID);
%identifies the dominant peak
domID = dominantID(Sf, lID, L);
%identifies the mean dominant peak
mID = dominantMeanID(Sf, mAmp, lID, L);
dataRes(1,1) = fID;
dataRes(1,2) = domID;
dataRes(1,3) = mID;

%% Processing in the microcontroller
procData = zeros(1,4);
i=0;
% Send the data via Uart
while i<512
    disp(num2str(i));
    DbinVal = dec2bin(x(i+1),16); %Converts the value from j index into a 16bit value
    Dmsb=DbinVal(1:8);          %Splits the binary value, and saves the msByte into a specific variable
    Dlsb=DbinVal(9:16);         %Splits the binary value, and saves the lsByte into a specific variable 
    write(s,bin2dec(Dmsb),"uint8");      %Writes on the uart the 8 msb  
    write(s,bin2dec(Dlsb),"uint8");      %writes on the uart the 8 lsb
    i=i+1;
end

% Waits for receiving the dominant frequency
disp('Waiting for domID');
msb1 = read(s,1,"uint8");
lsb1 = read(s,1,"uint8");
bmsb1 = dec2bin(msb1,8);
bmsb1(1,1) = '0';
blsb1 = dec2bin(lsb1,8);
if lsb1>=165
    blsb1(1,1) = '0';
end
domID = bin2dec(strcat(bmsb1,blsb1));

% Waits for receiving the first frequency
disp('Waiting for fID');
msb2 = read(s,1,"uint8");
lsb2 = read(s,1,"uint8");
bmsb2 = dec2bin(msb2,8);
bmsb2(1,1) = '0';
blsb2 = dec2bin(lsb2,8);
if lsb2>=165
    blsb2(1,1) = '0';
end
fID = bin2dec(strcat(bmsb2,blsb2));

% Waits for receiving the dominant mean frequency
disp('Waiting for mID');
msb3 = read(s,1,"uint8");
lsb3 = read(s,1,"uint8");
bmsb3 = dec2bin(msb3,8);
bmsb3(1,1) = '0';
blsb3 = dec2bin(lsb3,8);
if lsb3>=165
    blsb3(1,1) = '0';
end
mID = bin2dec(strcat(bmsb3,blsb3));

% Waits for receiving the execution time
disp('Waiting for excT');
msb = read(s,1,"uint8");
lsb = read(s,1,"uint8");
bmsb = dec2bin(msb,8);
bmsb(1,1) = '0';
excT = bin2dec(strcat(bmsb,dec2bin(lsb,8)));

% Save the variables received
procData(1,1) = domID;
procData(1,2) = fID;
procData(1,3) = mID;
procData(1,4) = excT;

%% Saving the data
% From Matlab
readinfoPath1 = strcat(svPath,matPath,'Sums\',erase(pathData,'\'), '.txt');

if exist(readinfoPath1)==2
    eData = csvread(readinfoPath1);
    csvwrite(readinfoPath1, [eData; dataRes]);
else
    csvwrite(readinfoPath1, dataRes);
end
% From uC
readinfoPath2 = strcat(svPath,uCPath,'Sums\',erase(pathData,'\'), '.txt');

if exist(readinfoPath2)==2
    eData = csvread(readinfoPath2);
    csvwrite(readinfoPath2, [eData; procData]);
else
    csvwrite(readinfoPath2, procData);
end

disp(['Next j: ' num2str(jEnd)]);