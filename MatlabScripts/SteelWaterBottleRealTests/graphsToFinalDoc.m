%% Script to draw the graphs to the final document
clear all
close all
clc
%% Paths
basePath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests25_03_2021\';
% graphPath = 'E:\ResultsThesis\NResults18_05_2021\FreqSim\';
graphPath = 'C:\Users\JoaoAndre\Documents\thesisImages\ResultsGraphs\';

% circPath = ['AcImMa\';'AcCiMa\';'AcEsMa\'];
% circPath = ['AcImAu\';'AcCiAu\';'AcEsAu\'];
% circPath = ['PieBAu\';'PiezAu\'];
circPath = ['PieBMa\';'PiezMa\'];
pointPath = ['BotMid\';'TopMid\'];
bottlePath = ['Empt\';'Half\';'Full\'];

%% Data processing
CLK = 1000000;
SampFac = 250;
Fs = CLK/SampFac;

C = 2;
P = 1;
tr = 0;
for G=1:length(bottlePath(:,1))
                    path = strcat(basePath,circPath(C,:),pointPath(P,:),bottlePath(G,:));
                    sig = strcat(path,'test', num2str(tr),'.txt');
%                     disp(sig)
                    data = csvread(sig);
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
                    axis([000 2000 0 100]);
                    xlabel('Frequency(Hz)');
                    ylabel('Amplitude');
                    title(['Spectrum of the three Bottles, small PiezoElectric']);
end
legend(bottlePath(1,(1:end-1)),bottlePath(2,(1:end-1)),bottlePath(3,(1:end-1)));

exportgraphics(gfc, strcat(graphPath,'PiezMaBot.pdf'));