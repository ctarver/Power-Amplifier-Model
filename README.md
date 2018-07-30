# Power Amplifier Model
This is a power amplifier model class for MATLAB. It is loaded with a parallel hammerstein model of a WARP board. This class allows the user to transmit through the PA model, or retrain the model given an input and output signal.

### How to install this: 
#### Option 1: Add PowerAmplifier.m to the path:
Download this repo. Put the PowerAmplifier.m in the folder of your project or in any folder that is in the Matlab path. Then proceed to use the class to use the provided PA model or train a new model. 

#### Option 2: Add as a submodule in your git project:
If you already are using git with your project, you can use this as a submodule. In the main directory of your project, run
```
git submodule add https://github.com/ctarver/Power-Amplifier-Model.git
git submodule update --init --recursive
```
This repo should show up in your project. Then just commit the new submodule to your project like you would commit anything. 
To use the class, you still need to add the PowerAmplifier.m to your Matlab path.
```addpath(genpath(Power-Amplifier-Model))```

### How to use the PowerAmplifier class:
Initialize with:
`pa = PowerAmplifier(params);`

The input params  should be as follows:
  - `params.order`: Odd, positive integer that is the highest nonlinear, polynomial term considered in the model. 
  - `params.memory_depth`: Integer that represents the number of taps in the filters that model the memory effects. 
  - `params.noise_variance`: Small, decimal value that is an additional gaussian noise added to the PA output to be more realistic. Like thermal noise.  
  - `params.add_lo_leakage`: Boolean flag to add a constant to model local oscillator leakage.
  - `params.add_iq_imbalance`: Boolean flag to add IQ imbalance. The actual severeity of the imbalance can be modified in the class constructor. 
  
To send something through the PA model, simply use the transmit method, `rx_Data = pa.transmit(tx_Data)`. 

Checkout the example.m to see more. 
