CXX=g++
CXX_FLAGS=-std=c++17 -O3
TARGET=yae_cowsay
OBJ=build/main.o build/ASCIIPicture.o build/Cloud.o build/Cow.o build/Field.o build/Parser.o


.PHONY: all clean build_dir install uninstall


all: $(TARGET)

clean:
	rm -rf .build

build_dir:
	mkdir -p .build

install:
	install .build/$(TARGET) /usr/local/bin/$(TARGET)
	mkdir -p /usr/share/$(TARGET)
	cp -r clouds /usr/share/$(TARGET)
	cp -r cows /usr/share/$(TARGET)

uninstall:
	rm -f /usr/local/bin/$(TARGET)
	rm -rf /usr/share/$(TARGET)


Parser.o: Parser.cpp Parser.hpp build_dir
	$(CXX) $(CXX_FLAGS) -c Parser.cpp -o .build/Parser.o

Field.o: Field.cpp Field.hpp build_dir
	$(CXX) $(CXX_FLAGS) -c Field.cpp -o .build/Field.o

Cow.o: Cow.cpp Cow.hpp build_dir
	$(CXX) $(CXX_FLAGS) -c Cow.cpp -o .build/Cow.o

Cloud.o: Cloud.cpp Cloud.hpp build_dir
	$(CXX) $(CXX_FLAGS) -c Cloud.cpp -o .build/Cloud.o

ASCIIPicture.o: ASCIIPicture.cpp ASCIIPicture.hpp build_dir
	$(CXX) $(CXX_FLAGS) -c ASCIIPicture.cpp -o .build/ASCIIPicture.o

main.o: main.cpp build_dir
	$(CXX) $(CXX_FLAGS) -c main.cpp -o .build/main.o


$(TARGET): main.o ASCIIPicture.o Cloud.o Cow.o Field.o Parser.o ASCIIPicture.hpp Cloud.hpp Cow.hpp Field.hpp Parser.hpp
	$(CXX) $(CXX_FLAGS) -o .build/$(TARGET) .build/*.o
