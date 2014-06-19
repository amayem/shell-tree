#!/bin/sh

listdir()
{
	local currentDir=($(ls $1))
	local -i lastIndex=$((${#currentDir[*]} - 1)) index

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