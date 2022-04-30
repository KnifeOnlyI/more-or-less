#!/bin/bash

project_name=""

if [ -z "$1" ]
then
    project_name="default"
else
    project_name=$1
fi

# Check for out/** directories

[ ! -d "out" ] && mkdir out
[ ! -d "out/tmp" ] && mkdir out/tmp
[ ! -d "out/bin" ] && mkdir out/bin

# Compile the program

nasm -g -felf64 source/main.asm

mv source/*.o out/tmp
ld out/tmp/*.o

mv a.out out/bin
mv out/bin/a.out out/bin/$project_name

