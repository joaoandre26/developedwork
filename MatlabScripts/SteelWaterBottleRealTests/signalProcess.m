close all
clear all
clc
%%
path = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests29_10_2020\ResultsFs44100\';
Fs = 44100;
meas = ['a';'b';'c'];
Type = ['Empty';'Half ';'Full '];

A = zeros(3,3,3);

% disp("---------------------------------------");
for m=1:3
    for n=1:3
        typePath = strcat('Z',num2str(m),meas(n));
%         disp(['------------------' typePath '------------------']);
        for k=3:-1:1
            filePath = strcat('G', num2str(k),typePath);
            y = csvread(strcat(path,filePath, '.txt'));
            L = length(y);
            %% Using fft
            Y = fft(y);
            P = abs(Y/L);
            P1 = P(1:L/2+1);
            P1(2:end-1) = 2*P1(2:end-1);
            f = Fs*(0:(L/2))/L;
            id = find(max(P1(:,1))==P1(:,1));   %finds the ID of the value with the highest magnitude
            domF = f(1,id);                     % returns the correposndent dominant frequency
            A(k,m,n) = domF;
%             disp(['Dominant frequency: ' num2str(domF) 'Hz ----' Type(k, :) num2str(k)]);
        end
%         disp("---------------------------------------");
    end
end

%%Graphics Plots and saving
%Figure 1
graph1 = figure(1);
plot([1 2 3], A(:, 1, 1), 'bo');  %Empty/Half/Full Z1a
hold on;
plot([1 2 3], A(:, 2, 1), 'mx');  %Empty/Half/Full Z2a
hold on;
plot([1 2 3], A(:, 3, 1), 'r*');  %Empty/Half/Full Z3a
set(gca, 'Xtick', [1 2 3], 'XtickLabel', Type);
axis([0 4 800 2600]);
xlabel('Level Type');
ylabel('Frequency(Hz)');
title('Frequency vs Liquid Level(Fixed Measuring Point - Bottom)');
legend({'Hit Point - Bottom', 'Hit Point - Center', 'Hit Point - Top'}, 'location', 'east');
hold off;

%Figure 2
graph2 = figure(2);
plot([1 2 3], A(:, 1, 2), 'bo');  %Empty/Half/Full Z1b
hold on;
plot([1 2 3], A(:, 2, 2), 'mx');  %Empty/Half/Full Z2b
hold on;
plot([1 2 3], A(:, 3, 2), 'r*');  %Empty/Half/Full Z3b
set(gca, 'Xtick', [1 2 3], 'XtickLabel', Type);
axis([0 4 600 1200]);
xlabel('Level Type');
ylabel('Frequency(Hz)');
title('Frequency vs Liquid Level(Fixed Measuring Point - Center)');
legend({'Hit Point - Bottom', 'Hit Point - Center', 'Hit Point - Top'}, 'location', 'east');
hold off;

%Figure 3
graph3 = figure(3);
plot([1 2 3], A(:, 1, 3), 'bo');  %Empty/Half/Full Z1c
hold on;
plot([1 2 3], A(:, 2, 3), 'mx');  %Empty/Half/Full Z2c
hold on;
plot([1 2 3], A(:, 3, 3), 'r*');  %Empty/Half/Full Z3c
set(gca, 'Xtick', [1 2 3], 'XtickLabel', Type);
axis([0 4 600 1400]);
xlabel('Level Type');
ylabel('Frequency(Hz)');
title('Frequency vs Liquid Level(Fixed Measuring Point - Top)');
legend({'Hit Point - Bottom', 'Hit Point - Center', 'Hit Point - Top'}, 'location', 'east');
hold off;

%Saving Graphics
% exportgraphics(graph1, 'BottomMeas.eps');
% exportgraphics(graph2, 'CenterMeas.eps');
% exportgraphics(graph3, 'TopMeas.eps');