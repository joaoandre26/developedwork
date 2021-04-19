clear all
close all
clc
%% Process Microphone Results to add in the final document in the master thesis
% The selected tests are
% Bottom - Test 7  (Low/Bottom)
% BotMid - Test 5  (Low/Center)
% Center - Test 18 (Top/Bottom)
% 80Lvl  - Test 12 (Top/Center)

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
fs=4000;

path1 = strcat(basePath, fullPath, topPath, test,num2str(5),format);
path2 = strcat(basePath, halfPath, topPath, test,num2str(5),format);
path3 = strcat(basePath, emptyPath, topPath, test,num2str(5),format);

data1 = csvread(path1);
data2 = csvread(path2);
data3 = csvread(path3);

L=length(data1);
%% Time domain
ts = 1/fs;
t = 0:ts:((L*ts)-ts);

figure(1)
subplot(3,1,1)
plot(t,data1);
ylabel('Amplitude');
xlabel('Time(s)');
title(['Signal captured from Lower Section-Center from the Full Bottle']);
axis([0 max(t) -0.5 0.5]);

subplot(3,1,2)
plot(t,data2);
ylabel('Amplitude');
xlabel('Time(s)');
title(['Signal captured from Lower Section-Center from the Half Bottle']);
axis([0 max(t) -0.5 0.5]);

subplot(3,1,3)
plot(t,data3);
ylabel('Amplitude');
xlabel('Time(s))');
title(['Signal captured from Lower Section-Center from the Empty Bottle']);
axis([0 max(t) -0.5 0.5]);
%% Frequency domain
% Y1 = fft(data1);
% Y2 = fft(data2);
% Y3 = fft(data3);
% 
% f = fs*(0:(L/2))/L;
%
% P1 = abs(Y1/L);
% P2 = abs(Y2/L);
% P3 = abs(Y3/L);
% 
% P1 = P1(2:L/2+1);
% P2 = P2(2:L/2+1);
% P3 = P3(2:L/2+1);
% 
% P1(2:end) = 2*P1(2:end);
% P2(2:end) = 2*P2(2:end);
% P3(2:end) = 2*P3(2:end);
% 
% figure(1)
% subplot(3,1,1)
% plot(f(2:end),P1);
% ylabel('Magnitude');
% xlabel('Frequency(Hz)');
% title(['Spectrum of the signal captured from Top Section, Center from the Full Bottle']);
% axis([0 2000 0 0.025]);
% 
% subplot(3,1,2)
% plot(f(2:end),P2);
% ylabel('Magnitude');
% xlabel('Frequency(Hz)');
% title(['Spectrum of the signal captured from Top Section, Center from the Half Bottle']);
% axis([0 2000 0 0.025]);
% 
% subplot(3,1,3)
% plot(f(2:end),P3);
% ylabel('Magnitude');
% xlabel('Frequency(Hz)');
% title(['Spectrum of the signal captured from Top Section, Center from the Empty Bottle']);
% axis([0 2000 0 0.025]);

saveas(gcf,strcat('C:\Users\JoaoAndre\Documents\thesiswriting\Chapters\6CHP\Figures\','TimeLowCenter.eps'));