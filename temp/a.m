settings =  struct('peak_width_limits', [1, 3]);
fooof_results = fooof(freq(2:end),spt(2:end), [0 50], settings, 1);

plot(fooof_results.freqs,10.^fooof_results.power_spectrum)
hold on
plot(fooof_results.freqs,10.^fooof_results.ap_fit)
plot(fooof_results.freqs,10.^fooof_results.fooofed_spectrum)
ylim([0 250])