# AD Model
The purpose of the AD model is to differentiate between attack and benign application based on their respective energy consumption traces. 
For that purpose, in the offline phase 15 categories of attacks including their variants and 35 diverse benign applications are considered. 
Energy consmuption traces are collected during individual execution of each attack and benign applications. For the offline phase 50 energy 
trace measurements for each attack/benign application are recorded by utilizing the RAPL framework. Thus, (15+35)x50=2500 energy trace measurents 
are utilized to create a pretrained AD model which are forwarded in the online phase. 

In the online phase, 10 additional energy trace measurements are recorded for each 15 categories of attacks. For the benign application, 
we have included 10 measurements of energy traces from each 50 benign applications (16 tests from offline phase + 34 new tests) to enrich the test dataset. 
Thus, we have total (15+50)x10=650 test measurements for our online phase. It is to be noted that, AD model is a binary classifier, hence, all the attack 
instances are labeled as 0 and the benign instances are labeled as 1.
