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
import h5py
import os
from sklearn.metrics import f1_score
#os.environ["CUDA_VISIBLE_DEVICES"]="-1"

# In[6]:


x_train=pd.read_csv('Data/X_train.csv',header=None)
y_train=pd.read_csv('Data/Y_train.csv',header=None)
x_train = x_train.to_numpy()
x_test=pd.read_csv('Data/X_validation.csv',header=None)
y_test1=pd.read_csv('Data/Y_validation.csv',header=None)
x_test = x_test.to_numpy()



# In[7]:
y_train.columns=['y']
y_test1.columns=['y']

print(x_train.shape)
print(x_test.shape)
print(y_train['y'].shape)
print(y_test1['y'].shape)


# In[8]:


x_train = x_train.reshape((2000, 1000, 1)).astype("float32")
x_test = x_test.reshape(500, 1000,1).astype("float32")
# Categorical (one hot) encoding of the labels
y_train = keras.utils.to_categorical(y_train)
y_test = keras.utils.to_categorical(y_test1)


# In[9]:

mean = x_train.mean()
std = x_train.std()
x_train = (x_train-mean)/std
x_test =  (x_test-mean)/std


# In[10]:


print(x_train.shape)
print(x_test.shape)
print(y_train.shape)
print(y_test.shape)


# In[11]:


model = models.Sequential()
model.add(tf.keras.layers.Conv1D(filters=64, kernel_size=3, activation='relu', input_shape=(1000,1)))
model.add(tf.keras.layers.Conv1D(filters=128, kernel_size=3, activation='relu'))
model.add(tf.keras.layers.MaxPooling1D(pool_size=3))
model.add(tf.keras.layers.Dropout(0.5))
#model.add(tf.keras.layers.Conv1D(filters=128, kernel_size=3, activation='relu'))
#model.add(tf.keras.layers.Conv1D(filters=128, kernel_size=3, activation='relu'))
#model.add(tf.keras.layers.MaxPooling1D(pool_size=3))
#model.add(tf.keras.layers.Dropout(0.5))
model.add(tf.keras.layers.Flatten())
model.add(tf.keras.layers.Dense(256, activation='relu'))
model.add(tf.keras.layers.Dropout(0.5))
model.add(tf.keras.layers.Dense(128, activation='relu'))
model.add(tf.keras.layers.Dropout(0.5))
model.add(tf.keras.layers.Dense(64, activation='relu'))
#model.add(tf.keras.layers.Dropout(0.5))
model.add(tf.keras.layers.Dense(2, activation='softmax'))
model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])


# In[12]:


model.summary()


# In[13]:


history = model.fit(x_train, y_train, epochs=100, validation_data=(x_test, y_test))


# In[14]:


np.save('History.npy',history.history)
model.save('Model.h5')

# In[15]:


score = model.evaluate(x_test, y_test, verbose=0)
print("Test loss:", score[0])
print("Test accuracy:", score[1])


# In[17]:


predict_x=model.predict(x_test) 
classes_x=np.argmax(predict_x,axis=1)
print(classes_x)
con_mat = tf.math.confusion_matrix(labels=y_test1, predictions=classes_x).numpy()
classes = [0,1];
con_mat_norm = np.around(con_mat.astype('float') / con_mat.sum(axis=1)[:, np.newaxis], decimals=2)

con_mat_df = pd.DataFrame(con_mat_norm,index = classes, columns = classes)
con_mat_df.to_csv('Confusion_matrix_validation2.csv')

print("F1-Score:",f1_score(y_test1, classes_x, average='binary'))



