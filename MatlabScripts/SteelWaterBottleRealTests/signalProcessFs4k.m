close all
clear all
clc
%%
path = 'C:\Users\JoaoAndre\Documents\masterthesis\RecordedTests\OneDrive - Universidade de Aveiro\Tests29_10_2020\ResultsFs4000\';
Fs = 4000;
meas = ['a';'b';'c'];
Type = ['Empty';'Half ';'Full '];

Test = ['Test1';'Test2';'Test3'];
A = zeros(3,3,3,3);
% disp("---------------------------------------");
for m=1:3
    for n=1:3
        typePath = strcat('Z',num2str(m),meas(n));
%         disp(['------------------' typePath '------------------']);
%         disp(['         ' Type(3,:) '   ' Type(2,:) '   ' Type(1,:)]);
        for j=1:3
            for k=3:-1:1
                filePath = strcat('G', num2str(k),typePath);
                y = csvread(strcat(path,filePath,'_',num2str(j), '.txt'));
                L = length(y);
                %% Using fft
                Y = fft(y);
                P = abs(Y/L);
                P1 = P(1:L/2+1);
                P1(2:end-1) = 2*P1(2:end-1);
                f = Fs*(0:(L/2))/L;
                id = find(max(P1(:,1))==P1(:,1));   %finds the ID of the value with the highest magnitude
                domF = f(1,id);                     % returns the correposndent dominant frequency
                A(k,m,n,j)=domF;
%                 disp(['Dominant frequency: ' num2str(domF) 'Hz ----' Type(k, :) num2str(k)]);
            end
            
%             disp([Test(j,:) ' -> ' num2str(Values(3)) '  ' num2str(Values(2)) '  ' num2str(Values(1))]) 
        end
%         disp("---------------------------------------");
    end
end

%%Graphics Plots and saving
%Figure 1
graph1 = figure(1);
subplot(3,1,1)
plot([1 2 3], A(:, 1, 1, 1), 'bo');  %Empty/Half/Full Z1a
hold on;
plot([1 2 3], A(:, 1, 1, 2), 'mx');  %Empty/Half/Full Z2a
hold on;
plot([1 2 3], A(:, 1, 1, 3), 'r*');  %Empty/Half/Full Z3a
set(gca, 'Xtick', [1 2 3], 'XtickLabel', Type);
axis([0 4 400 1200]);
xlabel('Level Type');
ylabel('Frequency(Hz)');
title('Frequency vs Liquid Level( Measuring/Hitting Point - (Bottom/Bottom))');
legend({'Test 1', 'Test2', 'Test3'}, 'location', 'east');
grid on;
hold off;
subplot(3,1,2);
plot([1 2 3], A(:, 1, 2, 1), 'bo');  %Empty/Half/Full Z1a
hold on;
plot([1 2 3], A(:, 1, 2, 2), 'mx');  %Empty/Half/Full Z2a
hold on;
plot([1 2 3], A(:, 1, 2, 3), 'r*');  %Empty/Half/Full Z3a
set(gca, 'Xtick', [1 2 3], 'XtickLabel', Type);
axis([0 4 600 1750]);
xlabel('Level Type');
ylabel('Frequency(Hz)');
title('Frequency vs Liquid Level( Measuring/Hitting Point - (Bottom/Center))');
legend({'Test 1', 'Test2', 'Test3'}, 'location', 'east');
grid on;
hold off;
subplot(3,1,3)
plot([1 2 3], A(:, 1, 3, 1), 'bo');  %Empty/Half/Full Z1a
hold on;
plot([1 2 3], A(:, 1, 3, 2), 'mx');  %Empty/Half/Full Z2a
hold on;
plot([1 2 3], A(:, 1, 3, 3), 'r*');  %Empty/Half/Full Z3a
set(gca, 'Xtick', [1 2 3], 'XtickLabel', Type);
axis([0 4 600 1600]);
xlabel('Level Type');
ylabel('Frequency(Hz)');
title('Frequency vs Liquid Level( Measuring/Hitting Point - (Bottom/Top))');
legend({'Test 1', 'Test2', 'Test3'}, 'location', 'east');
grid on;    
hold off;

