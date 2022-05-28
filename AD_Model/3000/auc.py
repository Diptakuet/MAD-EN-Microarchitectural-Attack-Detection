#!/usr/bin/env python
# coding: utf-8 


''' CNN '''

import numpy as np
import pandas as pd
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import datasets, layers, models
import h5py
import os
#os.environ["CUDA_VISIBLE_DEVICES"]="-1"
from sklearn.metrics import f1_score
from sklearn.metrics import roc_auc_score
from sklearn.neighbors import KNeighborsClassifier
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.svm import SVC
from sklearn.ensemble import RandomForestClassifier
from sklearn import metrics
from sklearn.metrics import roc_curve

x_train=pd.read_csv('X_train.csv',header=None)
x_train = x_train.to_numpy()
x_test=pd.read_csv('X_test.csv',header=None)
y_test1=pd.read_csv('Y_test.csv',header=None)
x_test = x_test.to_numpy()

y_test1.columns=['y']

x_train = x_train.reshape((2000, 3000, 1)).astype("float32")
x_test = x_test.reshape(650, 3000,1).astype("float32")
y_test = keras.utils.to_categorical(y_test1)
x_test = (x_test-x_train.mean())/x_train.std();

model = tf.keras.models.load_model('Model.h5')
score = model.evaluate(x_test, y_test, verbose=0)
print("\n\n")
print("CNN: Test accuracy:", score[1])

predict_x=model.predict(x_test)
y_pred=np.argmax(predict_x,axis=1)

print("F1-Score:", f1_score(y_test1,y_pred))
ROC_AUC = roc_auc_score(y_test1['y'], y_pred)
print("The ROC AUC score:", ROC_AUC )

# calculate roc curves

cnn_fpr, cnn_tpr, _ = roc_curve(y_test1['y'], y_pred)
np.savetxt('CNN_FPR.txt',cnn_fpr)
np.savetxt('CNN_TPR.txt',cnn_tpr)

'''KNN'''

x_train=pd.read_csv(r'/home/roydipta/Topic4_Micro_Attacks/SecondTry/AD/3000/X_train.csv',header=None)
y_train=pd.read_csv(r'/home/roydipta/Topic4_Micro_Attacks/SecondTry/AD/3000/Y_train.csv',header=None)
x_val=pd.read_csv(r'/home/roydipta/Topic4_Micro_Attacks/SecondTry/AD/3000/X_validation.csv',header=None)
y_val=pd.read_csv(r'/home/roydipta/Topic4_Micro_Attacks/SecondTry/AD/3000/Y_validation.csv',header=None)
x_test=pd.read_csv(r'/home/roydipta/Topic4_Micro_Attacks/SecondTry/AD/3000/X_test.csv',header=None)
y_test1=pd.read_csv(r'/home/roydipta/Topic4_Micro_Attacks/SecondTry/AD/3000/Y_test.csv',header=None)

mean=x_train.mean()
std=x_train.std()
x_train=(x_train-mean)/std
x_test=(x_test-mean)/std
y_test1.columns=['y']
y_train.columns=['y']

knn = KNeighborsClassifier(n_neighbors=3)
knn.fit(x_train, y_train['y'])
y_pred = knn.predict(x_test)
print("\n\n")
print("KNN:")
print(metrics.accuracy_score(y_test1['y'], y_pred))
print("F1-Score:", f1_score(y_test1,y_pred))

ROC_AUC = roc_auc_score(y_test1['y'], y_pred)
print("The ROC AUC score is:", ROC_AUC )

# calculate roc curves
from sklearn.metrics import roc_curve
knn_fpr, knn_tpr, _ = roc_curve(y_test1['y'], y_pred)
np.savetxt('KNN_FPR.txt',knn_fpr)
np.savetxt('KNN_TPR.txt',knn_tpr)

"""No Skill"""
ns_pred = [0 for _ in range(len(y_test1['y']))]

# calculate roc curves
ns_fpr, ns_tpr, _ = roc_curve(y_test1['y'], ns_pred)
np.savetxt('NS_FPR.txt',ns_fpr)
np.savetxt('NS_TPR.txt',ns_tpr)

'''SVM'''
svm = SVC(kernel='rbf', gamma='auto')
svm.fit(x_train, y_train['y'])
y_pred = svm.predict(x_test)
print("\n\n")
print("SVM:")
print(metrics.accuracy_score(y_test1['y'], y_pred))
print("F1-Score:", f1_score(y_test1,y_pred))
ROC_AUC = roc_auc_score(y_test1['y'], y_pred)
print("The ROC AUC score: ", ROC_AUC )
# calculate roc curves
svm_fpr, svm_tpr, _ = roc_curve(y_test1['y'], y_pred)
np.savetxt('SVM_FPR.txt',svm_fpr)
np.savetxt('SVM_TPR.txt',svm_tpr)

np.savetxt('SVM_FPR.txt',svm_fpr)
np.savetxt('SVM_TPR.txt',svm_tpr)

'''RF'''
max_depth=14
rf = RandomForestClassifier(max_depth=max_depth, random_state=0)
rf.fit(x_train, y_train['y'])
y_pred = rf.predict(x_test)
print("\n\n")
print("RF:")
print(metrics.accuracy_score(y_test1['y'], y_pred))
ROC_AUC = roc_auc_score(y_test1['y'], y_pred)
print("The ROC AUC score: ", ROC_AUC )

print("F1-Score: ",f1_score(y_test1,y_pred))
# calculate roc curves
rf_fpr, rf_tpr, _ = roc_curve(y_test1['y'], y_pred)

np.savetxt('RF_FPR.txt',rf_fpr)
np.savetxt('RF_TPR.txt',rf_tpr)

'''GB'''
max_depth=4 
gb = GradientBoostingClassifier(learning_rate=0.1, max_depth=max_depth, random_state=0)
gb.fit(x_train, y_train['y'])
y_pred = gb.predict(x_test)
print("\n\n")
print("Gradient Boosting:")
print(metrics.accuracy_score(y_test1['y'], y_pred))
ROC_AUC = roc_auc_score(y_test1['y'], y_pred)
print("The ROC AUC score: ", ROC_AUC )
print("F1-Score: ",f1_score(y_test1,y_pred))
# calculate roc curves
gb_fpr, gb_tpr, _ = roc_curve(y_test1['y'], y_pred)


np.savetxt('GB_FPR.txt',gb_fpr)
np.savetxt('GB_TPR.txt',gb_tpr)



