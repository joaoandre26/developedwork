close all
clear all
clc
%% 
%Values Setting
f1 = [900 1000 1100];
Offset = 0;
Amplitude = 0.5;
Phase = 0;
var = [0 0.01 0.05 0.1 0.5]; % By changing variance, and use it as 0 there is no error
meanS = 0;
fv1 = [300 400 500 700 850 1150 1700];
%Determines the number of samples
%From previous study the max value of a frequency is 1200Hz, so sampling
%frequency should be at least twice that value, so 1200*2 = 2400, for
%safety, 4000Hz 
Fs = 4000;
% Vectors alocation to reduce running time
emDfa = zeros(1, length(f1));
eDfa = zeros(1, length(f1));
% Necessaries calcs Befores running the loops
Ts = 1/Fs;
% wk = 2*Pi*k/T -> De forma discreta wk = 2*Pi*k/N
N = (2*pi)/Ts;
size = nextpow2(N);
for k = 1 : length(var)
    for j = 1: length(f1)
        [y, t] = signalGen(Offset, Amplitude, f1(j), fv1, Phase, Fs, var(k), meanS);
        [In, Ina, Df, Dfa, f, Sf] = freqAnalizer(y, Fs);
        emDfa(1,j) = abs(mean(Df)-f1(j))/f1(j);
        eDfa(1,j) = abs(Dfa-f1(j))/f1(j);
        figure(1)
        subplot(1,2,1)
        plot(t, y);
        axis([0 max(t) min(y) max(y)]);
        xlabel("Time(s)");
        ylabel("Amplitude");
        title("Signal");
        subplot(1,2,2)
        plot(f, Sf)
        hold on
        label = strcat(num2str(f(Ina)),'Hz');
        plot(f(Ina), Sf(Ina), 'r o')
        text(f(Ina), Sf(Ina), label, 'VerticalAlignment','top','HorizontalAlignment','left');
        hold off
        axis([0 max(f) 0 1])
        xlabel("Frequency(Hz)")
        ylabel("|S(f)|")
        title("Sinlge-Sided Amplitude Spectrum of S(t)")
        % Uncomment to save Images
        %saveas(gcf, strcat('Destination of Images',num2str(f1(j)),'Hz',num2str(var(k)),'var','.jpg'));
        y = [];
        err = [];
    end
    disp("Variance: ")
    var(1,k)
    disp("Error for mean Calc: ")
    pemDfa = emDfa*100
    disp("Error for absolute Calc: ")
    peDfa = eDfa*100   
end