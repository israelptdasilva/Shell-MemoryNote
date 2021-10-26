#!/bin/bash

# Date: 07/10/2021
# Author: Israel Pereira Tavares da Silva

dir="data"

if [ -z "$(ls -A $dir)" ] ; then
	printf "No notes found in data directory.\n"
	exit 1
fi

# Sort files by modification date and get the oldest. Note that
# after a file/question is answered correctly it will be touched 
# in order to change its modification date, in other words the 
# file will be send to the back of the line.
filequery=$(ls -tr $dir | head -n1)
filename="${dir}/${filequery}"

clear
printf "$filename\n\n" # Print filename for reference.
./scripts/subject.sh $filename # Print question and options.
./scripts/answer.sh $filename # Print answer prompt. 

# At this point the question was answered correctly so
# send file to the back of the line.
touch "$filename"

# Keep reading questions or exit.
read -p "Read next? yes or no (yes)> "
case $REPLY in
	"no" ) exit 0 ;;
	"yes") ./scripts/read.sh ;;
	*    ) ./scripts/read.sh ;;
esac
