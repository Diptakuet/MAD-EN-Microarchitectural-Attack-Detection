#!/bin/bash

for i in {1..1};
do
  ./benign_app.sh
  #sudo killall phoronix-test-suit
done

sleep 10s

cd ~/medusa/Topic_3_Data_collection/All_Data/Useful_Resource/Benign_Application/System/Test_new/intel_mpi/Script/

./run_benign.sh

sleep 10s

cd ~/medusa/Topic_3_Data_collection/All_Data/Useful_Resource/Benign_Application/System/Test_new/natron/Script/

./run_benign.sh




