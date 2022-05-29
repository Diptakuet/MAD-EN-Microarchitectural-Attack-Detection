
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
N1=1;
num_measure = 50;
N2=(samples*num_measure);
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_fr=[core1];

%% 2. Flush+Flush
cd '..\Attacks\2. FlushFlush';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('ff_core_1_60.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_ff=[core1];

%% 3. Prime+Probe
cd '..\Attacks\3. PrimeProbe';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('pp_core_1_60.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);   
    k=k+1;
end
XC_pp=[core1];

%% 4. Portsmash
cd '..\Attacks\4. Portsmash';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('portsmash_ecc_core_1_60.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);   
    k=k+1;
end
XC_ps=[core1];

%% 5. TLBleed
cd '..\Attacks\\5. TLBLeed';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('tlbleed_rsa_core_1_60.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_tlb=[core1];

%% 8. Zombieload
cd '..\Attacks\8. Zombieload';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('zombieload_core_1_60.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_zombie=[core1];

%% 9. Fallout
cd '..\Attacks\9. Fallout';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('fallout_core_1_60.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_fall=[core1];

%% 10. BHI
cd '..\Attacks\10. BHI';
clear c1 d1 core1 dram1;
cver1=rmmissing(xlsread('bhi_inter_core_1_70.csv'));
k=1;
for i=N1:samples:N2
    core_ver1(:,k)=cver1(i:i+samples-1,1); 
    k=k+1;
end
XC_bhi=[core_ver1];

%% 6. Spectre
cd '..\Attacks\6. Spectre';

cvar1=rmmissing(xlsread('spectre_var1_core_1_60.csv'));
cvar2=rmmissing(xlsread('spectre_var2_btb_core_1_60.csv'));
cvar3=rmmissing(xlsread('spectre_var3_core_1_60.csv'));
cvar4=rmmissing(xlsread('spectre_var4_core_1_60.csv'));
k=1;
for i=N1:samples:N2
    core_var1(:,k)=cvar1(i:i+samples-1,1);
    core_var2(:,k)=cvar2(i:i+samples-1,1);
    core_var3(:,k)=cvar3(i:i+samples-1,1);
    core_var4(:,k)=cvar4(i:i+samples-1,1);    
    k=k+1;
end
XC_spectre=[core_var1 core_var2 core_var3 core_var4];

%% 7. Medusa
cd '..\Attacks\7. Medusa';
clear core_var1 core_var2 core_var3 core_var4;
clear dram_var1 dram_var2 dram_var3 dram_var4;
cvar1=rmmissing(xlsread('medusa_var1_core_1_60.csv'));
cvar2=rmmissing(xlsread('medusa_var2_core_1_60.csv'));
cvar3=rmmissing(xlsread('medusa_var3_core_1_60.csv'));
k=1;
for i=N1:samples:N2
    core_var1(:,k)=cvar1(i:i+samples-1,1);
    core_var2(:,k)=cvar2(i:i+samples-1,1);
    core_var3(:,k)=cvar3(i:i+samples-1,1);   
    k=k+1;
end
XC_medusa=[core_var1 core_var2 core_var3];

%%
% --------------------------------------------------------------------------------------------------
% Benign Application
%% Processor: 1. aobench
cd '..\Benign_Application\Processor\aobench\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('aobench_core_1_50.csv'));
k=1;
num_measure=50;
N1=1; 
N2=samples*num_measure;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_aobench=[core1];

%% Processor: 2-4. botan
cd '..\Benign_Application\Processor\botan\Data';
clear c1 d1 core1 dram1;
c_aes=rmmissing(xlsread('botan_aes_core_1_50.csv'));
c_blowfish=rmmissing(xlsread('botan_blowfish_core_1_50.csv'));
c_cast256=rmmissing(xlsread('botan_CAST-256_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core_aes(:,k)=c_aes(i:i+samples-1,1);   
    core_blowfish(:,k)=c_blowfish(i:i+samples-1,1);
    core_cast256(:,k)=c_cast256(i:i+samples-1,1);
    k=k+1;
end
XC_botan=[core_aes core_blowfish core_cast256];

%% Processor: 5. byte
cd '..\Benign_Application\Processor\byte\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('byte_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);   
    k=k+1;
end
XC_byte=[core1];

%% Processor: 6-7. cachebench
cd '..\Benign_Application\Processor\cachebench\Data';
clear c1 d1 core1 dram1;
c_read=rmmissing(xlsread('cachebench_read_core_1_51.csv'));
c_write=rmmissing(xlsread('cachebench_write_core_1_51.csv'));
k=1;
for i=N1:samples:N2
    core_read(:,k)=c_read(i:i+samples-1,1);   
    core_write(:,k)=c_write(i:i+samples-1,1);
    k=k+1;
end
XC_cachebench=[core_read core_write];

%% Processor: 8. encode-mp3
cd '..\Benign_Application\Processor\encode-mp3\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('encode_mp3_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
XC_encode_mp3=[core1];

%% Processor: 9-10. arrayfire
cd '..\Benign_Application\Processor\arrayfire\Data';
clear c1 d1 core1 dram1;
c_blas=rmmissing(xlsread('arrayfire_blas_cpu_core_1_50.csv'));
c_cg=rmmissing(xlsread('arrayfire_cg_cpu_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core_blas(:,k)=c_blas(i:i+samples-1,1);
    core_cg(:,k)=c_cg(i:i+samples-1,1);
    k=k+1;
end
XC_arrayfire=[core_blas core_cg];

%% Processor: 11-13. bullet
cd '..\Benign_Application\Processor\bullet\Data';
clear c1 d1 core1 dram1;
c_convex=rmmissing(xlsread('bullet_1000_convex_cpu_core_1_50.csv'));
c_stack=rmmissing(xlsread('bullet_1000_stack_cpu_core_1_50.csv'));
c_fall=rmmissing(xlsread('bullet_3000_fall_cpu_core_1_50.csv'));
c_raytest=rmmissing(xlsread('bullet_raytest_cpu_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core_convex(:,k)=c_convex(i:i+samples-1,1);
    core_stack(:,k)=c_stack(i:i+samples-1,1);
    core_fall(:,k)=c_fall(i:i+samples-1,1);
    core_raytest(:,k)=c_raytest(i:i+samples-1,1);
    k=k+1;
end
XC_bullet=[core_convex core_stack core_raytest];

%% Processor: 14-15. jpegxl
cd '..\Benign_Application\Processor\jpegxl\Data';
clear c1 d1 core1 dram1;
c_jpg=rmmissing(xlsread('jpegxl_jpeg_5_core_1_50.csv'));
c_png=rmmissing(xlsread('jpegxl_png_5_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core_jpg(:,k)=c_jpg(i:i+samples-1,1);
    core_png(:,k)=c_png(i:i+samples-1,1);
    k=k+1;
end
XC_jpegxl=[core_jpg core_png];

%% System: 1. git
cd '..\Benign_Application\System\git\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('git_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);
    dram1(:,k)=d1(i:i+samples-1,1);   
    k=k+1;
end
XC_git=[core1];

%% System: 2-3. php
cd '..\Benign_Application\System\php\Data';
clear c1 d1 core1 dram1;
c_php1=rmmissing(xlsread('zend_bench_core_1_50.csv'));
c_php2=rmmissing(xlsread('zend_micro_bench_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core_php1(:,k)=c_php1(i:i+samples-1,1);  
    core_php2(:,k)=c_php2(i:i+samples-1,1);
    k=k+1;
end
XC_php=[core_php1 core_php1];

%% System: 4. pybench
cd '..\Benign_Application\System\pybench\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('pybench_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);   
    k=k+1;
end
XC_pybench=[core1];

%% System: 5. basis
cd '..\Benign_Application\System\basis\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('basis_ETC1S_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_basis=[core1];

%% Disk: 1. blogbench
cd '..\Benign_Application\Disk\blogbench\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('blogbench_read_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_blogbench=[core1];

%% Disk: 2-3. tiobench
cd '..\Benign_Application\Disk\tiobench\Data';
clear c1 d1 core1 dram1;
c_read=rmmissing(xlsread('tiobench_read_core_1_50.csv'));
c_write=rmmissing(xlsread('tiobench_write_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core_read(:,k)=c_read(i:i+samples-1,1); 
    core_write(:,k)=c_write(i:i+samples-1,1);
    k=k+1;
end
XC_tiobench=[core_read core_write];

%% Disk: 4. unpack_linux
cd '..\Benign_Application\Disk\unpack_linux\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('unpack_linux_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_unpack_linux=[core1];

%% Disk: 5. fio
cd '..\Benign_Application\Disk\fio\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('fio_random_read_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);   
    k=k+1;
end
XC_fio=[core1];

%% Video: 1-5
cd '..\Benign_Application\Video\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('video1_netflix_core_1_50.csv'));
c2=rmmissing(xlsread('video1_hbo_core_1_50.csv'));
c3=rmmissing(xlsread('video1_history_core_1_50.csv'));
c4=rmmissing(xlsread('video1_cnn_core_1_50.csv'));
c5=rmmissing(xlsread('video1_espn_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1); 
    core2(:,k)=c2(i:i+samples-1,1);
    core3(:,k)=c3(i:i+samples-1,1);
    core4(:,k)=c4(i:i+samples-1,1);
    core5(:,k)=c5(i:i+samples-1,1);
    k=k+1;
end
XC_video=[core1 core2 core3 core4 core5];

%% RealWorld: 1. Website
cd '..\Benign_Application\RealWorld\Website\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('website_5_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_website=[core1];

%% RealWorld: 2. libreoffice
cd '..\Benign_Application\RealWorld\Office\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('office_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
XC_office=[core1];

%% RealWorld: 3. visual_studio_code
cd '..\Benign_Application\RealWorld\visual_studio_code\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('vs_python_run_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
XC_vs=[core1];

%% RealWorld: 4. pycharm
cd '..\Benign_Application\RealWorld\pycharm\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('pycharm_run_code_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_pycharm=[core1];

%% RealWorld: 5. zoom
cd '..\Benign_Application\RealWorld\zoom\Data';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('zoom_core_1_50.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
XC_zoom=[core1];

%% X and Y merge
X_C_attack = [XC_fr XC_ff XC_pp XC_ps XC_tlb XC_spectre XC_medusa XC_zombie XC_fall XC_bhi];
X_C_benign = [XC_aobench XC_botan XC_byte XC_cachebench XC_encode_mp3 XC_arrayfire XC_bullet ...
    XC_jpegxl XC_git XC_php XC_pybench XC_basis XC_blogbench XC_tiobench XC_unpack_linux ...
    XC_fio XC_video XC_website XC_office XC_pycharm XC_vs XC_zoom];

X = [X_C_attack X_C_benign];
%%
y1=zeros(1,size(X_C_attack,2));
y2=ones(1,size(X_C_benign,2));
Y=[y1 y2];
%%
X = X'; Y = Y';
dlmwrite('..\FinalData\AD\3000\X.csv',X);
dlmwrite('..\FinalData\AD\3000\AD\3000\Y.csv',Y);
%% Train data
N = size(X,1)*0.8;
k=1;
for i=1:40:N
    x_train(i:i+39,:)=X(k:k+39,:);
    if k<750
        y_train(i:i+39,1)=0;
    else
        y_train(i:i+39,1)=1;
    end
    k=k+50;
end
%% Test data
N = size(X,1)*0.2;
k=41;
for i=1:10:N
    x_validation(i:i+9,:)=X(k:k+9,:);
    if k<750
        y_validation(i:i+9,1)=0;
    else
        y_validation(i:i+9,1)=1;
    end
    k=k+50;
end    
%% Saving train and test data
dlmwrite('..\FinalData\AD\3000\X_train.csv',x_train);
dlmwrite('..\FinalData\AD\3000\Y_train.csv',y_train);
dlmwrite('..\FinalData\AD\3000\X_validation.csv',x_validation);
dlmwrite('..\FinalData\AD\3000\Y_validation.csv',y_validation);

