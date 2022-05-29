#!/bin/bash

for i in {1..5};
do
  ./benign_app.sh
  sudo killall phoronix-test-suit
done

sleep 5s

cd ~/medusa/Topic_3_Data_collection/All_Data/Useful_Resource/Benign_Application/Processor/Test_new/blosc/Script/

./run_benign.sh

sleep 5s

cd ~/medusa/Topic_3_Data_collection/All_Data/Useful_Resource/Benign_Application/Processor/Test_new/blake2/Script/

./run_benign.sh
