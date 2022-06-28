#!/usr/bin/env python
# coding: utf-8 

import numpy as np
import pandas as pd
import os
#os.environ["CUDA_VISIBLE_DEVICES"]="-1"
from sklearn.metrics import f1_score
from sklearn.svm import SVC
from sklearn import metrics
from sklearn.metrics import roc_curve
from sklearn.metrics import roc_auc_score

x_train=pd.read_csv('Data/X_train.csv',header=None)
y_train=pd.read_csv('Data/Y_train.csv',header=None)
x_val=pd.read_csv('Data/X_validation.csv',header=None)
y_val=pd.read_csv('Data/Y_validation.csv',header=None)
x_test=pd.read_csv('Data/X_test.csv',header=None)
y_test1=pd.read_csv('Data/Y_test.csv',header=None)

mean=x_train.mean()
std=x_train.std()
x_train=(x_train-mean)/std
x_test=(x_test-mean)/std
y_test1.columns=['y']
y_train.columns=['y']

svm = SVC(kernel='rbf', gamma='auto')
svm.fit(x_train, y_train['y'])
y_pred = svm.predict(x_test)
print("SVM:")
print(metrics.accuracy_score(y_test1['y'], y_pred))

print("F1-Score:", f1_score(y_test1,y_pred))

ROC_AUC = roc_auc_score(y_test1['y'], y_pred)
print("The ROC AUC score is %.5f" % ROC_AUC )

# calculate roc curves
svm_fpr, svm_tpr, _ = roc_curve(y_test1['y'], y_pred)
