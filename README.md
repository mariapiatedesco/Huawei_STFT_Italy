# Huawei Seeds For The Future 2022 (Italy Group G)

### Group members 
Luca Subitoni, Manuel Guatto, Lara Cugno Parrotta, Mariapia Tedesco, Leonardo Brugnano, Giulio Conca, Emanuele Mori, Marco Petix, Matteo Rocco

<p align="center">
<img width="835" alt="Full model" src="https://user-images.githubusercontent.com/69035483/196909217-7ef747fb-ddac-471a-801f-0eb21a5cfc64.png">
</p>

### Deep Learning Model for Alarm Classification

- Description: The Jupyter Notebook in this repository contains a proof of concept deep learning model that tries to predict whether an alarm produced by a ICU (Intensive Care Unit) monitor is True or False by using the 60 second timeseries recorded before the alarm started ringing.

- Dataset: The dataset was downloaded from PhysioNet database: https://physionet.org/content/challenge-2015/1.0.0/.
It was then processed and simplified for this demo in the Jupyter Notebook.

- Model: The model contains a convolutional neural network with a final dense layer. It was developed on Kaggle (for better GPU performance) using Tensorflow Keras. The hyperparameters of the model were optimized using the Optuna framework.

### Indoor Tracking Localization Algorithm

- Description: The Matlab file contains the code of the decentralized position estimation algorithm. This solution helps us in tracking the nurses and the patients in the ICU unit without using the GPS technology.

- Dataset: We start the simulation of the algorithm setting up 25 "agents" , 5 nurses and 20 patients. Moreover the movements of the nurses are simulated accordingly to a random walk.

- Model: The algorithm is based on the sharing of the distance measurements between that every agent computes w.r.t. the other ones. This lets the algorithm build a map of all the agents' position that is no absolute reference frame dependent.

<p align="center">
https://user-images.githubusercontent.com/69035483/196029758-e492c84b-8199-4592-a173-5d709c4c4f3e.mp4
</p>
