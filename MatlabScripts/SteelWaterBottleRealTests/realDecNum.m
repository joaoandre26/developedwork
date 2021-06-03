function [orig,altered] = realDecNum(num)
    tmpbin = dec2bin(num,8);
    if tmpbin(1,1) == '1'
        tmpbin(1,1) = '0';
    else
        tmpbin(1,1) = '1';
    end
    orig = num;
    altered = bin2dec(tmpbin);
end