%Figure 2
graph2 = figure(2);
subplot(3,1,1)
plot([1 2 3], A(:, 2, 1, 1), 'bo');  %Empty/Half/Full Z1a
hold on;
plot([1 2 3], A(:, 2, 1, 2), 'mx');  %Empty/Half/Full Z2a
hold on;
plot([1 2 3], A(:, 2, 1, 3), 'r*');  %Empty/Half/Full Z3a
set(gca, 'Xtick', [1 2 3], 'XtickLabel', Type);
axis([0 4 400 1300]);
xlabel('Level Type');
ylabel('Frequency(Hz)');
title('Frequency vs Liquid Level( Measuring/Hitting Point - (Center/Bottom))');
legend({'Test 1', 'Test2', 'Test3'}, 'location', 'east');
grid on;
hold off;
subplot(3,1,2);
plot([1 2 3], A(:, 2, 2, 1), 'bo');  %Empty/Half/Full Z1a
hold on;
plot([1 2 3], A(:, 2, 2, 2), 'mx');  %Empty/Half/Full Z2a
hold on;
plot([1 2 3], A(:, 2, 2, 3), 'r*');  %Empty/Half/Full Z3a
set(gca, 'Xtick', [1 2 3], 'XtickLabel', Type);
axis([0 4 600 1400]);
xlabel('Level Type');
ylabel('Frequency(Hz)');
title('Frequency vs Liquid Level( Measuring/Hitting Point - (Center/Center))');
legend({'Test 1', 'Test2', 'Test3'}, 'location', 'east');
grid on;
hold off;
subplot(3,1,3)
plot([1 2 3], A(:, 2, 3, 1), 'bo');  %Empty/Half/Full Z1a
hold on;
plot([1 2 3], A(:, 2, 3, 2), 'mx');  %Empty/Half/Full Z2a
hold on;
plot([1 2 3], A(:, 2, 3, 3), 'r*');  %Empty/Half/Full Z3a
set(gca, 'Xtick', [1 2 3], 'XtickLabel', Type);
axis([0 4 600 1000]);
xlabel('Level Type');
ylabel('Frequency(Hz)');
title('Frequency vs Liquid Level( Measuring/Hitting Point - (Center/Top))');
legend({'Test 1', 'Test2', 'Test3'}, 'location', 'east');
grid on;    
hold off;

%Figure3
graph3 = figure(3);
subplot(3,1,1)
plot([1 2 3], A(:, 3, 1, 1), 'bo');  %Empty/Half/Full Z1a
hold on;
plot([1 2 3], A(:, 3, 1, 2), 'mx');  %Empty/Half/Full Z2a
hold on;
plot([1 2 3], A(:, 3, 1, 3), 'r*');  %Empty/Half/Full Z3a
set(gca, 'Xtick', [1 2 3], 'XtickLabel', Type);
axis([0 4 750 1600]);
xlabel('Level Type');
ylabel('Frequency(Hz)');
title('Frequency vs Liquid Level( Measuring/Hitting Point - (Top/Bottom))');
legend({'Test 1', 'Test2', 'Test3'}, 'location', 'east');
grid on;
hold off;
subplot(3,1,2);
plot([1 2 3], A(:, 3, 2, 1), 'bo');  %Empty/Half/Full Z1a
hold on;
plot([1 2 3], A(:, 3, 2, 2), 'mx');  %Empty/Half/Full Z2a
hold on;
plot([1 2 3], A(:, 3, 2, 3), 'r*');  %Empty/Half/Full Z3a
set(gca, 'Xtick', [1 2 3], 'XtickLabel', Type);
axis([0 4 600 1750]);
xlabel('Level Type');
ylabel('Frequency(Hz)');
title('Frequency vs Liquid Level( Measuring/Hitting Point - (Top/Center))');
legend({'Test 1', 'Test2', 'Test3'}, 'location', 'east');
grid on;
hold off;
subplot(3,1,3)
plot([1 2 3], A(:, 3, 3, 1), 'bo');  %Empty/Half/Full Z1a
hold on;
plot([1 2 3], A(:, 3, 3, 2), 'mx');  %Empty/Half/Full Z2a
hold on;
plot([1 2 3], A(:, 3, 3, 3), 'r*');  %Empty/Half/Full Z3a
set(gca, 'Xtick', [1 2 3], 'XtickLabel', Type);
axis([0 4 600 1400]);
xlabel('Level Type');
ylabel('Frequency(Hz)');
title('Frequency vs Liquid Level( Measuring/Hitting Point - (Top/Top))');
legend({'Test 1', 'Test2', 'Test3'}, 'location', 'east');
grid on;    
hold off;

%Saving Graphics
% exportgraphics(graph1, 'BottomMeasFs4k.eps');
% exportgraphics(graph2, 'CenterMeasFs4k.eps');
% exportgraphics(graph3, 'TopMeasFs4k.eps');