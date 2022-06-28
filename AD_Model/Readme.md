# AD Model
The performance of the AD model is tested with different number of samples. One of the key characteristics of micro-architectural attacks is their speed
of operation. These attacks can steal useful information or secret keys within a short time frame. Hence, it is of utmost importance to detect such anomalies
as fast as possible. However, faster detection mechanisms lead to the reduction of the recorded samples per measurement, considering the highest possible time
resolution for energy consumption readings are maintained. The energy consumption traces for each measurement has 3000 samples, which takes around
30 seconds to collect one complete energy trace before the anomaly classification. This leads to the question, will the AD model still be effective if the data
collection time frame is reduced further?

To answer this question, the performance of the AD models is tested by decreasing the number of samples from 3000 to 500 per measurement, and a
separate AD model is trained for each case. Here, the name of the each directory corresponds to the number of samples per measurements for which the AD model is 
created and tested. It is to be noted that, decreasing the number of samples results in faster anomaly detection as we sample the Intel RAPL framework with the highest possible resolution (500μs). Thus, the 500 samples correspond to the initial 5 seconds of the energy traces.

[3000/Data](https://github.com/Diptakuet/MAD-EN-Microarchitectural-Attack-Detection/tree/main/AD_Model/3000/Data): 
* X.csv: Preprocessed data containing 








