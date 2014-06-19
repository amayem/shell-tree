#!/bin/sh

declare -i indentSize=5
	
listdir()
{
	local currentPath=$1
	local currentDir=($(ls $1))
	local -i lastIndex=$((${#currentDir[*]} - 1)) index indents=$2

	for ((index=0; index<lastIndex; index++))
	do
			printf "%.${indents}s├─%s\n" "│ " ${currentDir[$index]}
			if [ -d "$currentPath/${currentDir[$index]}" ]; then
				listdir "$currentPath/${currentDir[$index]}" $(($indents + $indentSize))
			fi	
	done

	if [ $lastIndex -ge 0 ]; then
		printf "%.${indents}s└─%s\n" "│ " ${currentDir[$lastIndex]}
	fi
}

listdir $PWD 0