#!/bin/bash

for i in {1..10};
do
  ./benign_app.sh
  sudo killall phoronix-test-suit
done

sleep 10s

cd ~/medusa/Topic_3_Data_collection/All_Data/Useful_Resource/Benign_Application/Processor/Test_new/cp2k/Script/

./run_benign.sh

sleep 10s

cd ~/medusa/Topic_3_Data_collection/All_Data/Useful_Resource/Benign_Application/Processor/Test_new/cryptopp/Script/

./run_benign.sh


sleep 10s

cd ~/medusa/Topic_3_Data_collection/All_Data/Useful_Resource/Benign_Application/Processor/Test_new/fftw/Script/

./run_benign.sh

sleep 10s

cd ~/medusa/Topic_3_Data_collection/All_Data/Useful_Resource/Benign_Application/Processor/Test_new/gcrypt/Script/

./run_benign.sh




