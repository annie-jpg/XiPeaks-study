clc;clear;close all;

% 使用atlas论文中的结论印证
mycolor3 = [0.6,0.82,0.11;...
    0.2,0.6,0.9];

% Cuneus
subplot(2,2,1)
X = categorical({'ξ-π','FOOOF'});X = reordercats(X,{'ξ-π','FOOOF'});
Y = [63.16 57.9];
b = bar(X,Y,0.3,'EdgeColor','w');
b.FaceColor = 'flat';
b.CData(1,:) = mycolor3(2, :);
b.CData(2,:) = mycolor3(1, :);
hold on
plot(X,[68 68],'--')
title('Cuneus - Alpha channels')
ylabel('Proportion(%)')
ylim([30 100])
set(gca,'FontName','Arial')

% Hippocampus
subplot(2,2,2)
X = categorical({'ξ-π','FOOOF'});X = reordercats(X,{'ξ-π','FOOOF'});
Y = [69.4 63.9];
b = bar(X,Y,0.3,'EdgeColor','w');
b.FaceColor = 'flat';
b.CData(1,:) = mycolor3(2, :);
b.CData(2,:) = mycolor3(1, :);
hold on
plot(X,[72 72],'--')
title('Hippocampus - delta channels')
ylabel('Proportion(%)')
ylim([30 100])
set(gca,'FontName','Arial')

% OPG
subplot(2,2,3)
X = categorical({'ξ-π','FOOOF'});X = reordercats(X,{'ξ-π','FOOOF'});
Y = [55.26 100];
b = bar(X,Y,0.3,'EdgeColor','w');
b.FaceColor = 'flat';
b.CData(1,:) = mycolor3(2, :);
b.CData(2,:) = mycolor3(1, :);
hold on
plot(X,[72 72],'--')
title('OPG - beta channels')
ylabel('Proportion(%)')
ylim([30 100])
set(gca,'FontName','Arial')

% Precentral
subplot(2,2,4)
X = categorical({'ξ-π','FOOOF'});X = reordercats(X,{'ξ-π','FOOOF'});
Y = [67.48 96.74];
b = bar(X,Y,0.3,'EdgeColor','w');
b.FaceColor = 'flat';
b.CData(1,:) = mycolor3(2, :);
b.CData(2,:) = mycolor3(1, :);
hold on
plot(X,[64 64],'--')
title('Precentral - beta channels')
ylabel('Proportion(%)')
ylim([30 100])
set(gca,'FontName','Arial')