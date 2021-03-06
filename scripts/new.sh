#!/bin/bash

# Date: 07/10/2021
# Author: Israel Pereira Tavares da Silva 

clear 

# Enter a short question whose answer is an
# important memory note. Don't try to puzzle yourself
# with a tricky question, instead ask questions that 
# act as a memory note.
printf "Question: \n"
read -r subject

# Here you can enter multiple options with one or more 
# correct answers (multiple choice questions) or leave it
# blank in case the of a write-in type of question.
printf "\nOptions (Press return to skip): \n"
COUNTER=1
while read -p "$COUNTER - " line
do
	[ -z "$line" ] && break # Skipping one line breaks the loop.
	if [ ! -z "$options" ] ; then
		options="$options\n" # Add new line only when option is set (cosmetic).
	fi
	options="$options$line"
	(( COUNTER++ )) # Counter value is appended before each option.
done

# Give a hint to help your understand the
# question. Use hints to give more contenxt to the question.
printf "\n"
printf "Add a hint: \n"
read hint

# Write the answer. For multiple choice questions 
# only write the numbers without any extra 
# characters (123), otherwise answer should be succinct.
printf "\n"
printf "Add a answer: \n"
read answer

# Create uniquely named file.
#filename=$(md5sum <<< $RANDOM | cut -d " " -f1).txt
filename=$(ls data | wc -l).txt
touch $filename

# These tags group user input in sections so that
# the sections can be extracted (with sed or grep) and
# read individually.
SUBJECT="[SUBJECT]"
OPTIONS="[OPTIONS]"
HINT="[HINT]"
ANSWER="[ANSWER]"

# Append user input to file. Use the tags above to
# split content in the appropriate sections.
echo -e "$SUBJECT\n$subject\n$SUBJECT" >> $filename
echo -e "$OPTIONS\n$options\n$OPTIONS" >> $filename
echo -e "$HINT\n$hint\n$HINT" >> $filename
echo -e "$ANSWER\n$answer\n$ANSWER" >> $filename

$(mv "$filename" data)
