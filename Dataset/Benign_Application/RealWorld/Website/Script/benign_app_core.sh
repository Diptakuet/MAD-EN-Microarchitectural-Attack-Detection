#!/bin/bash

firefox https://twitter.com/ &
./data_core.sh
sudo pkill -9 firefox
sleep 5s

firefox https://youtube.com/ &
./data_core.sh
sudo pkill -9 firefox
sleep 5s

firefox https://www.instagram.com/ &
./data_core.sh
sudo pkill -9 firefox
sleep 5s

firefox https://www.instagram.com/ &
./data_core.sh
sudo pkill -9 firefox
sleep 5s

firefox https://www.facebook.com/ &
./data_core.sh
sudo pkill -9 firefox
sleep 5s
