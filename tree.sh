#!/bin/sh

declare -i indentSize=5

listdir()
{
	local currentDir=($(ls $1))
	local -i lastIndex=$((${#currentDir[*]} - 1)) index indents=$2

	for ((index=0; index<lastIndex; index++))
	do
			printf "%.${indents}s├─%s\n" " " ${currentDir[$index]}
			if [ -d ${currentDir[$index]} ]; then
				listdir ${currentDir[$index]} $(($indents + $indentSize))
			fi	
	done

	printf "%.${indents}s└─%s\n" " " ${currentDir[$lastIndex]}
}

listdir $PWD 0