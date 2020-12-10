clear all
close all
clc
%%
%Paths
basePath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests02_12_2020\';
graphPath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests02_12_2020\Graphics\';
circPath = ['AccelCircuit\';'MopekaSensor\';'PiezoCircuit\'];
bottlePath = ['Empt\';'Half\';'Full\'];
pointPath = ['P80Lvl.txt';'Center.txt';'BotMid.txt';'Bottom.txt'];
CLK = 1000000;
SampFac = 256;
Fs = CLK/SampFac;

for C=1:3
    if C == 1
        PL = 4;
    else
        PL = 3;
    end
    for G=1:3
        for P=1:PL
            path = strcat(basePath,circPath(C,:),bottlePath(G,:),pointPath(P,:));
            data = csvread(path);
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
            axis([t(1) t(end) 0 1023]);
            xlabel('time(s)');
            ylabel('Amplitude');
            title(['Time representation of signal in ' bottlePath(G,1:end-1) ' bottle, measured in ' pointPath(P,1:end-4) ' with ' circPath(C,1:end-1)]);
            subplot(2,1,2)
            plot(f(2:end),P1);
            axis([600 (Fs/2) 0 250]);
            xlabel('Frequency(Hz)');
            ylabel('Amplitude');
            title(['Frequency representation of signal in ' bottlePath(G,1:end-1) ' bottle, measured in ' pointPath(P,1:end-4) ' with ' circPath(C,1:end-1)]);
            savePath = strcat(graphPath,circPath(C,:),strcat(bottlePath(G,1:end-1),pointPath(P,1:end-4),'.svg'));
%             saveas(gfc, savePath);
        end
    end 
end


% path = strcat(basePath,circPath(1,:),bottlePath(1,:),pointPath(1,:));
% data = csvread(path);