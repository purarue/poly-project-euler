CXX=g++
CXXFLAGS=-std=c++17 -Wall -O2
EXECUTABLE_NAME=main
SOURCE=main.cpp
OBJECT=main.o

all: main run

run:
	./main

main: $(OBJECT)
	$(CXX) $(OBJECT) -o $(EXECUTABLE_NAME)

main.o: $(SOURCE)
	$(CXX) $(CXXFLAGS) -c $(SOURCE)

clean:
	rm $(EXECUTABLE_NAME) $(OBJECT)

