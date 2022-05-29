clc;clear all;
samples=[3000
2500
2000
1500
1000
500
];

f1_cnn=[0.999
0.985
0.983
0.983
0.978
0.959
];

f1_svm=[0.891
0.853
0.867
0.886
0.87
0.87
];

f1_knn=[0.882
0.865
0.882
0.889
0.932
0.91
];

f1_rf=[0.981
0.952
0.965
0.956
0.951
0.965
];

f1_gb=[0.973
0.965
0.961
0.963
0.961
0.952
];
figure(2);
plot(samples,f1_cnn,'-o');hold on;
plot(samples,f1_knn,'-o');
plot(samples,f1_svm,'-o');
plot(samples,f1_rf,'-o');
plot(samples,f1_gb,'-o');
xlabel('Number of Samples');
ylabel('F1-Score (%)');
legend('CNN','KNN','SVM','RF','GB');









