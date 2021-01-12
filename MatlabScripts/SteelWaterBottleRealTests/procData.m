function [f,P] = procData(data,Fs)
% This function serves the purpose of processing the time signal into a
% frequency signal, in order to se the result in frequency domain after
% capturing the signal with the uC
%  Inputs:
%   data     - signal in time domain
%   Fs      - sampling frequency
%  Outputs: 
%   f       - frequency vector
%   P       - spectrum vector

    Y = fft(data);
    L = length(data);
    P2 = abs(Y/L);
    P = P2(2:L/2+1);
    P(2:end) = 2*P(2:end);
    f = Fs*(0:(L/2))/L;
    f = f(2:end);
%   To plot this data, the first element of each one of the output vectors
%   must no be considered
end

