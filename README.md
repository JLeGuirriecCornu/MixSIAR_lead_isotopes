# MixSIAR_lead_isotopes
Replication code for First Geochemical evidence of metal import from the Gaul interior to Marseille (southeastern France) during the late Antiquity
1,2 Le Guirriec-Cornu, J., 1 Veron, A., 1 Sogno, V., 1 Guihou, A., 1 Fekiacova, Z., 1 Deschamps, P., 1 Gassier, G.

1 Aix Marseille Univ, CNRS, IRD, INRAE, CEREGE, Aix-en-Provence, France 
2 IAUB, Universitat de Barcelona, Institut d'Arqueologica, Montalegre 6-8, Soterrani 08001 Barcelona, Spain.

## Installation

In a conda environment, install jags and r-rjags :
```
conda create --name <ENV_NAME> r-base r-essentials rstudio
conda activate <ENV_NAME>
conda install jags
conda install r-rjags
```

Launch r-studio from within the environment, and open ReplicationCode.Rproj

Install the required r packages :
```
install.packages("here")
install.packages("MixSIAR")
install.packages("ggplot2")
install.packages("gridExtra")
```
## Description
The main code is the file mixsiar_model.R it reads and executes the content of three other files :
- model_config.R : where the model options are set, that should be modified by the user
- model_preload.R : that reads the user data and formats it properly, and creates the result directory
- modifiedMIXSIAR.R : modified code from the original R package MixSIAR, with simpler plot support

## Usage
Source the main file mixsiar_model.R. With default parameters, it should create a test set with dummy results.
If everything is working, change the chain length to extreme and execute the main file again
