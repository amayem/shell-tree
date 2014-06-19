#!/bin/sh

indent()
{
	for ((n=0; n<indentSize; n++))
	do
		printf " "
	done
}

declare -i indentSize=1
declare -a levelFlags=(1)

listdir()
{
	local currentPath=$1
	local -a currentDir=($(ls $1)) levelFlags=(${levelFlags[@]})
	local -i lastIndex=$((${#currentDir[*]} - 1)) index level=$2 nextLevel=$2+1

	for ((index=0; index<lastIndex; index++))
	do
		for ((j=0; j<level; j++))
		do
			if [ "${levelFlags[$j]}" == "1" ]; then
				printf "│"
				indent
			else
				printf " " 
				indent
			fi
		done
		printf "├─%s\n" ${currentDir[$index]}
		if [ -d "$currentPath/${currentDir[$index]}" ]; then
			levelFlags[$level]=1
			listdir "$currentPath/${currentDir[$index]}" $nextLevel
		fi	
	done

	if [ $lastIndex -ge 0 ]; then
		for ((j=0; j<level; j++))
		do
			if [ "${levelFlags[$j]}" == "1" ]; then
				printf "│"
				indent
			else
				printf " " 
				indent
			fi
		done
		printf "└─%s\n" ${currentDir[$lastIndex]}
		if [ -d "$currentPath/${currentDir[$index]}" ]; then
			levelFlags[$level]=0
			listdir "$currentPath/${currentDir[$index]}" $nextLevel
		fi
	fi
}
listdir $PWD 0