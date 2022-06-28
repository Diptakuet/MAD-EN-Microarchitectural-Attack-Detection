# MAD-EN-Microarchitectural-Attack-Detection
In this study, we introduce MAD-EN dynamic detection tool that leverages system-wide energy consumption traces collected from a generic Intel RAPL tool to detect ongoing anomalies in a system.

Our purpose is to distinguish benign applications and microarchitectural attacks based on their fingerprint on CPU power consumption. For this purpose, we designed MAD-EN with offline and online phases. In the offline phase, a diverse set of microarchitectural attacks and benign applications is run on the test setup while the system-wide power consumption traces are collected. Next, the collected traces are utilized to train an Anomaly Detector (AD) model to be used in the online phase to detect ongoing attacks. Furthermore, an additional DL model, namely Attack Recognizer (AR), is created with solely microarchitectural attacks to classify the suspicious activity.

## AD Model
The purpose of the AD model is to differentiate between attack and benign application based on their respective energy consumption traces. For that purpose, in the offline phase 15 categories of attacks including their variants and 35 diverse benign applications are considered. Energy consmuption traces are collected during individual execution of each attack and benign applications. For the offline phase 50 energy trace measurements for each attack/benign application are recorded by utilizing the RAPL framework. Thus, (15+35)x50=2500 energy trace measurents are utilized to create a pretrained AD model which are forwarded in the online phase. 

In the online phase, 10 additional energy trace measurements are recorded for each 15 categories of attacks. For the benign application, we have included 10 measurements of energy traces from each 50 benign applications (16 tests from offline phase + 34 new tests) to enrich the test dataset. Thus, we have total (15+50)x10=650 test measurements for our online phase. It is to be noted that, AD model is a binary classifier, hence, all the attack instances are labeled as 0 and the benign instances are labeled as 1.


## AR Model
The AR model is a multi-class classifier with 15 categories that covers 10 micro-architectural attacks with their variants. The performance of the
AR model is tested on the online phase with 150 energy trace measurements. Unlike the AD model, the test dataset does not contain any energy consumption
traces from benign applications, as the AR model will be activated once the AD model detects an anomaly in the system. Again, the AR model is constructed
with CNN, KNN, SVM, RF, and GB ML algorithms 2 with different numbers of samples.
