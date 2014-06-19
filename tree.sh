#!/bin/sh

currentDir=($(ls))
	
for item in ${currentDir[*]}
do
	printf "%s\n" $item
done