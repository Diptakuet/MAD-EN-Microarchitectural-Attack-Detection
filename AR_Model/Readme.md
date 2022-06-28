The name of each directory corresponds to the number of samples per measurement for which the AR model is created and tested. Within each directory, corresponding data and different ML-based AD models can be found. As an example the directory refers to the 3000 samples are explained below:

- ### [3000/Data](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/tree/main/AR_Model/3000/Data): 
  * X_train.csv: Input energy trace data used for training the AR model. Each row refers to the 3000 samples of individual measurements (Size: 600x3000).
  * Y_train.csv: Output labels of X_train (15 categories).
  * X_validation.csv: Input energy trace data used for validation in the offline phase. Each row refers to the 3000 samples of individual measurements (Size: 150x3000).
  * X_test.csv: Input energy trace data used for testing the AD model in the online phase. Each row refers to the 3000 samples of individual measurements (Size: 150x3000).
  * Y_test.csv: Output labels of X_test (15 categories)
- ### ML-based AD Models
  * [CNN_1D](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/blob/main/AR_Model/3000/CNN_1D.py): The CNN-based AD model used in the offline phase. The model is saved and utilized later in the online phase.
  * [Restored_model_test.py]([https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/blob/main/AR_Model/3000/Restored_model_test.py): The pretrained CNN model used in the online phase to determine the performance with the test data.
  * [Support Vector Machine (SVM)](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/blob/main/AR_Model/3000/svm.py): SVM-based AD model to compare the performance with the other ML-based models.
  * [K-th Nearest Neighbor (KNN)](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/blob/main/AR_Model/3000/knn.py): KNN-based AD model to compare the performance with the other ML-based models.
  * [Random Forest (RF)](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/blob/main/AR_Model/3000/rf.py): RF-based AD model to compare the performance with the other ML-based models.
  * [Gradient Boosting (GB)](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/blob/main/AR_Model/3000/GB.py): GB-based AD model to compare the performance with the other ML-based models.
