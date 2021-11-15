#!/bin/bash

# Date: 07/10/2021
# Author: Israel Pereira Tavares da Silva

# The file to extract the subject from.
file=$1

# Change the default field separator to be based on new lines. This is
# necessary to work with multiple choice questions.
IFS=$'\n'	

# Template strings to extract content with sed.
s="/^\[SUBJECT\]/,/^\[SUBJECT\]$/ { /^\[SUBJECT\]$/d; /^\[SUBJECT\]$/d; p; }"
o="/^\[OPTIONS\]/,/^\[OPTIONS\]$/ { /^\[OPTIONS\]$/d; /^\[OPTIONS\]$/d; p; }"

# Extract question and options.
subject=`sed -n "$s" $file`
options=`sed -n "$o" $file`

printf "\n%s\n\n" "$subject" # Print question.

# Print each option, if available, prefixed by a number.
counter=1
for o in $options; do
	echo "$counter - $o"
	(( counter++ ))
done
printf "\n"

