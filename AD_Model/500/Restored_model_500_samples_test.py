#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import pandas as pd
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import datasets, layers, models
import matplotlib as mpl
import matplotlib.pyplot as plt
#import seaborn as sns
import h5py 
import os 
#os.environ["CUDA_VISIBLE_DEVICES"]="-1"
from sklearn.metrics import f1_score


# In[6]:
x_train=pd.read_csv('Data/X_train.csv',header=None)
x_train = x_train.to_numpy()
x_test=pd.read_csv('Data/X_test.csv',header=None)
y_test1=pd.read_csv('Data/Y_test.csv',header=None)
x_test = x_test.to_numpy()



# In[7]:

y_test1.columns=['y']
print(x_test.shape)
print(y_test1['y'].shape)


# In[8]:


x_train = x_train.reshape((2000, 500, 1)).astype("float32")
x_test = x_test.reshape(650, 500,1).astype("float32")
y_test = keras.utils.to_categorical(y_test1)


# In[9]:

x_test = (x_test-x_train.mean())/x_train.std();


print(x_test.shape)
print(y_test.shape)

# In[12]:

model = tf.keras.models.load_model('Model.h5')
model.summary()

# In[15]:

score = model.evaluate(x_test, y_test, verbose=0)
print("Test loss:", score[0])
print("Test accuracy:", score[1])

# In[17]:

predict_x=model.predict(x_test) 
classes_x=np.argmax(predict_x,axis=1)
print(classes_x)
#np.savetxt('Predictions_test1.txt',classes_x)
con_mat = tf.math.confusion_matrix(labels=y_test1, predictions=classes_x).numpy()
classes = [0,1];
con_mat_norm = np.around(con_mat.astype('float') / con_mat.sum(axis=1)[:, np.newaxis], decimals=2)
con_mat_df = pd.DataFrame(con_mat_norm,index = classes, columns = classes)
con_mat_df.to_csv('confusion_matrix_test.csv')

print("F1-Score: ",f1_score(y_test1, classes_x, average='binary'))



