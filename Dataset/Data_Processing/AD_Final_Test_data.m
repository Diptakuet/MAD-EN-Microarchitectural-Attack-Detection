%% Attacks
%% The last 10 measurements from each attacks will be read for test data
clc;clear all;
%% 1. Flush+Reload
cd '..\Attacks\1. FlushReload';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('fr_core_1_60.csv'));
k=1;
samples=3000;
N1=samples*50+1;
num_measure = 60;
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
cd '..\Attacks\5. TLBLeed';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('tlbleed_rsa_core_1_60.csv'));
k=1;
for i=N1:samples:N2
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
for i=N1:samples:N2
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
for i=N1:samples:N2
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
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);   
    k=k+1;
end
XC_zombie=[core1];

%% 14. Fallout
cd '..\Attacks\9. Fallout';
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('fallout_core_1_60.csv'));
k=1;
for i=N1:samples:N2
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
XC_fall=[core1];

%% 15. BHI
cd '..\Attacks\10. BHI';
clear c1 d1 core1 dram1;
cver1=rmmissing(xlsread('bhi_inter_core_1_70.csv'));
k=1;
for i=N1:samples:N2
    core_ver1(:,k)=cver1(i:i+samples-1,1); 
    k=k+1;
end
XC_bhi=[core_ver1];
%%
% --------------------------------------------------------------------------------------------------
% Benign Application
% Read 10 measurements from each benign applications for test data
cd '..\Benign_Application\Test_Data'
%% Processor: 1. aobench
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_aobench_core_1_20.csv'));
k=1;
num_measure = 10;
N=(samples*num_measure);

M1=10*samples+1;
M2=samples*20;
for i=M1:samples:M2
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
XC_aobench=[core1];
%% Processor: 2. botan
clear c1 d1 core1 dram1;
c_cast256=rmmissing(xlsread('test_botan_CAST-256_core_1_20.csv'));
k=1;
for i=1:samples:N
    core_cast256(:,k)=c_cast256(i:i+samples-1,1);
    k=k+1;
end
XC_botan=[core_cast256];
%% Processor: 3. byte
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_byte_core_1_20.csv'));
k=1;
M1=10*samples+1;
M2=samples*20;
for i=M1:samples:M2
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_byte=[core1];
%% Processor: 4. cachebench
clear c1 d1 core1 dram1;
c_write=rmmissing(xlsread('test_cachebench_write_core_1_20.csv'));
k=1;
for i=1:samples:N   
    core_write(:,k)=c_write(i:i+samples-1,1);
    k=k+1;
end
XC_cachebench=[core_write];
%% Processor: 5. encode-mp3
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_encode_mp3_core_1_20.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_encode_mp3=[core1];
%% Processor: 6. arrayfire
clear c1 d1 core1 dram1;
c_cg=rmmissing(xlsread('test_arrayfire_cg_cpu_core_1_20.csv'));
k=1;
for i=1:samples:N
    core_cg(:,k)=c_cg(i:i+samples-1,1);
    k=k+1;
end
XC_arrayfire=[core_cg];
%% Processor: 7. bullet
clear c1 d1 core1 dram1;
c_raytest=rmmissing(xlsread('test_bullet_raytest_cpu_core_1_20.csv'));
k=1;
for i=1:samples:N
    core_raytest(:,k)=c_raytest(i:i+samples-1,1);
    k=k+1;
end
XC_bullet=[core_raytest];
%% Processor: 8. jpegxl
clear c1 d1 core1 dram1;
c_png=rmmissing(xlsread('test_jpegxl_png_5_core_1_20.csv'));
k=1;
for i=1:samples:N
    core_png(:,k)=c_png(i:i+samples-1,1);
    k=k+1;
end
XC_jpegxl=[core_png];
%% System: 1. git
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_git_core_1_20.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1);   
    k=k+1;
end
XC_git=[core1];
%% System: 2-3. php
clear c1 d1 core1 dram1;
c_php2=rmmissing(xlsread('test_zend_micro_bench_core_1_20.csv'));
k=1;
for i=1:samples:N
    core_php2(:,k)=c_php2(i:i+samples-1,1);
    k=k+1;
end
XC_php=[core_php2];
%% System: 4. pybench
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_pybench_core_1_20.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1);  
    k=k+1;
end
XC_pybench=[core1];
%% System: 5. basis
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_basis_ETC1S_core_1_20.csv'));
k=1;
M1=10*samples+1;
M2=samples*20;
for i=M1:samples:M2
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
XC_basis=[core1];

%% Disk: 1. unpack_linux
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_unpack_linux_core_1_20.csv'));
k=1;
M1=5*samples;
M2=samples*6+1;
M3=samples*8;
M4=samples*16+1;
M5=samples*19;
for i=1:samples:M1
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
for i=M2:samples:M3
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
for i=M4:samples:M5
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
XC_unpack_linux=[core1];
%% Disk: 2. fio
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_fio_random_read_core_1_20.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1);   
    k=k+1;
