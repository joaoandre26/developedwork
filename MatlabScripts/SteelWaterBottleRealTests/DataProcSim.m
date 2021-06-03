clear all
close all
clc
%% Paths - uncomment to process the data
%Data recorded on the 21st of December 2020

basePath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests18_05_2021\';
%graphPath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests21_12_2020\Graphics2\';
graphPath = 'E:\ResultsThesis\NResults18_05_2021\FreqSim\';

% circPath = ['PieBAu\';'PiezAu\'];
% circPath = ['AcImMa\';'AcImAu\';'AcCiMa\';'AcCiAu\';'AcEsMa\';'AcEsAu\'];
circPath = ['AcImMa\';'AcCiMa\'];
pointPath = ['BotMid\';'TopMid\'];
bottlePath = ['Empt\';'Half\';'Full\'];

%% Data processing
CLK = 1000000;
SampFac = 250;
Fs = CLK/SampFac;

for C=1:(length(circPath(:,1)))
        for P=1:length(pointPath(:,1))
            for tr=0:9
                for G=1:length(bottlePath(:,1))
                    path = strcat(basePath,circPath(C,:),pointPath(P,:),bottlePath(G,:));
                    sig = strcat(path,'test', num2str(tr),'.txt');
                    disp(sig)
                    data = csvread(sig);
%                     data = data(128:895);
                    Y = fft(data);
                    L = length(data);
                    P2 = abs(Y/L);
                    P1 = P2(2:L/2+1);
                    P1(2:end) = 2*P1(2:end);
                    f = Fs*(0:(L/2))/L;
                    t = (1/Fs)*(0:L-1);
                    gfc = figure(1);
                    if G == 1
                        plot(f(2:end),P1,'b');
                    elseif G == 2
                        plot(f(2:end),P1,'k');
                    else
                        plot(f(2:end),P1,'r');
                    end
                    hold on
                    axis([600 1200 0 100]);
                    xlabel('Frequency(Hz)');
                    ylabel('Amplitude');
                    title(['Spectrum of the measurment nº' num2str(tr) ', measured in ' pointPath(P,1:end-4) ' with ' circPath(C,1:end-1)]);
                end
                legend(bottlePath(1,(1:end-1)),bottlePath(2,(1:end-1)),bottlePath(3,(1:end-1)));
                hold off
                    savePath = strcat(graphPath,'test.pdf');
                    finalPath = strcat(graphPath,circPath(C,1:end-1),pointPath(P,1:end-1),'.pdf');
                    save2pdf(savePath);
                    append_pdfs(finalPath,savePath);
            end 
        end
end