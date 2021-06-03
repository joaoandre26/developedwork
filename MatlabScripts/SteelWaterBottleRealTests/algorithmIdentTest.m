clear all
close all
clc
%%
signalPath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests18_05_2021MIC_1\';
% StimPath = ['AcCiMa\';'AcImMa\'];
StimPath = ['Ma\'];
MeasPath = ['BotMid\';'TopMid\']; 
BottlePath = ['Full\';'Half\';'Empt\'];

svPath = 'E:\ResultsThesis\NResults18_05_2021MIC\MatLabDataResults\SingleSignals\';

pathData = strcat(StimPath(1,:),MeasPath(2,:),BottlePath(1,:));

CLK = 1000000;
SampFac = 250;
Fs = CLK/SampFac;

lID = 65;
uID = 200;

list = dir(strcat(signalPath,pathData));
dirL = size(list);
dirL = dirL(1,1) - 2;
i=0;
dataRes = zeros(dirL,3);
while i<dirL
    data = csvread(strcat(signalPath,pathData,'test',num2str(i),'.txt'));
    [f,Sf] = freqAnalizer(data(1:512),Fs);
    L = length(Sf);
    %Mean of the spectrum
    mAmp = 3*mean(Sf(2:end));
    %identifies the first peak
    fID = firstPeak(Sf, mAmp, lID, uID);
    %identifies the dominant peak
    domID = dominantID(Sf, lID, L);
    %identifies the mean dominant peak
    mID = dominantMeanID(Sf, mAmp, lID, L);
    dataRes((i+1),1) = fID;
    dataRes((i+1),2) = domID;
    dataRes((i+1),3) = mID;
    i = i + 1;
end

readinfoPath = strcat(svPath,erase(pathData,'\'), '.txt');

if exist(readinfoPath)==2
    eData = csvread(readinfoPath);
    csvwrite(readinfoPath, [eData; dataRes]);
else
    csvwrite(readinfoPath, dataRes);
end