clc;clear;close all;
% 用两种算法谱分解，并计算指标(MSE，number of peaks ...)

load standard.mat

% 0.5-50Hz
AC = AC(:,2:101); CC = CC(:,2:101); PC = PC(:,2:101); freq = f(2:101);

% XiPi
XiPi_PC = [];
XiPi_AC = [];
XiPi_peaks_num = zeros(100,1);
for i = 1 : size(CC,1)
    [psd_ftd,components] = scmem_unim(freq,CC(i,:)',[0 0 0]);
    XiPi_PC = [XiPi_PC;(psd_ftd-components(:,1))'];
    XiPi_AC = [XiPi_AC;components(:,1)'];
    XiPi_peaks_num(i) = size(components,2)-1;
end

save XiPi_results.mat XiPi_PC XiPi_AC XiPi_peaks_num

% FOF
FOF_PC = [];
FOF_AC = [];
FOF_peaks_num = zeros(100,1);
settings = struct('peak_width_limits',[1 10]);
for i = 1 : size(CC,1)
    fooof_results = fooof(freq,CC(i,:),[0 50], settings, 1);
    FOF_PC = [FOF_PC;10.^fooof_results.fooofed_spectrum - 10.^fooof_results.ap_fit];
    FOF_AC = [FOF_AC;10.^fooof_results.ap_fit];
    FOF_peaks_num(i) = size(fooof_results.peak_params,1);
end

save FOF_results.mat FOF_PC FOF_AC FOF_peaks_num