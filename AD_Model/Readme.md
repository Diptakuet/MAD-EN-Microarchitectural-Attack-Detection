# AD Model
The performance of the AD model is tested with different numbers of samples. One of the key characteristics of micro-architectural attacks is their speed
of operation. These attacks can steal useful information or secret keys within a short time frame. Hence, detecting such anomalies
as fast as possible is of utmost importance. However, faster detection mechanisms lead to the reduction of the recorded samples per measurement, considering the highest possible time
resolution for energy consumption readings are maintained. The energy consumption traces for each measurement has 3000 samples, which takes around 30 seconds to collect one complete energy trace before the anomaly classification. This leads to the question, will the AD model still be effective if the data collection time frame is reduced further?

To answer this question, the performance of the AD models is tested by decreasing the number of samples from 3000 to 500 per measurement, and a separate AD model is trained for each case. It is to be noted that decreasing the number of samples results in faster anomaly detection as we sample the Intel RAPL framework with the highest possible resolution (500μs). Thus, the 500 samples correspond to the initial 5 seconds of the energy traces. Here, the name of each directory corresponds to the number of samples per measurement for which the AD model is created and tested. Within each directory, corresponding data and different ML-based AD models can be found. As an example the directory refers to the 3000 samples are explained below:

- [3000/Data](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/tree/main/AD_Model/3000/Data): Preprocessed data split into the train, validation, and test.
  * X_train.csv: Input energy trace data used for training the AD model. Each row refers to the 3000 samples of individual measurements (Size: 2000x3000).
  * Y_train.csv: Output labels of X_train (either 0 or 1).
  * X_validation.csv: Input energy trace data used for validation in the offline phase. Each row refers to the 3000 samples of individual measurements (Size: 500x3000).
  * X_test.csv: Input energy trace data used for testing the AD model in the online phase. Each row refers to the 3000 samples of individual measurements (Size: 650x3000).
  * Y_test.csv: Output labels of X_test (either 0 or 1)
- ## ML-based AD Models
  * [CNN-offline](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/blob/main/AD_Model/3000/CNN_1D.py): The CNN-based AD model used in the offline phase. The model is saved and utilized later in the online phase.
  * [Restored_model_2500_samples_test.py](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack- Detection/blob/main/AD_Model/3000/Restored_model_3000_samples_test.py): The pretrained CNN model used in the online phase to determine the performance with the test data.
  * [Support Vector Machine (SVM)](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/blob/main/AD_Model/3000/svm.py): SVM-based AD model to compare the performance with the other ML-based models.
  * [K-th Nearest Neighbor (KNN)](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/blob/main/AD_Model/3000/knn.py): KNN-based AD model to compare the performance with the other ML-based models.
  * [Random Forest (RF)](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/blob/main/AD_Model/3000/rf.py): RF-based AD model to compare the performance with the other ML-based models.
  * [Gradient Boosting (GB)](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/blob/main/AD_Model/3000/GB.py): GB-based AD model to compare the performance with the other ML-based models.












