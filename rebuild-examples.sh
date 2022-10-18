#!/bin/bash
if [[ "${PWD##*/}" == "build" ]]; then
    cd ..
fi

if [[ "${PWD##*/}" == "argos3-examples" ]]; then
    rm -rf build
    mkdir build && cd build
    cmake -DCMAKE_BUILD_TYPE=Debug .. && make
    cd ..
else
    echo "Please run this in your local clone of argos3-examples"
fi
