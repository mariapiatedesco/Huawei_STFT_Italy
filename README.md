# 🌱 Huawei Seeds For The Future 2022 (Italy)

### 👩‍💻 **Group Members** 
Luca Subitoni | Manuel Guatto | Lara Cugno Parrotta | Mariapia Tedesco | Giulio Conca | Emanuele Mori | Marco Petix | Matteo Rocco

---

### Our product

<p align="center">
   <img src="https://user-images.githubusercontent.com/69035483/210620086-01ca8806-3d31-4dc3-8169-02a65c315500.png" width="400"/>
</p>

---

## 🚨 **Deep Learning Model for Alarm Classification**

### 📝 **Description**
This repository contains a proof-of-concept **Deep Learning Model** designed to classify ICU (Intensive Care Unit) monitor alarms as either **True** or **False**, based on the 60-second time series recorded before the alarm rings.

### 📊 **Dataset**
- The dataset was sourced from the [PhysioNet database](https://physionet.org/content/challenge-2015/1.0.0/) and preprocessed for this project.
- Final dataset size: **572 instances**.

### 🧠 **Model**
- **Initial Model**:
  - Built using a **Convolutional Neural Network (CNN)** with a final dense layer.
  - Developed in Kaggle for GPU optimization with **TensorFlow Keras**.
  - Hyperparameters were fine-tuned using the **Optuna framework**.
  - Achieved **75% accuracy**.
- **Improved Model**:
  - Enhanced using **frequency analysis**, **LDA**, and a **Multilayer Perceptron (MLP)** in **Scikit-learn**.
  - Achieved an improved accuracy of **83%**.

---

## 📍 **Indoor Tracking Localization Algorithm**

### 📝 **Description**
This solution, implemented in **MATLAB**, offers a distributed localization algorithm that tracks the movements of nurses and patients within an ICU unit—**without relying on GPS technology**.

### 📊 **Dataset**
- Simulated environment with:
  - **25 agents**: 5 nurses and 20 patients.
  - Nurse movements are simulated using a **random walk** model.

### 🔧 **Model**
- The algorithm relies on the **sharing of distance measurements** between agents.
- Builds a map of all agent positions, independent of any absolute reference frame.

### 🎥 **Demo Video**
https://user-images.githubusercontent.com/69035483/196029758-e492c84b-8199-4592-a173-5d709c4c4f3e.mp4

---

## 🌟 Canva Presentation
Check out our detailed project presentation on Canva:  
[🔗 View Presentation](https://www.canva.com/design/DAFO7tOwF6c/0VKjXy5-2Udag3qcTWzXKg/edit)

---

## 🌐 **Website**
Discover more about our project at:  
👉 [AlarmDeck Website](https://sites.google.com/view/alarmdeck/home)
