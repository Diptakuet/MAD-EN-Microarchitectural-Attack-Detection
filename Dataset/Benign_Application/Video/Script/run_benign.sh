#!/bin/bash

for i in {1..25};
do
  ./benign_app_core_netflix.sh
  sleep 5s
done

for i in {1..25};
do
  ./benign_app_core_hbo.sh
  sleep 5s
done

for i in {1..25};
do
  ./benign_app_core_history.sh
  sleep 5s
done

for i in {1..25};
do
  ./benign_app_core_cnn.sh
  sleep 5s
done


for i in {1..25};
do
  ./benign_app_core_espn.sh
  sleep 5s
done

for i in {1..25};
do
  ./benign_app_dram_netflix.sh
  sleep 5s
done

for i in {1..25};
do
  ./benign_app_dram_hbo.sh
  sleep 5s
done

for i in {1..25};
do
  ./benign_app_dram_history.sh
  sleep 5s
done

for i in {1..25};
do
  ./benign_app_dram_cnn.sh
  sleep 5s
done


for i in {1..25};
do
  ./benign_app_dram_espn.sh
  sleep 5s
done

