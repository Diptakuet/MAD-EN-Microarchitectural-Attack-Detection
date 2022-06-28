#!/bin/bash

#start_time=$(date +%s)
#dram

for i in {1..3000};
do
  pow=$(sudo cat /sys/devices/virtual/powercap/intel-rapl/intel-rapl\:0/intel-rapl\:0\:2/energy_uj)
  sleep 0.0005
  pow1=$(sudo cat /sys/devices/virtual/powercap/intel-rapl/intel-rapl\:0/intel-rapl\:0\:2/energy_uj)
  echo $(($pow1-$pow)) >> ~/Dataset/Benign_Application/byte/Data/byte_dram_1_50.csv
  sleep 0.0005
done
# Cored

#end_time=$(date +%s)
#elapsed=$(( end_time - start_time ))
#echo $elapsed


<<COMMENT
#start_time=$(date +%s)
for i in {1..3000};
do
  pow=$(sudo cat /sys/devices/virtual/powercap/intel-rapl/intel-rapl\:0/intel-rapl\:0\:0/energy_uj) 
  sleep 0.0005
  pow1=$(sudo cat /sys/devices/virtual/powercap/intel-rapl/intel-rapl\:0/intel-rapl\:0\:0/energy_uj)
  echo $(($pow1-$pow)) >> ~/Dataset/Benign_Application/byte/Data/byte_core_1_50.csv
  sleep 0.0005
done
#end_time=$(date +%s)
#elapsed=$(( end_time - start_time ))
#echo $elapsed
COMMENT




