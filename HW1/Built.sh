gcc -c src/m1/m1.c -Isrc/m1/include/ -o output/m1c.o
gcc -c src/m2/m2.c -Isrc/m2/include/ -o output/m2c.o
gcc -c m.c -Iinclude/ -Isrc/m1/include/ -Isrc/m2/include/ -o output/mc.o

gcc output/mc.o output/m1c.o output/m2c.o -o mProgram
./mProgram
