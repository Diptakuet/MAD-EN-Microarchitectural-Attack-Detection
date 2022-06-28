# MAD-EN-Microarchitectural-Attack-Detection
In this study, we introduce MAD-EN dynamic detection tool that leverages system-wide energy consumption traces collected from a generic Intel RAPL tool to detect ongoing anomalies in a system.

Our purpose is to distinguish benign applications and microarchitectural attacks based on their fingerprint on CPU power consumption. For this purpose, we designed MAD-EN with offline and online phases. In the offline phase, a diverse set of microarchitectural attacks and benign applications is run on the test setup while the system-wide power consumption traces are collected. Next, the collected traces are utilized to train an Anomaly Detector (AD) model to be used in the online phase to detect ongoing attacks. Furthermore, an additional DL model, namely Attack Recognizer (AR), is created with solely microarchitectural attacks to classify the suspicious activity.

