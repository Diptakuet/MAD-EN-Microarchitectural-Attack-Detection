#!/bin/bash

#start_time=$(date +%s)
#dram

for i in {1..3000};
do
  pow=$(sudo cat /sys/devices/virtual/powercap/intel-rapl/intel-rapl\:0/intel-rapl\:0\:2/energy_uj)
  sleep 0.0005
  pow1=$(sudo cat /sys/devices/virtual/powercap/intel-rapl/intel-rapl\:0/intel-rapl\:0\:2/energy_uj)
  echo $(($pow1-$pow)) >> /home/Debopriya/medusa/Topic_3_Data_collection/All_Data/Useful_Resource/Benign_Application/RealWorld/visual_studio_code/Data/vs_python_run_dram_1_50.csv
  sleep 0.0005
done


#end_time=$(date +%s)
#elapsed=$(( end_time - start_time ))
#echo $elapsed





