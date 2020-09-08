clear all
close all
clc
%% Paths for the results
%To execute the same tests with different data, just change the paths of
%the date you want to test

%MatLab
infoPathMatl = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Info\syntheticDataInfo.txt';
%PC
infoPathPCFX = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Info\FixPointImpPCRes.txt';
infoPathPCFL = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Info\FloatPointImpPCRes.txt';
%uC
infoPathuC = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Info\FixeduCImp.txt';
%% Open Data files
%MatLab
MatData = csvread(infoPathMatl);
%PC
PCFXData = csvread(infoPathPCFX);
PCFLData = csvread(infoPathPCFL);
%uC
uCFXData = csvread(infoPathuC);
%% Results Analysis
%---------------------------Frequency Analysis--------------------------- %
% Description: All frequency values obtain in the different implementation
% will be compared with the absolute value used to generate the original
% signal, with that the absolute and the relative error will be calculated
% in order to determine the maximum/minimum absolute/relative error and the
% average error in both cases

len = length(MatData(:,1));                 %Same value for all the implementations

%MatLab fft results
Mat_ErrAbs = [];
Mat_ErrRel = [];
Mat_MnErrAbs = 0;
Mat_MeErrAbs = 0;
Mat_MnErrRel = 0;
Mat_MeErrRel = 0;
for i=1:len
    AbsErr = abs(MatData(i,4)-MatData(i,2));    %Calculates the absolute error
    Mat_ErrAbs = [Mat_ErrAbs AbsErr];           %Saves the absolute error in a matrix
    if(AbsErr>Mat_MnErrAbs)                     %If the absolute error is bigger than the current value of absoluter error saves the biggest value
        Mat_MnErrAbs = AbsErr;
    end
    RelErr =  AbsErr/MatData(i,2);              %Calculates the relative error
    Mat_ErrRel = [Mat_ErrRel RelErr];           %Saves the value in a matrix
    if(RelErr>Mat_MnErrRel)                     %If the relative error is bigger than the current value of relative error saves the biggest value
        Mat_MnErrRel = RelErr;
    end
end
Mat_MeErrAbs = mean(Mat_ErrAbs);
Mat_MeErrRel = mean(Mat_ErrRel);


%PC - FixedPoint Implementation
PCFX_ErrAbs = [];
PCFX_ErrRel = [];
PCFX_MnErrAbs = 0;
PCFX_MeErrAbs = 0;
PCFX_MnErrRel = 0;
PCFX_MeErrRel = 0;
for i=1:len
    AbsErr = abs(PCFXData(i,1)-MatData(i,2));    %Calculates the absolute error
    PCFX_ErrAbs = [PCFX_ErrAbs AbsErr];          %Saves the absolute error in a matrix
    if(AbsErr>PCFX_MnErrAbs)                     %If the absolute error is bigger than the current value of absoluter error saves the biggest value
        PCFX_MnErrAbs = AbsErr;
    end
    RelErr = AbsErr/MatData(i,2);                %Calculates the relative error
    PCFX_ErrRel = [PCFX_ErrRel RelErr];          %Saves the value in a matrix
    if(RelErr>PCFX_MnErrRel)                     %If the relative error is bigger than the current value of relative error saves the biggest value
        PCFX_MnErrRel = RelErr;
    end       
end
PCFX_MeErrAbs = mean(PCFX_ErrAbs);
PCFX_MeErrRel = mean(PCFX_ErrRel);

%PC - FloatingPoint Implementation
PCFL_ErrAbs = [];
PCFL_ErrRel = [];
PCFL_MnErrAbs = 0;
PCFL_MeErrAbs = 0;
PCFL_MnErrRel = 0;
PCFL_MeErrRel = 0;
for i=1:len
    AbsErr = abs(PCFLData(i,1)-MatData(i,2));    %Calculates the absolute error
    PCFL_ErrAbs = [PCFL_ErrAbs AbsErr];          %Saves the absolute error in a matrix
    if(AbsErr>PCFL_MnErrAbs)                     %If the absolute error is bigger than the current value of absoluter error saves the biggest value
        PCFL_MnErrAbs = AbsErr;
    end
    RelErr = AbsErr/MatData(i,2);                %Calculates the relative error
    PCFL_ErrRel = [PCFL_ErrRel RelErr];          %Saves the value in a matrix
    if(RelErr>PCFL_MnErrRel)                     %If the relative error is bigger than the current value of relative error saves the biggest value
        PCFL_MnErrRel = RelErr;
    end       
end
PCFL_MeErrAbs = mean(PCFL_ErrAbs);
PCFL_MeErrRel = mean(PCFL_ErrRel);

%uC - FixedPoint Implementation
uCFX_ErrAbs = [];
uCFX_ErrRel = [];
uCFX_MnErrAbs = 0;
uCFX_MeErrAbs = 0;
uCFX_MnErrRel = 0;
uCFX_MeErrRel = 0;
for i=1:len
    AbsErr = abs(uCFXData(i,1)-MatData(i,2));    %Calculates the absolute error
    uCFX_ErrAbs = [uCFX_ErrAbs AbsErr];          %Saves the absolute error in a matrix
    if(AbsErr>uCFX_MnErrAbs)                     %If the absolute error is bigger than the current value of absoluter error saves the biggest value
        uCFX_MnErrAbs = AbsErr;
    end
    RelErr = AbsErr/MatData(i,2);                %Calculates the relative error
    uCFX_ErrRel = [uCFX_ErrRel RelErr];          %Saves the value in a matrix
    if(RelErr>uCFX_MnErrRel)                     %If the relative error is bigger than the current value of relative error saves the biggest value
        uCFX_MnErrRel = RelErr;
    end       
