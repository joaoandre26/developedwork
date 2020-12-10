close all
clear all
clc
%%
% Data process of the signals from the 09/11/2020
%%
% Path of the data files
basePath = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests13_11_2020\';
% LPG bottle
fullPath = 'Full\';
halfPath = 'Half\';
emptyPath = 'Empty\';
% Point of measurment
bottomPath = 'Bottom\';
centerPath = 'Center\';
LiqLvlPath = '80Levl\';
topPath = 'BotMid\';
% additional strings
test = 'test'; 
format = '.txt';
% G: 1 - Full ; 2 - Half ; 3 - Empty;
% P: 1 - Bottom ; 2 - Center ; 3 - 80Levl ; 4 - Top;
GraphsPath1 = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests13_11_2020\Graphics\ComparisonBtwPoints\';
GraphsPath2 = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests13_11_2020\Graphics\ComparisonBtwBottles\';
GraphsPath3 = ''; 
%Sampling frequency
fs=4000;

%% 1 - Comparisson of the different hit/measure points, for the 3 different bottles
gfc1 = figure(1);
for G=1:3
    % Selects the bottle for comparisson
    if (G == 1)
        bottlePath = fullPath;
    elseif(G == 2)
        bottlePath = halfPath;
    elseif(G == 3)
        bottlePath = emptyPath;
    else
        bottlePath = '';
    end
    for i=0:49
        % selects each test, to compare the different points
        for P=1:4
            % Processes the differents hitpoits
            % Selects the point
            if(P == 1)
                pointPath = bottomPath;
            elseif(P == 2)
                pointPath = centerPath;
            elseif(P == 3)
                pointPath = LiqLvlPath;
            elseif(P == 4)
                pointPath = topPath;
            else
                pointPath = '';
            end
            path = strcat(basePath, bottlePath, pointPath, test, num2str(i), format);
            data = csvread(path);
            Y = fft(data);
            L = length(data);
            P2 = abs(Y/L);
            P1 = P2(2:L/2+1);
            P1(2:end) = 2*P1(2:end);
            f = fs*(0:(L/2))/L;
            subplot(4,1,P);
            plot(f(2:end),P1);
            ylabel('Magnitude');
            xlabel('Frequency(Hz)');
            title(['Spectrum of the signal captured from ' pointPath(1:end-1) ' of ' bottlePath(1:end-1) ' bottle']);
            axis([600 2000 0 0.02]);
        end
        % Saving the graphic
        saveas(gfc1, strcat(GraphsPath1, bottlePath(1:end-1),'_ResultsTest',num2str(i),'.svg'));
    end
end

%% 2 - Comparison of the different tests in the 3 bottles, for the different measuring points
gfc2 = figure(2);
for P=1:4
    %selects the measure point
    if(P == 1)
        pointPath = bottomPath;
    elseif(P == 2)
        pointPath = centerPath;
    elseif(P == 3)
        pointPath = LiqLvlPath;
    elseif(P == 4)
        pointPath = topPath;
    else
        pointPath = '';
    end
    
    for i=0:49
        %selects the test
        for G=1:3
            %selects the bottle that is going to be processed
            if (G == 1)
                bottlePath = fullPath;
            elseif(G == 2)
                bottlePath = halfPath;
            elseif(G == 3)
                bottlePath = emptyPath;
            else
                bottlePath = '';
            end
            % Processes the signals and plots it
            path = strcat(basePath, bottlePath, pointPath, test, num2str(i), format);
            data = csvread(path);
            Y = fft(data);
            L = length(data);
            P2 = abs(Y/L);
            P1 = P2(2:L/2+1);
            P1(2:end) = 2*P1(2:end);
            f = fs*(0:(L/2))/L;
            subplot(3,1,G);
            plot(f(2:end),P1);
            ylabel('Magnitude');
            xlabel('Frequency(Hz)');
            title(['Spectrum of the signal captured from ' bottlePath(1:end-1) ' tank']);
            axis([600 2000 0 0.02]);
        end
        % Saving the graphic
        saveas(gfc2, strcat(GraphsPath2, pointPath(1:end-1),'_ResultsTest',num2str(i),'.svg'));
    end
end



%% 3 - 

