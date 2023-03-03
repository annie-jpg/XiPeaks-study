clc;clear;close all;
% 仿真概念图

% 1. AC
load no_peak_set.mat
ac = no_peak_set(11,:);  % channel-11
% natural 
plot(f(2:101),ac(2:101),'linewidth',3,'color','black')
set(gca,'fontName','Arial','fontSize',14,'fontWeight','bold')
xlabel('freq/Hz'); ylabel('Power')

% log
plot(log10(f(2:101)),log10(ac(2:101)),'linewidth',3,'color','black')
set(gca,'fontName','Arial','fontSize',14,'fontWeight','bold')
xlabel('Log10(freq/Hz)'); ylabel('Log10(Power)')

% no_peak_set
freq = log10(f(2:101));
dat = no_peak_set_N(:,2:101)';
dat = log10(dat);

fh=figure(1);clf;
y = (mean(dat'))';
e = (std(dat'))';
x = (1:length(y))';
h = area(freq,[y - e, 2 * e]);hold on;

set(h(1),'Visible','off');
set(h(2),'EdgeColor','white','FaceColor',[0.7,0.7,1]);
plot(freq,y,'-black','LineWidth',2);

set(gca,'fontName','Arial','fontSize',14,'fontWeight','bold','ytick',[])
xlabel('Log10(freq/Hz)'); ylabel('Log10(Power)')
%% 2. PSG仿真


%% 3. sin仿真
% fs = 200; N = 13600;
% n=0:N-1; t = n/fs;
% 
% A = [8 11 14 17 20 23 26 29 32 35 38 41 44 47];
% for i = 1:100
%     pc = zeros(1,13600);
%     peakNum = randi(6,1,1)-1; % 0-5
%     CF = A(randperm(numel(A),peakNum));
%     PW = rand(1,peakNum)*2-1 + 3; 
%     
%     for j = 1:peakNum
%         pc = pc + PW(j) * sin(2 * pi * CF(j) * t);
%     end
%     [sin_pc,f] = pwelch(pc,hamming(400),200,400,200); 
% end
load sin_pc.mat f sin_pc ac
plot(f(2:101),sin_pc(2:101),'linewidth',3,'color','black')
set(gca,'fontName','Arial','fontSize',14,'fontWeight','bold')
xlabel('freq/Hz'); ylabel('Power')

cc = ac + sin_pc';
plot(f(2:101),cc(2:101),'linewidth',3,'color','black')
set(gca,'fontName','Arial','fontSize',14,'fontWeight','bold')