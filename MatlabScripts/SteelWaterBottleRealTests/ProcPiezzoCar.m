clear all
close all
clc
%% Paths - uncomment to process the data
%Data recorded on the 21st of December 2020

basePath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests27_04_2021\';
graphPath = 'E:\ResultsThesis\NResults27_04_2021\';

circPath = ['Free\']%;'Glue\'];
pointPath = ['Characterization4k\'];%;'Characterization8k\'];
bottlePath = ['Small\';'Biggg\'];

%% Data processing
CLK = 1000000;
SampFac = 75;
Fs = CLK/SampFac;

for C=1:(length(circPath(:,1)))
    for P=1:(length(pointPath(:,1)))
        for G=1:length(bottlePath(:,1))
            path = strcat(basePath,circPath(C,:),pointPath(P,:),bottlePath(G,:));
            list = dir(path);
            dirL = size(list);
            dirL = dirL(1,1) - 2;
            for tr=1:1
                freq = 'f6500hz';
                data = csvread(strcat(path,freq,'.txt'));
                Y = fft(data);
                L = length(data);
                P2 = abs(Y/L);
                P1 = P2(2:L/2+1);
                P1(2:end) = 2*P1(2:end);
                f = Fs*(0:(L/2))/L;
                t = (1/Fs)*(0:L-1);
                gfc = figure(1);
                subplot(2,1,1)
                plot(t,data);
                grid on
                axis([t(1) t(end) 300 700]);
                xlabel('time(s)');
                ylabel('Amplitude');
                title(['Original frequency ' freq(2:end-2) 'Hz, ' circPath(C,1:end-1) ',' pointPath(P,1:end-4) ',' bottlePath(G,1:end-1)]);
                subplot(2,1,2)
                plot(f(2:end),P1);
                axis([0 Fs/2 0 35]);
                xlabel('Frequency(Hz)');
                ylabel('Amplitude');
                title(['Spectrum of the SineWave with ' freq(2:end-2) 'Hz, ' circPath(C,1:end-1) ',' pointPath(P,1:end-4) ',' bottlePath(G,1:end-1)]);
                %savePath = strcat(graphPath,circPath(C,:),pointPath(P,:),bottlePath(G,:),'test',num2str(tr),'.pdf');
                %saveas(gfc, savePath);
                
                
                savePath = strcat(graphPath,'test.pdf');
                finalPath = strcat(graphPath,circPath(C,1:end-1),pointPath(P,1:end-1),bottlePath(G,1:end-1),'.pdf');
                save2pdf(savePath);
                append_pdfs(finalPath,savePath);
%                 
            end
        end
    end 
end