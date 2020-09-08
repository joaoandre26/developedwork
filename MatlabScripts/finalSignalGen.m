% close all 
% clear all
% clc
%%
Fs = 4000;
ntest = 10;
Offset = 0;
Amplitude = 1;
Phase = 0;
reData = zeros(ntest, 4);
var = [0 0.01 0.05 0.1 0.5];
infoPath = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Info\syntheticDataInfo.txt';
signalPath = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Signals\Synthetized\signal';
fv = 1000 + randi([-150 150], 1, 10);
Ts = 1/Fs;
% wk = 2*Pi*k/T -> De forma discreta wk = 2*Pi*k/N
N = (2*pi)/Ts;
size = nextpow2(N);

for i=1:ntest
    fa = 1000 + randi([-150 150], 1, 1);
    tVar = var(1, randi(length(var), 1, 1));
    [y, t] = signalGen(Offset, Amplitude, fa, fv, Phase, Fs, tVar, 0);
    %%Converter para valores entre 0-1023 e guardar o vetor
    minY=abs(min(y));
    maxY=abs(max(y));
    if(minY>maxY)
        aY = floor(((y/minY)+1)*0.5*1023);
    else
        aY = floor(((y/maxY)+1)*0.5*1023);
    end
    csvwrite(strcat(signalPath,num2str(i-1),'.txt'),aY(1:512)');
    [In, Ina, Df, Dfa, f, Sf] = freqAnalizer(y, Fs);
    reData(i,1) = tVar;
    reData(i,2) = fa;
    reData(i,3) = mean(Df);
    reData(i,4) = Dfa;
end

if exist(infoPath)==2
    Data = csvread(infoPath);
    csvwrite(infoPath, [Data; reData]);
else
    csvwrite(infoPath, reData);
end