# XiPi toolbox

[shiang Hu](https://github.com/ShiangHu), [zhihao Zhang](https://github.com/annie-jpg), [BRAIT-LAB](https://shianghu.github.io/lab)

[[`Paper`]()] [[`Biorxiv`]()]

The **XiPi(ξ-π) alorithm** separate periodic and aperiodic neural activity. It work in the spectral domain, like FOOOF,IRASA,SpriNt etc.

<p float="left">
  <img src="assets/Structure.png?raw=true" width="37.25%" />
  <img src="assets/sample.png?raw=true" width="61.5%" /> 
</p>

## Installation

The code requires `matlab enviroment`. If you want to compare it with FOOOF, you also need to install `FOOOF`[here](https://fooof-tools.github.io/fooof/index.html).

Install XiPi(ξ-π)
```
git clone https://github.com/annie-jpg/XiPeaks-study
```

Add `XiPi_toolbox` directory into your matlab 
```
cd $home/XiPeaks-study; addpath(genpath("XiPi_toolbox"))
```

## Quick Start
The `XiPi` work in the spectral domain. You should calculate the spectral first through power spectrum density estimation method[Welch,Multitaper].
Using matlab command `doc pwelch` to check, or function `xp_calculateSpec`(see later).

Then, using the core function :
```
[psd_ftd,components] = scmem_unim(freq,spt,[0 0 0]);
```

Now, you have separate a aperiodic component and some periodic components. `psd_ftd` represents the sum of all components, and `components` [column 1] represents the AC, [other column] represent the PCs.

## Expansion

## Parameter settings

## Prospect and application

## Contributing

## Contributors

## Acknowledgements