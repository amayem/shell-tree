#!/bin/sh

listdir()
{
	currentDir=($(ls $1))
	typeset -i lastIndex index
	lastIndex=$((${#currentDir[*]} - 1))

	for ((index=0; index<lastIndex; index++))
	do
			printf "├─%s\n" ${currentDir[$index]}
			if [ -d ${currentDir[$index]} ]; then
				listdir ${currentDir[$index]}
			fi	
	done

	printf "└─%s\n" ${currentDir[$lastIndex]}
}

listdir $PWD