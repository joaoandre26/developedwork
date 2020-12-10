clear all
close all
clc
%%
s=serialport("COM4",115200);

signalPath = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\GlassWaterBottleRealTests\Signals\Converted"; %%This path is OutOf date
list = dir(signalPath);
dirL=size(list);                %return the files/folders/etc inside, in this case is ment to only have files
dirL=dirL(1,1)-2;               %Since there is also in this list . and .., that doesn't count as file.
%signalPath = strcat(signalsPath, "\signal", num2str(dirL), ".txt");
infoPathuC = "C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\GlassWaterBottleRealTests\Results\uCRealResults.txt"; %%This path is OutOf date

%Execution Data variables array
excData = zeros(10,3);       %On each iteration the resulting data will be saved in next empty line in the following order
                    % DominantFrequency NumberOfTicks ExecutionTime 
%Script variables


%General variables, must be changed according to the variables used in the
%uC implementation
BUFF_SIZE = 512;
samp_freq = 8000;   %in Hz
CLK_FREQ = 1*10^6;  %clock frequency of the uC
ID = 1;             %Division value of the CLK in uC
TACCR0 = 499;       %VAlue of the counter of the Timer
%Resolution of the timer is given by the following formula: 
res = (ID*(TACCR0+1))/CLK_FREQ;
% with these parameters defines a resolution of 500uS
%The execution time is given by the following formula:
%excT =  res*ntick
tic
i=0;
while i<dirL
    Data = csvread(strcat(signalPath, "\signal", num2str(i), ".txt"));
    j=0;
    while(j<BUFF_SIZE)
        DbinVal = dec2bin(Data(j+1),16); %Converts the value from j index into a 16bit value
        Dmsb=DbinVal(1:8);          %Splits the binary value, and saves the msByte into a specific variable
        Dlsb=DbinVal(9:16);         %Splits the binary value, and saves the lsByte into a specific variable 
        write(s,bin2dec(Dmsb),"uint8");      %Writes on the uart the 8 msb
        write(s,bin2dec(Dlsb),"uint8");      %writes on the uart the 8 lsb
        j=j+1;
    end
%     disp('Done');
    %After all data is sent we will wait for the uC to send the value of
    %his calculations by read the uart value that he sends
    msbF=read(s,1,"uint8");         %Fisrt  -> the 8 msb of the frequency value, the values appear as decimal values
    lsbF=read(s,1,"uint8");         %Second -> the 8 lsb of the frequency value, the values appear as decimal values 
    domF=bin2dec(strcat(dec2bin(msbF,8),dec2bin(lsbF,8)));  %The msb and lsb values are converted to binary values, then they are concatenated and later converted again in decimal values
%     disp(['Dominant Frequency: ' num2str(domF) 'Hz']);
    %After sending the value of the frequency the uC will send via uart the
    %number of tick since beginning and the end of execution of the algorithm in the uC 
    msbE=read(s,1,"uint8");         %Fisrt  -> the 8 msb of the ticks value, the values appear as decimal values
    lsbE=read(s,1,"uint8");         %Second -> the 8 lsb of the ticks value, the values appear as decimal values
    ntick=bin2dec(strcat(dec2bin(msbE,8),dec2bin(lsbE,8)));  %The msb and lsb values are converted to binary values, then they are concatenated and later converted again in decimal values 
%     disp(['Number of Ticks: ' num2str(ntick)]);
    %the number of ticks is converted to time
    exctime = res*ntick;
    excData(i+1,1) = domF;
    excData(i+1,2) = ntick;
    excData(i+1,3) = exctime;
    disp(['Iteration ' num2str(i) ',Done!'])
    i=i+1;
end
toc
if exist(infoPathuC)==2
    eData = csvread(infoPathuC);
    csvwrite(infoPathuC, [eData; excData]);
else
    csvwrite(infoPathuC, excData);
end