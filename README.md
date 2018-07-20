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
`pa = PowerAmplifier(order, memory_depth);`

The inputs should be as follows:
  `order`: The order of the PA model. This must be odd.
  `memory_depth`: Number of memory taps in the PA model. 
  
To send something through the PA model, simply use the transmit method, `rx_Data = pa.transmit(tx_Data)`. 

Checkout the example.m to see more. 
              
