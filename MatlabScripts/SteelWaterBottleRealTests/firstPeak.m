function [fID] = firstPeak(Signal,thrVal,lID,uID)
    %------------------ Function Description ------------------%
    % This function serves to find the first peak in the
    % spectrum, the reason why a lower and a upper ID is set 
    % is due the fact that there is no relevant information 
    % below or above those IDs
    %------------------------- Inputs -------------------------%
    % Signal[]- Signal in time domain
    % thrVal  - threshold value t determine if is a peak
    % lID     - lower limit to find the First peak
    % uID     - upper limit to find the First peak
    %------------------------- Outputs ------------------------%
    % fID     - ID of the first peak in the spectrum
    fID = 0;
    for i=lID:1:uID
%         disp(['ID: ' num2str(i) ' Amp: ' num2str(Signal(i)) ' thr ' num2str(thrVal)]);
        if(Signal(i) > thrVal)
            fID = i;
            break;
%             i=uID;
        end
    end
end

