#!/bin/bash

project_name=""

if [ -z "$1" ]
then
    project_name="default"
else
    project_name=$1
fi

# Compile the program

bash compile.sh $project_name

# Execute the compiled program

cd out/bin
./$project_name

