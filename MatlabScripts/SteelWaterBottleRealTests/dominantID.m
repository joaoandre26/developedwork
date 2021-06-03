function [domID] = dominantID(Signal, lID, size)
    %------------------ Function Description ------------------%
    % This function serves to find the dominant peak in the
    % spectrum, there is no need to look in the etire spectrum
    % due the fact that the second half of it is a reflection
    % of the first
    %------------------------- Inputs -------------------------%
    % Signal[]- Signal in frequency domain
    % size    - size of the intire spectrum
    % lID     - set a point to start search for the ID
    %------------------------- Outputs ------------------------%
    % domID   - ID of the dominant peak in the spectrum
    tmp = 0;
    domID = 0;
    for i=lID:1:(size/2)
        if Signal(i)>tmp
            tmp = Signal(i);
            domID = i;
        end
    end
end

