clear all
close all
clc
%%
FullPath = 'C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\SteelWaterBottleRealTests\Results\Full\';
HalfPath = 'C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\SteelWaterBottleRealTests\Results\Half\';
EmptyPath = 'C:\Users\JoaoAndre\Documents\masterthesis\MatlabScripts\SteelWaterBottleRealTests\Results\Empty\';

Fs = 4000;
Results = zeros(3,30);
for j=1:3
    if j == 1
        Path = FullPath;
    elseif j == 2
        Path = HalfPath;
    elseif j == 3
        Path = EmptyPath;
    end
    for i=0:29
        y = csvread(strcat(Path, 'test', num2str(i), '.txt'));
    %     y = bandpass(x,[800 1100], Fs);
        L = length(y);
        %% Using fft
        Y = fft(y);
        P = abs(Y/L);
        P1 = P(1:L/2+1);
        P1(2:end-1) = 2*P1(2:end-1);
        f = Fs*(0:(L/2))/L;
        id = find(max(P1(:,1))==P1(:,1));   %finds the ID of the value with the highest magnitude
        Results(j,i+1) = f(1,id);                     % returns the correposndent dominant frequency
%         disp(['Dominant frequency: ' num2str(domF) 'Hz']);
    end
end

%Indivudual spectrum
%Full
y = csvread(strcat(FullPath, 'test', num2str(9), '.txt'));
L = length(y);
% Using fft
Y = fft(y);
P = abs(Y/L);
P1 = P(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
Full = P1;
f = Fs*(0:(L/2))/L;
%Half
y = csvread(strcat(HalfPath, 'test', num2str(9), '.txt'));
L = length(y);
% Using fft
Y = fft(y);
P = abs(Y/L);
P1 = P(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
Half = P1;
f = Fs*(0:(L/2))/L;
%Empty
y = csvread(strcat(EmptyPath, 'test', num2str(9), '.txt'));
L = length(y);
% Using fft
Y = fft(y);
P = abs(Y/L);
P1 = P(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
Empty = P1;
f = Fs*(0:(L/2))/L;

gfc1 = figure(1);
subplot(3,1,1);
plot(f,Full);
axis([600 1400 0 0.01]);
ylabel('Magnitude');
xlabel('Frequency(Hz)');
title('Spectrum of the signal captured from Full tank');
subplot(3,1,2);
plot(f,Half);
axis([600 1400 0 0.02]);
ylabel('Magnitude');
xlabel('Frequency(Hz)');
title('Spectrum of the signal captured from Half tank');
subplot(3,1,3);
plot(f,Empty);
axis([600 1400 0 0.02]);
ylabel('Magnitude');
xlabel('Frequency(Hz)');
title('Spectrum of the signal captured from Empty tank');

%Graphs
gfc2 = figure(2);
hold on;
plot([0:1:29],Results(1,:), 'bo');
plot([0:1:29],Results(2,:), 'mx');
plot([0:1:29],Results(3,:), 'r*');
hold off;
axis([0 29 650 1600]);
xlabel('Test number');
ylabel('Frequency(Hz)');
title('Frequency vs Level');
legend('Full', 'Half', 'Empty');
grid on;

%Save Grafics
% exportgraphics(gfc1, 'spectrum.eps');
% exportgraphics(gfc2, 'tests.eps');