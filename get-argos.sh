#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt-get update
sudo apt-get upgrade
sudo apt -y install git
sudo apt-get --yes --force-yes install cmake libfreeimage-dev libfreeimageplus-dev freeglut3-dev libxi-dev libxmu-dev liblua5.3-dev lua5.3 doxygen graphviz libgraphviz-dev asciidoc  qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools build-essentials
git clone https://github.com/ilpincy/argos3.git argos3
cd argos3 && mkdir build_simulator && cd build_simulator
cmake ../src && make && make doc
cd ..
git clone https://github.com/lukey11-zz/Foraging-Swarm-Robot-ARGoS Foraging-Swarm-Robot-ARGoS
cd Foraging-Swarm-Robot-ARGoS/CPFA
echo  "/usr/local/lib" | sudo tee -a /etc/ld.so.conf
sudo ldconfig
./build.sh
argos3 -c experiments/Random_CPFA_r104_tag1024_20by20.xml
