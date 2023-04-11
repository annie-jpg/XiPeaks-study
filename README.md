# XiPi toolbox

[shiang Hu](https://github.com/ShiangHu), [zhihao Zhang](https://github.com/annie-jpg), [BRAIT-LAB](https://shianghu.github.io/lab)

[[`Paper`]()] [[`Biorxiv`]()]

The **XiPi(ξ-π) alorithm** separate periodic and aperiodic neural activity **using nonparametric model**. It work in the spectral domain, like FOOOF,IRASA,SpriNt etc.

<p align="center">
  <img src="assets/Structure.png?raw=true"/>
</p>
<p align="center">
  The structure of this study
</p>

## Installation

The code requires `matlab enviroment`. If you want to compare it with FOOOF, you also need to install `FOOOF`[here](https://fooof-tools.github.io/fooof/index.html).

Install XiPi (ξ-π)
```
git clone https://github.com/annie-jpg/XiPeaks-study
```

Add `XiPi_toolbox` directory into your matlab 
```
cd $home/XiPeaks-study; addpath(genpath("XiPi_toolbox"))
```

## Quick Start
The `XiPi` work in the spectral domain. You should calculate the spectral first through power spectrum density estimation method[Welch,Multitaper]. <br>
Using matlab command `doc pwelch` to check, or function `xp_calculateSpec`(see later).

Then, using the core function :
```
[psd_ftd,components] = scmem_unim(freq,spt,[0 0 0]);
```

Now, you have separate a aperiodic component and some periodic components. `psd_ftd` represents the sum of all components, and `components` [column 1] represents the AC, [other column] represent the PCs.

## Parameter settings
For `scmem_unim` function, you can set some parameters to limit the peak fitting. According to your datasets, you can set it empirically.
If the peak setting is null, we tend to set default for you.<br>
The peak setting includes: <br>
`peak_min_width`: The peak whose bandwidth < `peak_min_width` will be not found.
`peak_min_value`: The peak whose power < `peak_min_value` will be not found.
`peak_num_limt`: The number of peak detection will <= `peak_num_limt`

## Expansion
For convenience, we provide additional function, including <br>
[import data `xp_importdata`] <br>
[calculate PSD `xp_calculateSpec`]<br>
[batch excute ξ-π `xp_separateSpec`]<br>
[parameterization `xp_parameterize`]

```
XiPi = xp_importdata([]) % import data.
XiPi = xp_calculateSpec(XiPi,[1 30],50,'select_chan',[1 2])  % calculate spectral in channel 1,2 and 1-30s.
XiPi = xp_separateSepc(XiPi)  % using ξ-π to separate neural PSD.
XiPi = xp_parameterize(XiPi)  % using power-law function and Gaussian function [defalut] to parameterize components.
```
Please use `doc` command to check more function parameter input.

## Prospect and application
The ξ-π algorithm can be:
* extended to time-frequency analysis.
* extended to multivariable cross spectrum.
* applied to obtain oscillation features and predict age, disorder etc.
* applied to eliminate the impact of aperiodic component.

## Contributing


## Contributors
shiang Hu, zhihao Zhang, jie Ruan, Pedro A. Valdes-Sosa

## Acknowledgements
This work was supported by the NSFC Project Number 62101003. 