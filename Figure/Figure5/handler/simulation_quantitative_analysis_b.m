clc;clear;close all;
% 定量分析，计算指标  通过band划分
load no_peak_set.mat

% 模拟  - 100次

% 1. 从无峰集中随机选取一个，作为AC
x = randi(33,1,100);
% x = zeros(1,100) + 11;
AC = no_peak_set(x,:);

% 2. 随机选择若干正弦波， 随机位置，随机power
fs = 200; N = 13600;
n=0:N-1; t = n/fs;

PC = [];
peakNums = zeros(1,100);
A = [8 13;5 6;15 30;1 1;31 42];
B = [4;3;3;7;2];

peakMap = zeros(50,100);  % freq * sample
for i = 1:100
    ac = AC(i,:);
    pc = zeros(1,13600);
    peakNum = randi(6,1,1)-1; % 0-5
    
    % 设置中心频率
    CF = zeros(1,peakNum);
    for j = 1:peakNum
        CF(j) = randi(A(j,:));
    end
    peakMap(CF,i) = 1;
    
    % 设置Power
%     PW = rand(1,peakNum)*2-1 + p(x(i));
    for j = 1:peakNum
        PW(j) = B(j)+p(x(i)) + rand(1,1)*2-1;  % B +- 1
    end
    
    for j = 1:peakNum
        pc = pc + PW(j) * sin(2 * pi * CF(j) * t);
    end
    [pxx,f] = pwelch(pc,hamming(400),200,400,200); 
    PC = [PC;pxx'];
    peakNums(i) = peakNum;
end

% 3. 混合AC PC -> CC
CC = AC + PC;

save standard.mat CC AC PC peakNums peakMap