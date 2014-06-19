#!/bin/sh

currentDir=($(ls))
typeset -i lastIndex index
lastIndex=$((${#currentDir[*]} - 1))

for index in ${!currentDir[*]}
do
	if [ "$index" -lt "$lastIndex" ]; then
		printf "├─%s\n" ${currentDir[$index]}
	else
		printf "└─%s\n" ${currentDir[$index]}
	fi
done