function [In, Ina, Df, Dfa, f, Sf] = freqAnalizer(Signal,Fs)
    %------------------------- Inputs -------------------------%
    % Signal[]- Signal in time domain
    % Fs      - sampling frequency
    %------------------------- Outputs ------------------------%
    % In[]   - Index of dominant freq
    % Ina[]  - Index of absolute dominant frequancy
    % Df[]   - Dominant frequencies
    % Dfa[]  - Absolute dominante frequency
    % f[]    - frequency vector       - plot and calcule purpose
    % Sf[]   - Normalized signal      - plot and calcule purpose  
    
    
    Ls = length(Signal);    %Calcules the length of the input signal
    n = 2^nextpow2(Ls);     %Improve the performance of the fft function, see documentation of fft in matlab website
    f = Fs*(0:n/2)/n;       %Frequency vector
    
    %Converts the input signal into frequency domain and normalize it
    Y = fft(Signal-mean(Signal), n)/Ls;
    P = abs(Y/n);          %Computes the two side spectrum        
    Sf = P(1:n/2+1)/max(P(1:n/2+1));  %Defines the signal in a single side, the rest is just a mirror of this side
    
    %The frequency vector is normalized, so the dominant frequencies should
    %not be less then 0.7. We just need to find the points above that value
    %to find his related frequency
    In = find(Sf(:)>0.8);
    Ina= find(Sf(:)==1);
    Dfa= f(Ina);
    Df = f(In);
    %To work perfectly it should be update the method to find, the reason
    %to do that is because when two frequencies are very similar it should
    %be arrenged a method to decid wich one is the correct one. It could be
    %just a average between those two. 
    %A simple loop to check if two pts value are just one index of
    %different from one to another
end