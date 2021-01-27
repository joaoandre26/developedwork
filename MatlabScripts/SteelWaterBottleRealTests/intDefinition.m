clear all
close all
clc
%%
% Opens files and finds out the maximum and minimum of all captured signas
% without hitting to define a threshold
path = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests15_01_2021\';
c1path = strcat(path, 'AcC1Op\','TopMid\','Empt\');
c2path = strcat(path, 'AcC1Op\','BotMid\','Empt\');

% Finds the oscilation interval of C1
list  = dir(c1path);
dirL = size(list);
dirL = dirL-2;

i=0;
maxValC1 = 0;
minValC1 = 1023;
while i<dirL(1,1)
    y = csvread(strcat(c1path, 'test', num2str(i), '.txt'));
    tMin = min(y);
    tMax = max(y);
    if(tMin<minValC1)
        minValC1 = tMin;
    end
    
    if(tMax>maxValC1)
        maxValC1 = tMax;
    end
    i=i+1;
end

list  = dir(c2path);
dirL = size(list);
dirL = dirL-2;

% Finds the oscilation interval of C2
i=0;
maxValC2 = 0;
minValC2 = 1023;
while i<dirL(1,1)
    y = csvread(strcat(c2path, 'test', num2str(i), '.txt'));
    tMin = min(y);
    tMax = max(y);
    if(tMin<minValC2)
        minValC2 = tMin;
    end
    
    if(tMax>maxValC2)
        maxValC2 = tMax;
    end
    i=i+1;
end

% display the values
disp('Oscilation intervals of the circuits are:');
disp(['C1 = [' num2str(minValC1) ';' num2str(maxValC1) ']']);
disp(['C2 = [' num2str(minValC2) ';' num2str(maxValC2) ']']);