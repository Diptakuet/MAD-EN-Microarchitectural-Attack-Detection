%% Attacks
%% The last 10 measurements from each attacks will be read for test data
%% 1. Flush+Reload
clc;clear all;
cd '..\Attacks\1. FlushReload';
clear c1 d1 core1 dram1;
samples = 3000;
instance = 20;
iter = samples*instance;
c1=rmmissing(xlsread('test_fr_core_1_20.csv'));
k=1;
for i=1:samples:iter
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
XC_fr=[core1];
%% 2. Flush+Flush
cd '..\Attacks\2. FlushFlush';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test2_ff_core_1_20.csv'));
k=1;
for i=1:samples:iter
    core1(:,k)=c1(i:i+samples-1,1);   
    k=k+1;
end
XC_ff=[core1];
%% 3. Prime+Probe
cd '..\Attacks\3. PrimeProbe';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_pp_core_1_20.csv'));
k=1;
for i=1:samples:iter
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_pp=[core1];
%% 4. Portsmash
cd '..\Attacks\4. Portsmash';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_portsmash_ecc_core_1_20.csv'));
k=1;
for i=1:samples:iter
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_ps=[core1];
%% 5. TLBleed
cd '..\Attacks\5. TLBLeed';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_tlbleed_rsa_core_1_20.csv'));
k=1;
for i=1:samples:iter
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_tlb=[core1];
%% 6-9. Spectre
cd '..\Attacks\6. Spectre';

cvar1=rmmissing(xlsread('test_spectre_var1_core_1_20.csv'));
cvar2=rmmissing(xlsread('test_spectre_var2_btb_core_1_20.csv'));
cvar3=rmmissing(xlsread('test_spectre_var3_ret2spec_core_1_20.csv'));
cvar4=rmmissing(xlsread('test_spectre_var4_core_1_20.csv'));
k=1;
for i=1:samples:iter
    core_var1(:,k)=cvar1(i:i+samples-1,1);
    core_var2(:,k)=cvar2(i:i+samples-1,1);
    core_var3(:,k)=cvar3(i:i+samples-1,1);
    core_var4(:,k)=cvar4(i:i+samples-1,1);
    %core_idle(:,k)=cidle(i:i+2999,1);
    %dram_idle(:,k)=didle(i:i+2999,1);    
    k=k+1;
end
XC_spectre=[core_var1 core_var2 core_var3 core_var4];
%% 10-12. Medusa
cd '..\Attacks\7. Medusa';
clear core_var1 core_var2 core_var3 core_var4;


cvar1=rmmissing(xlsread('test_medusa_var1_core_1_20.csv'));
cvar2=rmmissing(xlsread('test_medusa_var2_core_1_20.csv'));
cvar3=rmmissing(xlsread('test_medusa_var3_core_1_20.csv'));
k=1;
for i=1:samples:iter
    core_var1(:,k)=cvar1(i:i+samples-1,1);
    core_var2(:,k)=cvar2(i:i+samples-1,1);
    core_var3(:,k)=cvar3(i:i+samples-1,1);    
    k=k+1;
end
XC_medusa=[core_var1 core_var2 core_var3];
%% 13. Zombieload
cd '..\Attacks\8. Zombieload';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_zombieload_core_1_20.csv'));
k=1;
for i=1:samples:iter
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_zombie=[core1];
%% 14. Fallout
cd '..\Attacks\9. Fallout';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_fallout_core_1_20.csv'));
k=1;
for i=1:samples:iter
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_fall=[core1];
%% 15-16. BHI
cd '..\Attacks\10. BHI';
clear c1 d1 core1 dram1;
cver1=rmmissing(xlsread('test_bhi_inter_core_1_20.csv'));
cver2=rmmissing(xlsread('test_bhi_intra_core_1_20.csv'));
k=1;
for i=1:samples:iter
    core_ver1(:,k)=cver1(i:i+samples-1,1);
    core_ver2(:,k)=cver2(i:i+samples-1,1);
    k=k+1;
end
XC_bhi=[core_ver1];
%% X and Y merge
XC = [XC_fr XC_ff XC_pp XC_ps XC_tlb XC_spectre XC_medusa XC_zombie XC_fall XC_bhi];
k=0;
category = 15;
for i=1:instance:instance*category
    Y(1,i:i+instance-1)=k*ones(1,instance);
    k=k+1;
end
%%
X = XC'; Y = Y';
dlmwrite('..\FinalData\AR\3000\X_test_15.csv',X);
dlmwrite('..\FinalData\AR\3000\Y_test_15.csv',Y);

