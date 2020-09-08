clear all
close all
clc
%%
%Paths for folder changing and execution file
Cpscripts = 'C:\Users\JoaoAndre\Documents\masterthesis\Cscripts';
MatLabScripts = 'C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts';

bashcmd = 'bash';
UnixPath = '/mnt/c/Users/JoaoAndre/Documents/masterthesis/Cscripts/runAll.sh';

%Paths for the results
%MatLab
infoPathMatl = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Info\syntheticDataInfo.txt';
%PC
infoPathPCFX = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Info\FixPointImpPCRes.txt';
infoPathPCFL = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Info\FloatPointImpPCRes.txt';
%uC
infoPathuC = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Info\FixeduCImp.txt';

%%
%Run script to create new signals
finalSignalGen              %Runs the scripts that generates the signals
%
disp('Signals generated!');
%Run bash script to test PC implementation
cd(Cpscripts);               %change the directory, for the c program location
system([bashcmd UnixPath]); %run bash script
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

disp('Results Verificarion');
%MatLab
MatData = csvread(infoPathMatl);
disp(['Freq Res(MatLab):' num2str(MatData(end-9:end,2)')]);
%PC
PCFXData = csvread(infoPathPCFX);
PCFLData = csvread(infoPathPCFL);
disp(['Freq Res(FX):    ' num2str(PCFXData(end-9:end,1)')]);
disp(['Freq Res(FL):    ' num2str(ceil(PCFLData(end-9:end,1)'))]);
%uC
uCData = csvread(infoPathuC);
disp(['Freq Res(uC):    ' num2str(uCData(end-9:end,1)')]);
disp(['Ticks Res(uC):   ' num2str(uCData(end-9:end,2)')]);

disp(['Amount of tests executed successfully: ' num2str(length(MatData(:,1)))]);


% i=0;
% while i<100
%     disp(['Iteration ' num2str(i)]);    
%     i=i+1;
% end