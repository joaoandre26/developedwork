clear all
close all
clc
%% uC Plots Results
% Path to Data

StimPath = ['AcCiMa\';'AcImMa\'];
% StimPath = ['Ma\'];
MeasPath = ['BotMid\';'TopMid\']; 
BottlePath = ['Full\';'Half\';'Empt\'];

svPath = 'E:\ResultsThesis\NResults28_04_2021\';

matPath = 'MatLabDataResults\';
uCPath = 'uCDataResults\';

procType = ['Sing\';'Sums\'];

filesPath = strcat(svPath,uCPath, procType(1,:));

for S=1:(length(StimPath(:,1))-1)
    for M=1:(length(MeasPath(:,1))-1)
        for B=1:length(BottlePath(:,1))
            file = strcat(StimPath(S,:),MeasPath(M,:),BottlePath(B,:));
            fileName = strcat(erase(file,'\'), '.txt');
            dataPath = strcat(filesPath,fileName);
            data = csvread(dataPath);
            
            figure(1)
            scatter(B*ones(length(data(:,1)),1),data(:,1));
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
            scatter(B*ones(length(data(:,2)),1),data(:,2));
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
            scatter(B*ones(length(data(:,3)),1),data(:,3));
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
        exportgraphics(gph1,'domID.pdf');
        exportgraphics(gph2,'fID.pdf');
        exportgraphics(gph3,'mID.pdf')
    end
end
