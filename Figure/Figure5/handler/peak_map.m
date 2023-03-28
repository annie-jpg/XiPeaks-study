clc;clear;close all;

% peakMap

load standard3.mat peakMap
load XiPi_results3.mat XiPi_peakMap
load FOF_results3.mat FOOOF_peakMap

%% imagesc  黄色为FP 蓝色为FN
% standrad
imagesc(peakMap)
set(gca,'fontSize',16)
xlabel('Repeated simulations')  
title('The set centering frequency')
set(gca,'fontName','Arial','ytick',[])

% XiPi
XiPi_sub = XiPi_peakMap - peakMap;
imagesc(XiPi_sub)
set(gca,'fontSize',16)
xlabel('Sample')  
ylabel('freq/Hz')
title('ξ-π')

FOOOF_sub = FOOOF_peakMap - peakMap;
imagesc(FOOOF_sub)
set(gca,'fontSize',16)
xlabel('Sample')  
ylabel('freq/Hz')
title('FOOOF')