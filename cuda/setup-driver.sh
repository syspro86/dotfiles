#!/bin/bash

# 설치가능한 드라이버 목록
ubuntu-drivers devices

# 자동 설치
# sudo ubuntu-drivers autoinstall

# 특정버전 설치
sudo apt install nvidia-driver-495 

sudo apt-get install dkms nvidia-modprobe
sudo apt update
sudo apt upgrade

echo "reboot!!"

