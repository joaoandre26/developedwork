function [avg] = AvgAmp(Signal,id, thr)
    %------------------ Function Description ------------------%
    % This function serves to find the average energy of a
    % certain peak
    %------------------------- Inputs -------------------------%
    % Signal[]- Signal in frequency domain
    % id      - id with the highest value
    % thr     - threshold value to calculate the average energy
    %------------------------- Outputs ------------------------%
    % avg     - average energy of the peak
    sumVal = 0;
    avg = 0;
    imin = 0;
    i = id;
    while Signal(i)>=thr
        i = i - 1;
    end
    
    i = i + 1;
    imin = i;
    
    while Signal(i)>=thr
        sumVal = sumVal + Signal(i);
        i = i + 1;
    end
    avg = sumVal/(i-imin);
end

