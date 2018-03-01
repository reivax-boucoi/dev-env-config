#! /bin/bash

sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt update
sudo apt upgrade -y
sudo apt install build-essential git cmake gcc-6 g++-6 gcc-7 g++-7

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 100 --slave /usr/bin/g++ g++ /usr/bin/g++-6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 100 --slave /usr/bin/g++ g++ /usr/bin/g++-7
