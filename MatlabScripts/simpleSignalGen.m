function [y,t] = simpleSignalGen(O, A, f, P, Fs, size)
    % --------------------- Inputs ---------------------%
    % O     : Offset
    % A     : Amplitude
    % f     : Signal Frequency
    % P     : Phase
    % Fs    : Sampling Frequency
    % size  : Number of samples, power of 2 of this value
    % --------------------- Outputs --------------------%
    % y []  : Signal Generated
    % t []  : Time vector
    N = 2^size;
    Ts = 1/Fs;          %Sampling Period
    t = 0:Ts:N*Ts-Ts;   %Time Vector
    wn = 2*pi*f;
    x=O+A*sin(wn*t+P);
    ns=hann(N/8);
    y=x(1:N/16).*ns(length(ns)/2:end-1)';
    for i = 1:10
        aux=(1/exp(i))*x(1:N/8).*ns';
        for j = N/32:-1:1
            y(end+1-j) = y(end+1-j)+aux(N/32+1-j);  
        end
        y = [y aux(N/16:end)];
    end    
    y = [y zeros(1,N-length(y))];
end