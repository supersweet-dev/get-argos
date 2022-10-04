#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt install --y git
sudo apt-get install --y cmake libfreeimage-dev libfreeimageplus-dev qt5-default freeglut3-dev libxi-dev libxmu-dev liblua5.3-dev lua5.3 doxygen graphviz libgraphviz-dev asciidoc  qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools build-essentials
wget "https://drive.google.com/file/d/1oO2lb2LuLq4IrZmNMiJurWTotHp_pDye"
sudo apt install ./argos3_simulator-3.0.0-x86_64-beta59.deb
git clone https://github.com/lukey11-zz/Foraging-Swarm-Robot-ARGoS
cd Foraging-Swarm-Robot-ARGoS/CPFA
echo  "/usr/local/lib" | sudo tee -a /etc/ld.so.conf
sudo ldconfig
./build.sh
argos3 -c experiments/Random_CPFA_r104_tag1024_20by20.xml
