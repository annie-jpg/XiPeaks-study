clc;clear;close all;
% 定性分析，视觉分析。
load no_peak_set.mat
load irasa324.mat

% 模拟1
% 1. 从IEEG数据集中挑选带有形状怪异峰的谱，用IRASA去除非周期成分获得 PC
freq = f(2:101);
pc = irasa_original_spec(1:100);
pc(pc < 0) = 0;  pc(1:30) = 0; pc = pc*8;

% 2. 从无峰集中选取一个，作为AC
ac = no_peak_set(11,:);
ac = ac./2; % 缩放
ac = ac(2:101);

% 3. 混合PC和AC 谱
cc = ac + pc;
plot(freq,cc,'linewidth',3,'color','black')
set(gca,'fontName','Arial','fontSize',14,'fontWeight','bold')
xlabel('freq/Hz'); ylabel('Power')
hold on
plot(freq,pc,'linewidth',3,'color','r')
set(gca,'fontName','Arial','fontSize',14,'fontWeight','bold')
xlabel('freq/Hz'); ylabel('Power')
plot(freq,ac,'linewidth',3,'color','blue')
set(gca,'fontName','Arial','fontSize',14,'fontWeight','bold')
xlabel('freq/Hz'); ylabel('Power')
% ylim([0 20])

save groudtruth_324.mat ac pc cc
% 4. 使用两种算法分解谱，并展示AC和PC与ground truth的比较
% compare.m