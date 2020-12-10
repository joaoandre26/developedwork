close all
clear all
clc
%%
info = audiodevinfo;%All the input/output devices
info.input(3);      %Displays the information and the ID of the microphone
% Path for saving the files
basePath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests13_11_2020\';
% LPG bottle
fullPath = 'Full\';
halfPath = 'Half\';
emptyPath = 'Empty\';
% Point of measurment
bottomPath = 'Bottom\';
centerPath = 'Center\';
LiqLvlPath = '80Levl\';
topPath = 'BotMid\';       %% Do not use

% G: 1 - Full ; 2 - Half ; 3 - Empty;
% P: 1 - Bottom ; 2 - Center ; 3 - 80Levl ; 4 - Top;
G = 1;
P = 4;
if (G == 1)
    bottlePath = fullPath;
elseif(G == 2)
    bottlePath = halfPath;
elseif(G == 3)
    bottlePath = emptyPath;
else
    bottlePath = '';
end

if(P == 1)
    pointPath = bottomPath;
elseif(P == 2)
    pointPath = centerPath;
elseif(P == 3)
    pointPath = LiqLvlPath;
elseif(P == 4)
    pointPath = topPath;
else
    pointPath = '';
end

path = strcat(basePath, bottlePath, pointPath);

test = 'test';
list = dir(path);
dirL = size(list);
dirL = dirL(1,1)-2; 
format = '.txt';
path=strcat(path,test,num2str(dirL),format);

fs=4000;
nBits=16;
nChannels=1;
ID=2;
n=4;

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
csvwrite(path, y);
disp(['Test number: ' num2str(dirL+1)]);