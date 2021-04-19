clear all
close all
clc
%% ----------------- Script to generate random signals --------------------
% 
Fs = 88200;
N = 2048;
lim = 128;
t = 0:1/Fs:(N*(1/Fs)-(1/Fs));
vec = sin(2*pi*1500*t)+sin(2*pi*3700*t)+sin(2*pi*100*t);
vec = vec/max(vec);
aux = (max(vec)+abs(min(vec)))/2;
vec = (vec+aux)/2;
% Graphic 1
figure(1)
plot(t(1:lim),vec(1:lim), 'k');
axis([0 t(lim) 0 1.1])
xlabel('Time(s)');
ylabel('Amplitude');
saveas(gcf,'C:\Users\JoaoAndre\Documents\thesiswriting\Chapters\2CHP\Diagrams\simpsignal.eps')
% Graphic 2
tt = [];
vec1 = [];
i = 1;
while i<lim
tt = [tt t(i)];
vec1 = [vec1 vec(i)];
i=i+4;
end
figure(2)
plot(t(1:lim),vec(1:lim), 'k');
hold on
stem(tt,vec1, '--k')
axis([0 t(lim) 0 1.1])
xlabel('Time(s)');
ylabel('Amplitude');
saveas(gcf,'C:\Users\JoaoAndre\Documents\thesiswriting\Chapters\2CHP\Diagrams\sampsignal.eps')
% Graphic 3
vec2 = ones(1,lim/4);
figure(3)
stem(tt,vec2, '--k')
axis([0 t(lim) 0 1.1])
xlabel('Time(s)');
ylabel('Amplitude');
saveas(gcf,'C:\Users\JoaoAndre\Documents\thesiswriting\Chapters\2CHP\Diagrams\impulse.eps')