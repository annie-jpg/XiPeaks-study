load IEEG1772_data.mat Data_W
[pxx,f] = pwelch(Data_W',hamming(400),200,400,156.24); 
pxx = pxx(2:129,:); f = f(2:129);
for i = 1:1772
    plot(f,pxx(:,i),'linewidth',3)
    title(i)
    pause
end

% 134  224  324  345  470  485  /  重叠 61 176 151
load IEEG1772_data.mat 
data = Data_W(ChannelRegion==29,:);
[pxx,f] = pwelch(data',hamming(400),200,400,156.24); 
for i = 1:123
   plot(f,pxx(:,i),'linewidth',3)
    title(i)
    pause
end

for i = 1:100
    plot(f(2:101),CC(i,2:101),'linewidth',3)
    title(i)
    pause
end


for i = 1:100
    plot(f(2:101),no_peak_set_N(i,2:101),'linewidth',3)
    title(i)
    pause
end

[pxx,f] = pwelch(Data_W(1,:),hamming(400),200,400,200); 