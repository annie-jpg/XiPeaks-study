plot(freq,psd_real,'linewidth',4,'color','black')
set(gca,'fontName','Arial','fontSize',14,'Box','off','fontWeight','bold','xtick',[],'ytick',[])
hold on
plot(freq,sigk_ini(:,1),'linewidth',3,'color','#EDB120')
plot(freq,sigk_ini(:,2),'linewidth',3,'color','green')
plot(freq,sigk_ini(:,3),'linewidth',3,'color','blue')
plot(freq,sigk_ini(:,4),'linewidth',3,'color','#4DBEEE')