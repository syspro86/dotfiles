#!/bin/bash

# cuda 11.3 은 gcc 10 까지 지원
sudo apt install gcc-10 g++-10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 30
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 30

# test 
# nvidia-smi

# install cuda
wget https://developer.download.nvidia.com/compute/cuda/11.3.1/local_installers/cuda_11.3.1_465.19.01_linux.run
sudo sh cuda_11.3.1_465.19.01_linux.run

# sudo apt install wget git python3 python3-venv libgl1 libglib2.0-0

