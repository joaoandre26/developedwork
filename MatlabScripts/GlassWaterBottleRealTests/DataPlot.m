clear all
close all
clc
%%
Test1Path = "C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\RealTestsGlassBottle\1stTest\Results\MatLabCalc.txt"; %%This path is OutOf date
Test2Path = "C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\RealTestsGlassBottle\2ndTest_fs4000\Results\MatLabCalc.txt"; %%This path is OutOf date
Test3Path = "C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\RealTestsGlassBottle\3rdTest_fs8000\Results\MatLabCalc.txt"; %%This path is OutOf date
Test4Path = "C:\Users\JoaoAndre\Documents\masterthesis\signalsAndData\RealTestsGlassBottle\4thTest_fs44100\Results\MatLabCalc.txt"; %%This path is OutOf date

data1 = csvread(Test1Path);
data2 = csvread(Test2Path);
data3 = csvread(Test3Path);
data4 = csvread(Test4Path);

liquidLevel = 0:0.25:18*0.25-0.25;
t = figure(1);
plot(liquidLevel, data1);
hold on
plot(liquidLevel,data2);
plot(liquidLevel,data3);
plot(liquidLevel,data4);
title('Frequency vs Liquid Level');
xlabel('Liquid Level (L)');
ylabel('Frequency(Hz)');
legend('Fs = 4kHz', 'Fs = 4kHz', 'Fs = 8kHz', 'Fs = 44.1kHz');
axis([0 4.25 800 2400]);

exportgraphics(t, 'plot.eps')
