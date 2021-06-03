function [mID] = dominantMeanID(Signal, thrVal, lID, size)
    %------------------ Function Description ------------------%
    % This function serves to find the peak with the highest
    % average energy, returning the ID of it
    %------------------------- Inputs -------------------------%
    % Signal[]- Signal in frequency domain
    % thrVal  - value to define if is a peak or not
    % lID     - set a point to start search for the ID
    % size    - size of the intire spectrum
    %------------------------- Outputs ------------------------%
    % domID   - ID of the dominant peak in the spectrum
    rng = 5;
    lsID = 0;
    mID = 0;
    maxEn = 0;
    En = 0;
    for i=lID:1:(size/2)
%         disp(num2str(i))
        if Signal(i)>=thrVal
            if lsID < (i-rng)
                lsID = i;
                En = AvgAmp(Signal, lsID, (thrVal/3));
%                 disp(num2str(En))
%                 disp(num2str(maxEn))
                if En>maxEn
                    maxEn = En;
                    mID = lsID;
                end
            elseif Signal(i)>Signal(lID)
                lsID = i;
            end
        end
    end
end