end
XC_fio=[core1];
%% Video: 1
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_video1_netflix_core_1_20.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1);
    k=k+1;
end
XC_video=[core1];
%% RealWorld: 1. libreoffice
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_office_core_1_20.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_office=[core1];
%% New Benign Apps for the test
% Processor 1: amg
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_amg_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_amg=[core1];
%% Processor 2: glib-bench
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_glibc_bench_ffsl_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_glibc_bench=[core1];

%% Processor 4: gnupg
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_gnupg_core_1_20.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_gnupg=[core1];
%% Processor 5: hackbench
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_hackbench_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_hackbench=[core1];
%% Processor 6: himeno
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_himeno_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_himeno=[core1];
%% Processor 7: ipc-benchmark
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_ipc_benchmark_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_ipc_benchmark=[core1];
%% Processor 8: libraw
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_libraw_core_1_20.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_libraw=[core1];
%% Processor 9: luxcorerender
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_luxcorerender_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_luxcorerender=[core1];
%% Processor 10: lzbench
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_lzbench_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_lzbench=[core1];
%% Processor 11: minion
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_minion_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_minion=[core1];
%% Processor 12: nqueens
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_nqueens_core_1_20.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_nqueens=[core1];

%% Processor 13: asmfish
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_asmfish_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_asmfish=[core1];
%% Processor 14: blake2
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_blake2_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_blake2=[core1];
%% Processor 15: blosc
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_blosc_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_blosc=[core1];
%% Processor 16: cloverleaf
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_cloverleaf_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_cloverleaf=[core1];
%% Processor 17: cp2k
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_cp2k_core_1_12.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_cp2k=[core1];
%% Processor 18: cryptopp
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_cryptopp_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_cryptopp=[core1];
%% Processor 19: fftw
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_fftw_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_fftw=[core1];
%% Processor 20: gcrypt
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_gcrypt_core_1_12.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_gcrypt=[core1];
%% System 1: financebench
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('financebench_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_financebench=[core1];
%% System 2: idle
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('idle_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_idle=[core1];
%% System 3: java_jmh
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_java_jmh_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_java_jmh=[core1];
%% System 4: appleseed
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_appleseed_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_appleseed=[core1];
%% System 5: ctx-clock
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_ctx_clock_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_ctx_clock=[core1];
%% System 6: hint
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_hint_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_hint=[core1];
%% System 7: intel-mpi
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_intel_mpi_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_intel_mpi=[core1];
%% System 8: natron
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_natron_core_1_12.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_natron=[core1];
%% System 9: redis
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_redis_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_redis=[core1];
%% System 10: gegl
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_gegl_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_gegl=[core1];
%% System 11: sysbench
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_sysbench_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_sysbench=[core1];
%% System 12: tnn
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_tnn_core_1_12.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_tnn=[core1];
%% System 13: openscad
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_openscad_core_1_12.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_openscad=[core1];
%% Disk 1: postmark
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('test_postmark_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_postmark=[core1];
%% Disk 2: sqlite
clear c1 d1 core1 dram1;
c1=rmmissing(xlsread('sqlite_core_1_10.csv'));
k=1;
for i=1:samples:N
    core1(:,k)=c1(i:i+samples-1,1); 
    k=k+1;
end
XC_sqlite=[core1];


%% X and Y merge

X_C_attack = [XC_fr XC_ff XC_pp XC_ps XC_tlb XC_spectre XC_medusa XC_zombie XC_fall XC_bhi];
X_C_benign = [XC_aobench XC_botan XC_byte XC_cachebench XC_encode_mp3 XC_arrayfire XC_bullet ...
    XC_jpegxl XC_git XC_php XC_pybench XC_basis XC_unpack_linux XC_fio ...
    XC_video XC_office XC_amg XC_glibc_bench XC_luxcorerender XC_gnupg XC_hackbench XC_himeno ...
    XC_ipc_benchmark XC_libraw XC_lzbench XC_minion XC_nqueens XC_asmfish XC_blake2 XC_blosc ...
    XC_cloverleaf XC_cp2k XC_cryptopp XC_fftw XC_gcrypt XC_financebench XC_idle XC_java_jmh ...
    XC_appleseed XC_ctx_clock XC_hint XC_intel_mpi XC_natron XC_redis XC_gegl XC_sysbench ...
    XC_tnn XC_openscad XC_postmark XC_sqlite];
%%
X = [X_C_attack X_C_benign];
%%
y1=zeros(1,size(X_C_attack,2));
y2=ones(1,size(X_C_benign,2));
Y=[y1 y2];
%%
X = X'; Y = Y';
dlmwrite('..\FinalData\AD\3000\X_test.csv',X);
dlmwrite('..\FinalData\AD\3000\Y_test.csv',Y);
