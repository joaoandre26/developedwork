clear all
close all
clc
%% Paths - uncomment to process the data
%Data recorded on the 21st of December 2020

basePath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests18_05_2021\';
%graphPath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests21_12_2020\Graphics2\';
graphPath = 'E:\ResultsThesis\NResults18_05_2021\FreqAvg\';

% circPath = ['PieBAu\';'PiezAu\'];
% circPath = ['AcImMa\';'AcImAu\';'AcCiMa\';'AcCiAu\';'AcEsMa\';'AcEsAu\'];    
circPath = ['AcImMa\';'AcCiMa\'];
pointPath = ['BotMid\';'TopMid\'];
bottlePath = ['Empt\';'Half\';'Full\'];

%% Data processing
CLK = 1000000;
SampFac = 250;
Fs = CLK/SampFac;
Pd = 0;
for C=1:(length(circPath(:,1)))
    for P=1:length(pointPath(:,1))
        gfc = figure(1);
        for G=1:length(bottlePath(:,1))
            path = strcat(basePath,circPath(C,:),pointPath(P,:),bottlePath(G,:));
            list = dir(path);
            dirL = size(list);
            dirL = dirL(1,1) - 3;
            for tr=0:dirL
                data = csvread(strcat(path,'test', num2str(tr),'.txt'));
%                 data = data(128:895);
                Y = fft(data);
                L = length(data);
                P2 = abs(Y/L);
                P1 = P2(2:L/2+1);
                P1(2:end) = 2*P1(2:end);
                f = Fs*(0:(L/2))/L;
                t = (1/Fs)*(0:L-1); 
                Pd = Pd+P1;
            end
                subplot(3,1,G)
                Pd = Pd/dirL;
                plot(f(2:end),Pd);
                axis([0 Fs/2 0 100]);
                xlabel('Frequency(Hz)');
                ylabel('Amplitude');
                title(['Average Spectrum of 10 measurments in ' bottlePath(G,1:end-1) ' bottle, on ' pointPath(P,1:end-4) ' with ' circPath(C,1:end-1)]);
                Pd = 0;
        end
        savePath = strcat(graphPath,'test.pdf');
        finalPath = strcat(graphPath,circPath(C,1:end-1),pointPath(P,1:end-1),'.pdf');
        save2pdf(savePath);
        append_pdfs(finalPath,savePath);
    end 
end