#!/bin/sh

listdir()
{
	currentDir=($(ls $1))
	typeset -i lastIndex index
	lastIndex=$((${#currentDir[*]} - 1))

	for ((index=0; index<lastIndex; index++))
	do
			printf "├─%s\n" ${currentDir[$index]}
	done

	printf "└─%s\n" ${currentDir[$lastIndex]}
}

listdir $PWD