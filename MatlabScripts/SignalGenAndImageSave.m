clear all
close all
clc
%% 
Fs = 4000;
Offset = 0;
Amplitude = 1;
Phase = 0;
reData = zeros(1, 4);
var = [0 0.01 0.05 0.1 0.5];
fv = 1000 + randi([-150 150], 1, 10);
Ts = 1/Fs;
% wk = 2*Pi*k/T -> De forma discreta wk = 2*Pi*k/N
N = (2*pi)/Ts;

fa = 1000 + randi([-150 150], 1, 1);
tVar = var(1, randi(length(var), 1, 1));
[y, t] = signalGen(Offset, Amplitude, fa, fv, Phase, Fs, tVar, 0);

[In, Ina, Df, Dfa, f, Sf] = freqAnalizer(y, Fs);
    
figure(1)
plot(t, y)
xlabel('Time(s)');
ylabel('Amplitude');
axis([0 length(t)/Fs -2 2]);
saveas(gcf,'signal4.jpg', 'jpg')

disp('--------Signal Information---------');
disp(['     -> Variance:          ' num2str(tVar)]);
disp(['     -> Frequency(real):   ' num2str(fa) 'Hz']);
disp(['     -> Frequency(MatLab): ' num2str(Dfa) 'Hz']);