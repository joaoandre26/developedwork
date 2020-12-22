clear all
close all
clc
%%
FullPath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests02_11_2020\Results\Full\';
HalfPath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests02_11_2020\Results\Half\';
EmptyPath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests02_11_2020\Results\Empty\';

Fs = 4000;

for i=0:29
    x = csvread(strcat(EmptyPath, 'test', num2str(i), '.txt'));
    
    % Convert the signal in the following lines 
    fID = min(find(abs(x(:,1))>0.005));     %finds where the knock starts
    fID = fID;
    X=x(fID:fID+511,1);                     %Cut a sample of size 512 for conversion

    minX = abs(min(X));
    maxX = abs(max(X));

    % Conversion
    if(minX>maxX)
        y = floor(((X/minX)+1)*0.5*1023);
    else
        y = floor(((X/maxX)+1)*0.5*1023);
    end
    L = length(y);
    %% Using fft
    Y = fft(y);
    P = abs(Y/L);
    P1 = P(2:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = Fs*(0:(L/2))/L;
    id = find(max(P1(:,1))==P1(:,1));   %finds the ID of the value with the highest magnitude
    domF = f(1,id);                     % returns the correposndent dominant frequency
    disp(['Dominant frequency: ' num2str(domF) 'Hz']);
end
% savePath = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Signals\Synthetized\signal';
csvwrite("signal.txt", y);