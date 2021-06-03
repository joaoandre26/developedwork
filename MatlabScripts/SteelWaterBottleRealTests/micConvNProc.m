clear all
close all
clc
%% Paths - uncomment to process the data
%Data recorded on the 21st of December 2020

basePath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests18_05_2021MIC\';
basePath1 = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests18_05_2021MIC_1\';
graphPath = 'E:\ResultsThesis\NResults18_05_2021MIC\';

StimPath = ['Ma\'];    
pointPath = ['BotMid\';'TopMid\'];
bottlePath = ['Empt\';'Half\';'Full\'];

%% Data processing
% CLK = 1000000;
% SampFac = 250;
% Fs = CLK/SampFac;
Fs = 4000;
for C=1:(length(StimPath(:,1)))
    for P=1:length(pointPath(:,1))
        for G=1:length(bottlePath(:,1))
            path = strcat(basePath,StimPath(C,:),pointPath(P,:),bottlePath(G,:));
            path1 = strcat(basePath1,StimPath(C,:),pointPath(P,:),bottlePath(G,:));
            list = dir(path);
            dirL = size(list);
            dirL = dirL(1,1) - 3;
            for tr=0:dirL
                % Open original Data
                data = csvread(strcat(path,'test', num2str(tr),'.txt'));
                % Convert data 
                minD = abs(min(data));
                maxD = abs(max(data));

                % Conversion
                if(minD>maxD)
                    vec = floor(((data/minD)+1)*0.5*1023);
                else
                    vec = floor(((data/maxD)+1)*0.5*1023);
                end
                %Save the data in another directory for test
                csvwrite(strcat(path1,'test', num2str(tr),'.txt'),vec);
                %Process and save the data
                Y = fft(vec);
                L = length(vec);
                P2 = abs(Y/L);
                P1 = P2(2:L/2+1);
                P1(2:end) = 2*P1(2:end);
                f = Fs*(0:(L/2))/L;
                t = (1/Fs)*(0:L-1);
                % plots
                gfc = figure(1);
                %time domain
                subplot(2,1,1)
                plot(t,vec);
                grid on
                axis([t(1) t(end) 0 1023]);
                xlabel('time(s)');
                ylabel('Amplitude');
                title(['Measured Signal nº' num2str(tr) ',in ' bottlePath(G,1:end-1) ' bottle, measured in ' pointPath(P,1:end-4) ', ' StimPath(C,1:end-1)]);
                %frequency domain
                subplot(2,1,2)
                plot(f(2:end),P1);
                axis([0 Fs/2 0 150]);
                xlabel('Frequency(Hz)');
                ylabel('Amplitude');
                title(['Spectrum of the measurment nº' num2str(tr) ',in ' bottlePath(G,1:end-1) ' bottle, measured in ' pointPath(P,1:end-4) ', ' StimPath(C,1:end-1)]);
                savePath = strcat(graphPath,'test.pdf');
                finalPath = strcat(graphPath,StimPath(C,1:end-1),pointPath(P,1:end-1),bottlePath(G,1:end-1),'.pdf');
                save2pdf(savePath);
                append_pdfs(finalPath,savePath); 
            end
        end
    end 
end