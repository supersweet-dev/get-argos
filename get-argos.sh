#!/bin/bash

Help() {
   # Display Help
   echo "this will compile argos for you. place it and run it wherever you want your argos3 folder.\nyou should like... read this file so you can figure out how it works and how to fix stuff if you use clean when you shouldn't have."
   echo
   echo "Syntax: ./get-argos [-h|i|c|w]"
   echo "options:"
   echo "h     you just used this"
   echo "i     get argos"
   echo "c     nuke everything this did, run at your own risk"
   echo "w     use this if you're on windows wsl"
   echo
}
Clean() {
   sudo rm -rf argos3

   if [[ "$OSTYPE" == "darwin"* ]]; then
      echo "I'm not gonna clean your Mac installs... at least homebrew is cleaner than anything."
   else
      sudo apt --purge remove git build-essential
      sudo apt-get --purge remove cmake libfreeimage-dev libfreeimageplus-dev freeglut3-dev libxi-dev libxmu-dev liblua5.3-dev lua5.3 doxygen graphviz libgraphviz-dev asciidoc qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools
   fi

}

Wsl() {
   echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty main restricted universe\ndeb-src http://us.archive.ubuntu.com/ubuntu/ trusty main\ndeb http://us.archive.ubuntu.com/ubuntu/ trusty-security main restricted universe\ndeb http://us.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe\ndeb http://us.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe" | sudo tee -a /etc/apt/sources.list
   export DISPLAY="$(grep nameserver /etc/resolv.conf | sed 's/nameserver //'):0" >>~/.bashrc
   source ~/.bashrc
   sudo apt install x11-apps
}
InstallArgos() {

   if [[ "$OSTYPE" == "darwin"* ]]; then
      brew install pkg-config cmake libpng freeimage lua qt docbook asciidoc graphviz doxygen
   else
      sudo apt update
      sudo apt --yes --force-yes upgrade
      sudo apt-get update
      sudo apt-get --yes --force-yes upgrade
      sudo apt --yes --force-yes install git build-essential
      sudo apt-get --yes --force-yes install cmake libfreeimage-dev libfreeimageplus-dev freeglut3-dev libxi-dev libxmu-dev liblua5.3-dev lua5.3 doxygen graphviz libgraphviz-dev asciidoc qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools google-perftools libgoogle-perftools4
      echo "/usr/local/lib" | sudo tee -a /etc/ld.so.conf
      sudo ldconfig
      export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/ >>~/.bashrc
      source ~/.bashrc
   fi

   git clone https://github.com/ilpincy/argos3.git argos3
   cd argos3 && mkdir build_simulator && cd build_simulator
   cmake ../src && make && make doc
   sudo make install
   cd ..
   git clone https://github.com/ilpincy/argos3-examples.git argos3-examples
   cd argos3-examples
   mkdir build && cd build
   cmake -DCMAKE_BUILD_TYPE=Debug .. && make
   cd ..
   argos3 -c experiments/diffusion_10.argos
}

while getopts ":cwih" option; do
   case $option in
   c) # nuke everything cept x11-apps
      Clean
      exit
      ;;
   w)
      Wsl #necessary wsl pre-setup
      exit
      ;;
   i)
      InstallArgos #this is what you've been waiting for
      exit
      ;;
   h) # display Help
      Help
      exit
      ;;
   \?) # incorrect option
      echo "Error: Invalid option"
      exit
      ;;
   esac
done
