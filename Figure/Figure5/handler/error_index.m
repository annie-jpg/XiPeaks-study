clc;clear;close all;

% 一类错误、二类错误的条形统计图
% TP TN FN FP
load standard.mat peakNums
load  FOF_results.mat FOF_peaks_num
load  XiPi_results.mat XiPi_peaks_num

[F_TP,F_TN,F_FN,F_FP] = getErrorIndex(peakNums,FOF_peaks_num);
[X_TP,X_TN,X_FN,X_FP] = getErrorIndex(peakNums,XiPi_peaks_num);

% 准确率
F_accuracy = F_TP / 100;
X_accuracy = X_TP / 100;

% 查准率
F_precision = F_TP / (F_TP+F_FP);
X_precision = X_TP / (X_TP+X_FP);

% 查全率
F_recall = F_TP / (F_TP+F_FN);
X_recall = X_TP / (X_TP+X_FN);

% F1-score
F_F1 = 2 * F_TP / (2*F_TP + F_FP + F_FN);
X_F1 = 2 * X_TP / (2*X_TP + X_FP + X_FN);

% plot 
bp = BarPlot('ylabel', 'Performence Index(%)');
cmap = parula(8);

% create the first group of 2 bars
g = bp.addGroup('Accuarcy');
g.addBar('ξ-π', X_accuracy*100, 'FaceColor', 'r');
g.addBar('FOOOF', F_accuracy*100, 'FaceColor', cmap(2, :));
g = bp.addGroup('Precision');
g.addBar('ξ-π', X_precision*100, 'FaceColor', 'r');
g.addBar('FOOOF', F_precision*100, 'FaceColor', cmap(2, :));
g = bp.addGroup('Recall');
g.addBar('ξ-π', X_recall*100, 'FaceColor', 'r');
g.addBar('FOOOF', F_recall*100, 'FaceColor', cmap(2, :));
g = bp.addGroup('F1 Score');
g.addBar('ξ-π', X_F1*100, 'FaceColor', 'r');
g.addBar('FOOOF', F_F1*100, 'FaceColor', cmap(2, :));

bp.render();

title('The performence evalution of peak detection')

function [TP,TN,FN,FP] = getErrorIndex(real,fit)
    t = fit - real;
    FN = 0; FP = 0;
    for i = 1 : length(t)
        if t(i) > 0
            FP = FP + 1;
        end
        if t(i) < 0
            FN = FN + 1;
        end
    end
    TP = length(t) - FP - FN;
    TN = TP;
end