function [y, t] = signalGen(Os,As, fa, fr, Ps, Fs, Evar, Emean)
    % ---------------------- Inputs ----------------------%
    % Os    : Offset
    % As    : Amplitude
    % fa    : Signal Frequency
    % fr [] : Vector of multiple freq. to add to the signal 
    % Ps    : Phase
    % Fs    : Sampling Frequency
    % Evar  : Variance of error
    % Emean : Mean of error
    % ---------------------- Outputs ---------------------%
    % y []  : Signal Generated
    % t []  : Time vector
    Ts = 1/Fs;
    % wk = 2*Pi*k/T -> De forma discreta wk = 2*Pi*k/N
    N = (2*pi)/Ts;
    size = nextpow2(N);
    % Signal Generation
    [y, t] = simpleSignalGen(Os, As, fa, Ps, Fs, size);
    for i = 1 : length(fr)
        [y1, t1] = simpleSignalGen(0, abs(fr(i)/(10000*i)), fr(i), 0, Fs, size);
        y=y + y1;
    end
    %Generates the error signal with variance and mean ajustable
    err = sqrt(Evar)*randn(1,2^size)+Emean;
    y = y + err;
    y = y;%/max(y);
end
