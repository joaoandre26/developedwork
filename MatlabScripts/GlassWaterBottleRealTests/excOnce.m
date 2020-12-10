clear all
close all
clc
%%
% Adapt this script to the new implementation
% This script is out of date
%%
%Paths for folder changing and execution file
Cpscripts = 'C:\Users\JoaoAndre\Documents\masterthesis\Cscripts';
MatLabScripts = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\GlassWaterBottleRealTests";

bashcmd = 'bash';
UnixPath = '/mnt/c/Users/JoaoAndre/Documents/masterthesis/Cscripts/runOnce.sh';

%Paths for the results
%MatLab
infoPathMatl = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\GlassWaterBottleRealTests\Results\MatLabCalc.txt";
%PC
infoPathPCFX = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\GlassWaterBottleRealTests\Results\PCFXRealResults.txt";
infoPathPCFL = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\GlassWaterBottleRealTests\Results\PCFLRealResults.txt";
%uC
infoPathuC = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\GlassWaterBottleRealTests\Results\uCRealResults.txt";

%%
%Run script to create new signals
finalSignalGen              %Runs the scripts that generates the signals
%
disp('Signals generated!');
%Run bash script to test PC implementation
signalPath = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\GlassWaterBottleRealTests\Signals"; %Adapt in order not to define this path again
list = dir(signalPath);
dirL=size(list);                %return the files/folders/etc inside, in this case is ment to only have files
dirL=dirL(1,1)-2;               %Since there is also in this list . and .., that doesn't count as file.

cd(Cpscripts);               %change the directory, for the c program location
system([bashcmd UnixPath]); %run bash script
system(dirL);               %send the value of  the number of signals saved

cd(MatLabScripts);          %change again the directory to the MatLab scripts location
disp('PC implemetation is done!');
%runs the uC script
disp('Hit reset button in the uC');
disp('Program starts in: 3');
pause(1);
disp('2');
pause(1);
disp('1');
pause(1);
disp('Running...');
%
uartTest                    %Runs the script that communicates with the microcontroller
%
disp('All Done!');
% 
% disp('Results Verificarion');
% %MatLab
% MatData = csvread(infoPathMatl);
% disp(['Freq Res(MatLab):' num2str(MatData(end-9:end,2)')]);
% %PC
% PCFXData = csvread(infoPathPCFX);
% PCFLData = csvread(infoPathPCFL);
% disp(['Freq Res(FX):    ' num2str(PCFXData(end-9:end,1)')]);
% disp(['Freq Res(FL):    ' num2str(ceil(PCFLData(end-9:end,1)'))]);
% %uC
% uCData = csvread(infoPathuC);
% disp(['Freq Res(uC):    ' num2str(uCData(end-9:end,1)')]);
% disp(['Ticks Res(uC):   ' num2str(uCData(end-9:end,2)')]);
% 
% disp(['Amount of tests executed successfully: ' num2str(length(MatData(:,1)))]);
