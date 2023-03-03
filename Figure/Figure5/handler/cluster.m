clc;clear;close all;
% 聚类，以获得无峰集

load IEEG_spec.mat

% normalization
pxx = pxx';
pxxN = pxx./max(pxx,[],2);
clust = kmeans(pxxN,3);

[silh3,h] = silhouette(pxxN,clust);
xlabel('Silhouette Value')
ylabel('Cluster')
