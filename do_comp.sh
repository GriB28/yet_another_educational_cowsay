#!/bin/bash

if [[ ! -f "build/" ]]; then
	mkdir build/
fi


g++ ASCIIPicture.cpp -E -o build/ASCIIPicture_.cpp
g++ Cloud.cpp -E -o build/Cloud_.cpp
g++ Cow.cpp -E -o build/Cow_.cpp
g++ Field.cpp -E -o build/Field_.cpp
g++ main.cpp -E -o build/main_.cpp
g++ Parser.cpp -E -o build/Parser_.cpp

g++ build/ASCIIPicture_.cpp -c -o build/ASCIIPicture.o
g++ build/Cloud_.cpp -c -o build/Cloud.o
g++ build/Cow_.cpp -c -o build/Cow.o
g++ build/Field_.cpp -c -o build/Field.o
g++ build/main_.cpp -c -o build/main.o
g++ build/Parser_.cpp -c -o build/Parser.o

g++ build/*.o -o cowsay_t