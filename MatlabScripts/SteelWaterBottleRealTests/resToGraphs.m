clear all
close all
clc
%% uC Plots Results
% Path to Data

StimPath = ['AcCiMa\';'AcImMa\'];
% StimPath = ['Ma\'];
MeasPath = ['BotMid\';'TopMid\']; 
BottlePath = ['Full\';'Half\';'Empt\'];

svPath = 'E:\ResultsThesis\NResults18_05_2021\';

matPath = 'MatLabDataResults\';
uCPath = 'uCDataResults\';

procType = ['Sing\';'Sums\'];

filesPath = strcat(svPath,uCPath, procType(1,:));

for S=1:(length(StimPath(:,1))-0)
    for M=1:(length(MeasPath(:,1))-0)
        figure(1)
        figure(2)
        figure(3)
%         pause(4)
        for B=1:length(BottlePath(:,1))
            file = strcat(StimPath(S,:),MeasPath(M,:),BottlePath(B,:));
            fileName = strcat(erase(file,'\'), '.txt');
            dataPath = strcat(filesPath,fileName);
            data = csvread(dataPath);
            
            figure(1)
            if B==1
                scatter(B*ones(length(data(:,1)),1),data(:,1), 'b');
            elseif B==2
                scatter(B*ones(length(data(:,1)),1),data(:,1), 'k');
            elseif B==3
                scatter(B*ones(length(data(:,1)),1),data(:,1), 'r');
            end
            axis padded
            xticks([0 1 2 3 4]);
            xticklabels({' ',BottlePath(1,1:end-1),BottlePath(2,1:end-1),BottlePath(3,1:end-1),' '});
            hold on
            grid on
            title('Dominant ID');
            xlabel('Bottle');
            ylabel('IDs');
            gph1 = gca;
            figure(2)
            if B==1
                scatter(B*ones(length(data(:,2)),1),data(:,2), 'b');
            elseif B==2
                scatter(B*ones(length(data(:,2)),1),data(:,2), 'k');
            elseif B==3
                scatter(B*ones(length(data(:,2)),1),data(:,2), 'r');
            end
            axis padded
            xticks([0 1 2 3 4]);
            xticklabels({' ',BottlePath(1,1:end-1),BottlePath(2,1:end-1),BottlePath(3,1:end-1),' '});
            hold on
            grid on
            title('First ID');
            xlabel('Bottle');
            ylabel('IDs');
            gph2 = gca;
            figure(3)
            if B==1
                scatter(B*ones(length(data(:,3)),1),data(:,3), 'b');
            elseif B==2
                scatter(B*ones(length(data(:,3)),1),data(:,3), 'k');
            elseif B==3
                scatter(B*ones(length(data(:,3)),1),data(:,3), 'r');
            end
            axis padded
            xticks([0 1 2 3 4]);
            xticklabels({' ',BottlePath(1,1:end-1),BottlePath(2,1:end-1),BottlePath(3,1:end-1),' '});
            hold on
            grid on
            title('Mean Dominant ID');
            xlabel('Bottle');
            ylabel('IDs');
            gph3 = gca;
        end
        figure(1)
        hold off
        figure(2)
        hold off
        figure(3)
        hold off
        
        exportgraphics(gph1,strcat('C:\Users\JoaoAndre\Documents\thesisImages\ResultsuCGraphs\Sen\',MeasPath(M,1:end-1),StimPath(S,1:end-1),'18_05domID.pdf'));
        exportgraphics(gph2,strcat('C:\Users\JoaoAndre\Documents\thesisImages\ResultsuCGraphs\Sen\',MeasPath(M,1:end-1),StimPath(S,1:end-1),'18_05fID.pdf'));
        exportgraphics(gph3,strcat('C:\Users\JoaoAndre\Documents\thesisImages\ResultsuCGraphs\Sen\',MeasPath(M,1:end-1),StimPath(S,1:end-1),'18_05mID.pdf'));
    end
end
