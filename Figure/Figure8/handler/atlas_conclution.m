clc;clear;close all;

% 使用atlas论文中的结论印证
cmap = parula(8);

% Cuneus
X = categorical({'ξ-π','FOOOF'});X = reordercats(X,{'ξ-π','FOOOF'});
Y = [63.16 57.9];
b = bar(X,Y,0.3,'EdgeColor','w');
b.FaceColor = 'flat';
b.CData(1,:) = cmap(5, :);
b.CData(2,:) = cmap(7, :);
hold on
plot(X,[68 68],'--','color','red')
title('Cuneus - α peak')
ylabel('Proportion(%)')
ylim([30 100])
set(gca,'FontName','Arial','fontWeight','bold','fontSize',20)

% Hippocampus
X = categorical({'ξ-π','FOOOF'});X = reordercats(X,{'ξ-π','FOOOF'});
Y = [69.4 63.9];
b = bar(X,Y,0.3,'EdgeColor','w');
b.FaceColor = 'flat';
b.CData(1,:) = cmap(5, :);
b.CData(2,:) = cmap(7, :);
hold on
plot(X,[72 72],'--')
title('Hippocampus - δ peak')
ylabel('Proportion(%)')
ylim([30 100])
set(gca,'FontName','Arial','fontWeight','bold','fontSize',20)

% OFG
X = categorical({'ξ-π','FOOOF'});X = reordercats(X,{'ξ-π','FOOOF'});
Y = [55.26 100];
b = bar(X,Y,0.3,'EdgeColor','w');
b.FaceColor = 'flat';
b.CData(1,:) = cmap(5, :);
b.CData(2,:) = cmap(7, :);
hold on
plot(X,[72 72],'--')
title('OFG - β peak')
ylabel('Proportion(%)')
ylim([30 100])
set(gca,'FontName','Arial','fontWeight','bold','fontSize',20)

% Precentral
X = categorical({'ξ-π','FOOOF'});X = reordercats(X,{'ξ-π','FOOOF'});
Y = [67.48 96.74];
b = bar(X,Y,0.3,'EdgeColor','w');
b.FaceColor = 'flat';
b.CData(1,:) = cmap(5, :);
b.CData(2,:) = cmap(7, :);
hold on
plot(X,[64 64],'--')
title('Precentral gyrus - β peak')
ylabel('Proportion(%)')
ylim([30 100])
set(gca,'FontName','Arial','fontWeight','bold','fontSize',20)