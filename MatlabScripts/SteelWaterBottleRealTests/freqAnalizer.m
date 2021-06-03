function [f, Sf] = freqAnalizer(Signal,Fs)
    %------------------------- Inputs -------------------------%
    % Signal[]- Signal in time domain
    % Fs      - sampling frequency
    %------------------------- Outputs ------------------------%
    % f[]    - frequency vector       - plot and calcule purpose
    % Sf[]   - Normalized signal      - plot and calcule purpose  
    
    
    Ls = length(Signal);    %Calcules the length of the input signal
    n = 2^nextpow2(Ls);     %Improve the performance of the fft function, see documentation of fft in matlab website
    f = Fs*(0:n/2-1)/n;       %Frequency vector
    
    %Converts the input signal into frequency domain and normalize it
    Y = fft(Signal);%l-mean(Signal), n)/Ls;
    P = abs(Y/Ls);          %Computes the two side spectrum        
    Sf = P(1:Ls);
    Sf = 2*Sf(1:end);
    
%     Sf = P(2:n/2+1)/max(P(2:n/2+1));  %Defines the signal in a single side, the rest is just a mirror of this side
end

