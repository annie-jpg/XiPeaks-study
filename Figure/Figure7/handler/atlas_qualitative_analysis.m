clc;clear;close all;
% IEEG atlas qualitative
load IEEG_spec.mat

% channel - 3
freq = f(2:101); cc = pxx(2:101,3);  %0.5-50Hz

%% XiPi
[psd_ftd,components] = scmem_unim(freq,cc,[0 0 0]);
plot(freq,cc,'linewidth',1.5);
hold on
plot(freq,components(:,1),'linewidth',1.5)
plot(freq,components(:,2),'linewidth',1.5)
title('ξ-π - human IEEG')
xlabel('freq/Hz')
ylabel('Power')
% legend('Original','AC','PC')
set(gca,'fontName','Arial')
ylim([0 25])

% log - log
close all;
plot(log10(freq),log10(cc),'linewidth',1.5);
hold on
plot(log10(freq),log10(components(:,1)),'linewidth',1.5)
plot(log10(freq),log10(psd_ftd),'linewidth',1.5)
% title('ξ-π - human IEEG')
xlabel('Log10(freq/Hz)')
ylabel('Log10(Power)')
% legend('Original','AC','PC')
set(gca,'fontName','Arial')

%% FOF
close all;
settings = struct('peak_width_limits',[1 8]);
fooof_results = fooof(freq,cc,[0 50], settings, 1);
plot(freq,cc,'linewidth',1.5);
hold on
plot(freq,10.^fooof_results.ap_fit,'linewidth',1.5)
plot(freq,10.^fooof_results.fooofed_spectrum - 10.^fooof_results.ap_fit,'linewidth',1.5)
title('FOOOF - human IEEG')
xlabel('freq/Hz')
ylabel('Power')
% legend('Original','AC','PC')
set(gca,'fontName','Arial')
ylim([0 25])

% log - log
close all;
plot(log10(freq),log10(cc),'linewidth',1.5);
hold on
plot(log10(freq),fooof_results.ap_fit,'linewidth',1.5)
plot(log10(freq),fooof_results.fooofed_spectrum,'linewidth',1.5)
% title('FOOOF - human IEEG')
xlabel('Log10(freq/Hz)')
ylabel('Log10(Power)')
% legend('Original','AC','PC')
set(gca,'fontName','Arial')