.PHONY: all clean

CC=g++
CFLAGS=-std=c++11 -Wall -Wextra

CPP_FILES=$(shell find src -type f -name "*.cpp")
OBJECTS=$(patsubst %.cpp,%.o,$(CPP_FILES))
BIN_DIR=bin
EXECUABLE=$(BIN_DIR)/main

all: $(EXECUABLE)

run: $(EXECUABLE)
	./$(EXECUABLE)

$(EXECUABLE): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(EXECUABLE) $^

%.o: %.cpp
	$(CC) $(CFLAGS) -Iinclude -c $< -o $@

debug: CFLAGS+=-g
debug: $(OBJECTS)
	$(CC) $(CFLAGS) -o $(BIN_DIR)/$@-main $^

clean:
	rm -rf $(OBJECTS) $(BIN_DIR)/*
