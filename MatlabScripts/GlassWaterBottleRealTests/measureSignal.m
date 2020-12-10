clear all
close all
clc
%% Scripts Information
% This script will perform 3 distint functions, which are:
% 1. Read the knock from the microphone - This will use a smartphone as a
% microphone and will record the signal captured;
% 2. Perform fft with MatLab and save the value - we will be abe to 
% determine the dominant frequency, which will correspond to the to a 
% certain level of water inside the bottle and store this value in a file.
% 3. Convert the captured signal - this will convert certain part of the 
% signal to values between 0-1023, as if was captured in a ADC in a uC, and
% will save the signal.

%% 1. 
info = audiodevinfo;%All the input/output devices
info.input(3);      %Displays the information and the ID of the microphone

fs=44100;        % sampling frequency
nBits=16;       % 
nChannels=1;    % Only reads from one channel, mono
ID=2;           % Id of the input microphone
n=5;            % Number of seconds recorded

recObj=audiorecorder(fs,nBits,nChannels,ID);
disp('Starting...');
disp('3');
pause(1);
disp('2');
pause(1);
disp('1');
pause(1);
disp('0');

recordblocking(recObj,n);
disp('Stoping...');
disp(['Recorded time: ' num2str(n) 'S']);

y=getaudiodata(recObj);
% Normalize the signal
% ymax = abs(max(y));
% ymin = abs(min(y));
% if ymax < ymin
%     y = y/ymin;
% else
%     y = y/ymax;
% end
%% 2. 
L = length(y);
Y = fft(y);
P = abs(Y/L);
P1 = P(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;

id = find(max(P1(:,1))==P1(:,1));   %finds the ID of the value with the highest magnitude
domF = f(1,id);                     % returns the correposndent dominant frequency
disp(['Dominant frequency: ' num2str(domF) 'Hz']);
% Save the value in a .txt file
infoPath = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\GlassWaterBottleRealTests\Results\MatLabCalc.txt"; %%This path is OutOf date
if exist(infoPath)==2           % Check if the file exists
    Data = csvread(infoPath);
    csvwrite(infoPath, [Data; domF]);
else
    csvwrite(infoPath, domF);
end
%% 3. 
signalPath = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\GlassWaterBottleRealTests\Signals\Converted"; %%This path is OutOf date
RawsignalPath = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\GlassWaterBottleRealTests\Signals\Raw"; %%This path is OutOf date

list = dir(signalPath);
dirL=size(list);                %return the files/folders/etc inside, in this case is ment to only have files
dirL=dirL(1,1)-2;               %Since there is also in this list . and .., that doesn't count as file.
finalPath = strcat(signalPath,"\signal", num2str(dirL), ".txt");
rawPath = strcat(RawsignalPath,"\rawSignal", num2str(dirL), ".txt");

% Convert the signal in the following lines 
fID = min(find(abs(y(:,1))>0.005));     %finds where the knock starts
X=y(fID:fID+1023,1);                     %Cut a sample of size 512 for conversion

minX = abs(min(X));
maxX = abs(max(X));

% Conversion
if(minX>maxX)
    aX = floor(((X/minX)+1)*0.5*1023);
else
    aX = floor(((X/maxX)+1)*0.5*1023);
end

csvwrite(finalPath, aX);                %Saving into a file
csvwrite(rawPath, y);