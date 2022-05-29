
%% Attacks
% First 50 measurements from each attacks will be read for the offline phase
% These 50 measurements per attacks will be split between train and validation data.
%% 1. Flush+Reload
clc;clear all;
cd '..\Attacks\1. FlushReload';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('fr_core_1_60.csv'));
k=1;
samples=3000;
num_measure = 60;
N=(samples*num_measure);
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
XC_fr=[core1];

%% 2. Flush+Flush
cd '..\Attacks\2. FlushFlush';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('ff_core_1_60.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1);   
    k=k+1;
end
XC_ff=[core1];

%% 3. Prime+Probe
cd '..\Attacks\3. PrimeProbe';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('pp_core_1_60.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
XC_pp=[core1];

%% 4. Portsmash
cd '..\Attacks\4. Portsmash';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('portsmash_ecc_core_1_60.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_ps=[core1];

%% 5. TLBleed
cd '..\Attacks\5. TLBLeed';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('tlbleed_rsa_core_1_60.csv'));

k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_tlb=[core1];

%% 6-9. Spectre
cd '..\Attacks\6. Spectre';

cvar1=rmmissing(xlsread('spectre_var1_core_1_60.csv'));
cvar2=rmmissing(xlsread('spectre_var2_btb_core_1_60.csv'));
cvar3=rmmissing(xlsread('spectre_var3_core_1_60.csv'));
cvar4=rmmissing(xlsread('spectre_var4_core_1_60.csv'));
k=1;
for i=1:samples:N
    core_var1(:,k)=cvar1(i:i+samples-1,1);
    core_var2(:,k)=cvar2(i:i+samples-1,1);
    core_var3(:,k)=cvar3(i:i+samples-1,1);
    core_var4(:,k)=cvar4(i:i+samples-1,1);   
    k=k+1;
end
XC_spectre=[core_var1 core_var2 core_var3 core_var4];

%% 10-12. Medusa
cd '..\Attacks\7. Medusa';
clear core_var1 core_var2 core_var3 core_var4;
clear dram_var1 dram_var2 dram_var3 dram_var4;
cvar1=rmmissing(xlsread('medusa_var1_core_1_60.csv'));
cvar2=rmmissing(xlsread('medusa_var2_core_1_60.csv'));
cvar3=rmmissing(xlsread('medusa_var3_core_1_60.csv'));

k=1;
for i=1:samples:N
    core_var1(:,k)=cvar1(i:i+samples-1,1);
    core_var2(:,k)=cvar2(i:i+samples-1,1);
    core_var3(:,k)=cvar3(i:i+samples-1,1);  
    k=k+1;
end
XC_medusa=[core_var1 core_var2 core_var3];
%% 13. Zombieload
cd '..\Attacks\8. Zombieload';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('zombieload_core_1_60.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1);   
    k=k+1;
end
XC_zombie=[core1];

%% 14. Fallout
cd '..\Attacks\9. Fallout';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('fallout_core_1_60.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_fall=[core1];

%% 15. BHI
cd '..\Attacks\10. BHI';
clear c1 d1 core1 dram1;
cver1=rmmissing(xlsread('bhi_inter_core_1_70.csv'));
k=1;
for i=1:samples:N
    core_ver1(:,k)=cver1(i:i+samples-1,1); 
    k=k+1;
end
XC_bhi=[core_ver1];

%% X and Y merge
XC = [XC_fr XC_ff XC_pp XC_ps XC_tlb XC_spectre XC_medusa XC_zombie XC_fall XC_bhi];
k=0;
category = 15;
for i=1:num_measure:num_measure*category
    Y(1,i:i+num_measure-1)=k*ones(1,num_measure);
    k=k+1;
end
%%
X = XC'; Y = Y';
dlmwrite('..\FinalData\AR\3000\X.csv',X);
dlmwrite('..\FinalData\AR\3000\Y.csv',Y);
%% Train data
L = 40*15;
k=1;
m=0;
for i=1:40:L
    x_train(i:i+40-1,:)=X(k:k+40-1,:);
    y_train(i:i+40-1,1)=m;
    k=k+num_measure;
    m=m+1;
end
%% Validation data
L = 10*15;
m=0;
k=41;
for i=1:10:L
    x_validation(i:i+9,:)=X(k:k+9,:);
    y_validation(i:i+9,1)=m;
    k=k+num_measure;
    m=m+1;
end  
%% Test data
L = 10*15;
m=0;
k=51;
for i=1:10:L
    x_test(i:i+9,:)=X(k:k+9,:);
    y_test(i:i+9,1)=m;
    k=k+num_measure;
    m=m+1;
end 
%% Saving train and test data
dlmwrite('..\FinalData\AR\3000\X_train_15.csv',x_train);
dlmwrite('..\FinalData\AR\3000\Y_train_15.csv',y_train);
dlmwrite('..\FinalData\AR\3000\X_validation_15.csv',x_validation);
dlmwrite('..\FinalData\AR\3000\Y_validation_15.csv',y_validation);
dlmwrite('..\FinalData\AR\3000\X_test_15.csv',x_test);
dlmwrite('..\FinalData\AR\3000\Y_test_15.csv',y_test);

