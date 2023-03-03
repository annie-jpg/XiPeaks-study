function sigk_up = mstep_unim(sigk_sdo, freq,~)
% Separately update the fitting for each spectrum component in the M step
% using the nonlinear contrained programming solver (fmincon) and unimodal
% nonparametric fitting
% Input
% psd_real --- []
% sigk_sdo --- [nf*ank] pseudo components updated in E step
%       xs0 --- [4*15] initialized parameters in updating
% Output
%   x0_up --- updated parameters
%   sigk_up  --- updated components
% See also scmfmin_em

% Shiang Hu, Aug. 9, 2018

% initialize
ank = size(sigk_sdo,2);
sigk_up = zeros(size(sigk_sdo));

% smoothing paras
nfreq = length(freq);

for k=1:ank
    if k == 1
        prescription = slmset('plot','off','k',...
           floor(nfreq/2),'predictions',nfreq,'minvalue',0,'decreasing','on','leftvalue',sigk_sdo(1));
    else
        prescription = slmset('plot','off','k',floor(nfreq/4),...
            'predictions',nfreq,'minvalue',0,'leftmaxvalue',0);
    end

    [~,~,yp] = slmengine(freq,sigk_sdo(:,k),prescription); 
    sigk_up(:,k) = yp;
end