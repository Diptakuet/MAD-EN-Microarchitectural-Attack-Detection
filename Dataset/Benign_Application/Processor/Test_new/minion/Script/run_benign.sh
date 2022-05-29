#!/bin/bash

for i in {1..5};
do
  ./benign_app.sh
  sleep 5s
  sudo killall phoronix-test-suit
done

sleep 5s

cd ~/medusa/Topic_3_Data_collection/All_Data/Useful_Resource/Benign_Application/Processor/Test_new/himeno/Script/

./run_benign.sh
