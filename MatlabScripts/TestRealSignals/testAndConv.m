clear all
close all
clc
%%
%Loads the signals and later finds when the knock starts and saves in order
%to perform the fft in the PC and uC versions
%%
%Signal path
path = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\TestRealSignals\realsignals";
path2 = "C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Signals\Measured\test.txt"
%Files in path
% list = dir(path);
% L=size(list);
% L=L(1,1);
% loads the file names to a array of strings
% names=strings(1,L-2);   %-2 is because of the path . and .. in the folder
% for i=3:L
%     names(1, i-2) = list(i).name;
% end
% signal is load to y1 variable
% load(strcat(path,"\",names(1,5)), "y1");
%%
fs = 4000;    %sampling frequency
y1 = csvread(path2);
fID = min(find(abs(y1(:,1))>0.005));

%taking a 1024 sample - It should work with only 512 samples as well
X=y1(fID:fID+511,1);
L=length(X);

Y=fft(X);

P1 = abs(Y/L);
P2 = P1(2:L/2+1);
P2(2:end-1) = 2*P2(2:end-1);


f=fs*(0:(L/2)-1)/L;

id = find(max(P2(:,1))==P2(:,1));

domF = f(1,id);

disp(['Dominant Frequency: ' num2str(domF) 'Hz']);

%% Converting the signal to a 0-1023 value
minX = abs(min(X));
maxX = abs(max(X));

if(minX>maxX)
    aX = floor(((X/minX)+1)*0.5*1023);
else
    aX = floor(((X/maxX)+1)*0.5*1023);
end

%Saving the signal
savePath = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Signals\Synthetized\signal';
csvwrite(strcat(savePath,".txt"), aX);   %Check the final path and if
% the matrix with the signal needs to be transposed