end
uCFX_MeErrAbs = mean(uCFX_ErrAbs);
uCFX_MeErrRel = mean(uCFX_ErrRel);
%------------------------Execution Time Analysis--------------------------%
%Description: This stage of the results analysis only shows the execution
%times of each implementation, the comparisson between the execution times
%will be done in the results discussion

%PC - FixedPoint Implementation
PCFX_MeExcTime = mean(PCFXData(:,2));
PCFX_MinExcTime = min(PCFXData(:,2));
PCFX_MaxExcTime = max(PCFXData(:,2));

%PC - FloatingPoint Implementation
PCFL_MeExcTime = mean(PCFLData(:,2));
PCFL_MinExcTime = min(PCFLData(:,2));
PCFL_MaxExcTime = max(PCFLData(:,2));

%PC - FixedPoint Implementation
uCFX_MeExcTime = ceil(mean(uCFXData(:,2)));
uCFX_MinExcTime = min(uCFXData(:,2));
uCFX_MaxExcTime = max(uCFXData(:,2));
%
CLK_FREQ = 1*10^6;  %clock frequency of the uC
ID = 1;             %Division value of the CLK in uC
TACCR0 = 499;       %Value of the counter of the Timer
%Resolution of the timer is given by the following formula: 
res = (ID*(TACCR0+1))/CLK_FREQ;

%% ---------------------------Results Display---------------------------- %
% ---------------------------Frequency Results--------------------------- %
disp('----------------------- Frequency Results -----------------------');
disp(['-----------------------> MatLab Results <-----------------------']);
disp(['Average Absolut error:  ' num2str(Mat_MeErrAbs) 'Hz']);
disp(['Max/min Absolut error:  ' num2str(Mat_MnErrAbs) 'Hz']);
disp(['Average Relative error: ' num2str(Mat_MeErrRel*100) '%']);
disp(['Max/min Relative error: ' num2str(Mat_MnErrRel*100) '%']);

disp(['----------------> FixedPoint Implemetation - PC <----------------']);
disp(['Average Absolut error:  ' num2str(PCFX_MeErrAbs) 'Hz']);
disp(['Max/min Absolut error:  ' num2str(PCFX_MnErrAbs) 'Hz']);
disp(['Average Relative error: ' num2str(PCFX_MeErrRel*100) '%']);
disp(['Max/min Relative error: ' num2str(PCFX_MnErrRel*100) '%']);

% ---------------------------Frequency Results--------------------------- %
disp(['--------------> FloatingPoint Implemetation - PC <---------------']);
disp(['Average Absolut error:  ' num2str(PCFL_MeErrAbs) 'Hz']);
disp(['Max/min Absolut error:  ' num2str(PCFL_MnErrAbs) 'Hz']);
disp(['Average Relative error: ' num2str(PCFL_MeErrRel*100) '%']);
disp(['Max/min Relative error: ' num2str(PCFL_MnErrRel*100) '%']);

% ---------------------------Frequency Results--------------------------- %
disp(['----------------> FixedPoint Implemetation - uC <----------------']);
disp(['Average Absolut error:  ' num2str(uCFX_MeErrAbs) 'Hz']);
disp(['Max/min Absolut error:  ' num2str(uCFX_MnErrAbs) 'Hz']);
disp(['Average Relative error: ' num2str(uCFX_MeErrRel*100) '%']);
disp(['Max/min Relative error: ' num2str(uCFX_MnErrRel*100) '%']);

% ----------------------- ExecutionTime Results ------------------------- %
disp('-------------------- ExecutionTime Results ----------------------');
disp(['----------------> FixedPoint Implemetation - PC <----------------']);
disp(['Average: ' num2str(PCFX_MeExcTime) 'uS']);
disp(['Minimum: ' num2str(PCFX_MinExcTime) 'uS']);
disp(['Maximum: ' num2str(PCFX_MaxExcTime) 'uS']);

disp(['--------------> FloatingPoint Implemetation - PC <---------------']);
disp(['Average: ' num2str(PCFL_MeExcTime) 'uS']);
disp(['Minimum: ' num2str(PCFL_MinExcTime) 'uS']);
disp(['Maximum: ' num2str(PCFL_MaxExcTime) 'uS']);

disp(['----------------> FixedPoint Implemetation - PC <----------------']);
disp(['Average(nr ticks): ' num2str(uCFX_MeExcTime) '   Time: ' num2str(uCFX_MeExcTime*res) 'S']);
disp(['Minimum(nr ticks): ' num2str(uCFX_MinExcTime) '   Time: ' num2str(uCFX_MinExcTime*res) 'S']);
disp(['Maximum(nr ticks): ' num2str(uCFX_MaxExcTime) '   Time: ' num2str(uCFX_MaxExcTime*res) 'S']);