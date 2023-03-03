clc;clear;close all;
% 算法流程示意图  [debug]
load process_data.mat freq spt

freq = freq(2:257); spt = spt(2:257);

% a. Noralization
sptN = spt./max(spt);
plot(freq,sptN,'linewidth',4,'color','black')
set(gca,'fontName','Arial','fontSize',14,'Box','off','fontWeight','bold')

% b. PC detection
[pks,fma,fw] = findpeaks(sptN,freq,'minpeakwidth',0.9,'minpeakheight',0.07,'minpeakprominence',0.025);
[vlys,fmi] = findpeaks(-sptN,freq,'minpeakwidth',0.85,'minpeakheight',-0.8,'minpeakprominence',0.025,'npeaks',length(pks));

plot(freq,sptN,'linewidth',4,'color','black')
set(gca,'fontName','Arial','fontSize',14,'Box','off','fontWeight','bold','xtick',[],'ytick',[])
hold on
plot(fma,pks,'v','linewidth',4,'markerfacecolor','r');
plot(fmi,-vlys,'^','linewidth',4,'markerfacecolor','blue','MarkerEdgeColor','blue');
legend({'Spectrum','Peaks','Valleys'});

% c. initialfit fit
plot(freq,psd_real,'linewidth',4,'color','black')
set(gca,'fontName','Arial','fontSize',14,'Box','off','fontWeight','bold','xtick',[],'ytick',[])
hold on
plot(freq,sigk_ini(:,1),'linewidth',3,'color','#EDB120')
plot(freq,sigk_ini(:,2),'linewidth',3,'color','green')
plot(freq,sigk_ini(:,3),'linewidth',3,'color','blue')
plot(freq,sigk_ini(:,4),'linewidth',3,'color','#4DBEEE')

% d. E step
plot(freq,psd_real,'linewidth',4,'color','black')
set(gca,'fontName','Arial','fontSize',14,'Box','off','fontWeight','bold','xtick',[],'ytick',[])
hold on
plot(freq,sigk_sdo(:,1),'linewidth',3,'color','#EDB120')
plot(freq,sigk_sdo(:,2),'linewidth',3,'color','green')
plot(freq,sigk_sdo(:,3),'linewidth',3,'color','blue')
plot(freq,sigk_sdo(:,4),'linewidth',3,'color','#4DBEEE')


% e. M step
plot(freq,sigk_sdo(:,1),'linewidth',3,'color','#EDB120','LineStyle','--')
set(gca,'fontName','Arial','fontSize',14,'Box','off','fontWeight','bold','xtick',[],'ytick',[])
hold on
plot(freq,sigk_up(:,1),'linewidth',1,'color','red')

% f. end of fitting
plot(freq,spt,'linewidth',4,'color','black')
set(gca,'fontName','Arial','fontSize',14,'Box','off','fontWeight','bold','xtick',[],'ytick',[])
hold on
plot(freq,components(:,1),'linewidth',3,'color','#EDB120')
plot(freq,components(:,2),'linewidth',3,'color','green')
plot(freq,components(:,3),'linewidth',3,'color','blue')
plot(freq,components(:,4),'linewidth',3,'color','#4DBEEE')

% [psd_ftd,components] = scmem_unim(freq,spt,[0 0 0]);