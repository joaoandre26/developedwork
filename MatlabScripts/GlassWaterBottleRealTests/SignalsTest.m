clear all
close all
clc
%% Test converted signals
%folderPath = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\GlassWaterBottleRealTests\Signals\Converted";
folderPath = "C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\RealTestsGlassBottle\1stTest\Results"; %%This path is OutOf date
list = dir(folderPath);
dirL=size(list);
dirL=dirL(1,1)-2;
fs = 44100;
for i=0:dirL-1
    data = csvread(strcat(folderPath,"\signal",num2str(i),".txt"));
    Y = fft(data);
    L = length(data);
    P = abs(Y/L);
    P1 = P(2:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = fs*(0:(L/2))/L;
    id = find(max(P1(:,1))==P1(:,1));   %finds the ID of the value with the highest magnitude
    domF = f(1,id);                     % returns the correposndent dominant frequency

    disp(['Dominant frequency: ' num2str(domF) 'Hz']);
    i=i+1;
end