# Huawei Seeds For The Future (Italy Group G)

### Group members 
Luca Subitoni, Manuel Guatto, Lara Cugno Parrotta, Maria Pia Tedesco, Leonardo Brugnano, Giulio Conca, Emanuele Mori, Marco Petix, Matteo Rocco

### Description
The Jupyter Notebook in this repository contains a proof of concept deep learning model that tries to predict whether an alarm produced by a ICU (Intensive Care Unit) monitor is True or False by using the 60 second timeseries recorded before the alarm started ringing.

### Dataset
The dataset was downloaded from PhysioNet database: https://physionet.org/content/challenge-2015/1.0.0/
It was then processed and simplified for this demo in the Jupyter Notebook

### Model 
The model contains a convolutional neural network with a final danse layer. It has been developed on Kaggle (for better GPU performance) using Tensorflow Keras. The hyperparameters of the model were optimized using the Optuna framework.

