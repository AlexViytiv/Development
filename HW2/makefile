C=gcc
PATH1=src/m1
PATH2=src/m2
out=output

INSTALL=/usr/local/bin

TARGET=mProgram
OBJECTS=$(out)/m.o $(out)/m1.o $(out)/m2.o
ASM=$(out)/m.s $(out)/m1.s $(out)/m2.s
INCLUDES=-Iinclude/ -I$(PATH1)/include/ -I$(PATH2)/include/

.PHONY: clean uninstall

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(C) $^ -o $(TARGET)

$(out)/m.o: $(out)/m.s
	$(C) -c $< -I$(out) -o $(out)/m.o

$(out)/m1.o: $(out)/m1.s
	$(C) -c $< -I$(out) -o $(out)/m1.o

$(out)/m2.o: $(out)/m2.s
	$(C) -c $< -I$(out) -o $(out)/m2.o

$(out)/m.s: m.c
	$(C) -S $< $(INCLUDES) -o $(out)/m.s

$(out)/m1.s: $(PATH1)/m1.c
	$(C) -S $< $(INCLUDES) -o $(out)/m1.s

$(out)/m2.s: $(PATH2)/m2.c
	$(C) -S $< $(INCLUDES) -o $(out)/m2.s

install:
	sudo mkdir -p 			$(INSTALL)
	sudo install -D $(TARGET) 	$(INSTALL)

install_strip:
	sudo mkdir -p 			$(INSTALL)
	sudo install -D -s $(TARGET) $(INSTALL)

uninstall:
	sudo rm $(INSTALL)/$(TARGET)

clean:
	sudo rm -f $(out)/*.o $(out)/*.s $(TARGET) 

