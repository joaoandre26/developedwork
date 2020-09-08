clear all
close all
clc
%%
signalPath = 'C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\Signals\Synthetized\signal1.txt';
Data = csvread(signalPath);
i=0;
s=serialport("COM4", 115200);
res = [];
tic
while i<512
    DbinVal = dec2bin(Data(i+1),16); %Converts the value from j index into a 16bit value
    Dmsb=DbinVal(1:8);          %Splits the binary value, and saves the msByte into a specific variable
    Dlsb=DbinVal(9:16);         %Splits the binary value, and saves the lsByte into a specific variable 
    write(s,bin2dec(Dmsb),"uint8");      %Writes on the uart the 8 msb  
    write(s,bin2dec(Dlsb),"uint8");      %writes on the uart the 8 lsb
    
%     msb = read(s,1,"uint8");
%     lsb = read(s,1,"uint8");
%     val = bin2dec(strcat(dec2bin(msb,8),dec2bin(lsb,8)));
%     disp(val);
%     res = [res val];
    i=i+1;
end
msb1 = read(s,1,"uint8");
lsb1 = read(s,1,"uint8");
val1 = bin2dec(strcat(dec2bin(msb1,8),dec2bin(lsb1,8)));

msb = read(s,1,"uint8");
lsb = read(s,1,"uint8");
val2 = bin2dec(strcat(dec2bin(msb,8),dec2bin(lsb,8)));

toc