#!/bin/bash

# Date: 07/10/2021
# Author: Israel Pereira Tavares da Silva

file=$1

# Template string to extract content with sed.
a="/^\[ANSWER\]/,/^\[ANSWER\]$/ { /^\[ANSWER\]$/d; /^\[ANSWER\]$/d; p; }"

# Extract answer from file.
answer=`sed -n "$a" $file`

# Read answer and act accordingly.
read -p "> " reply
case "$reply" in
	"$answer") printf "\n  Correct \u2714\n\n" ; exit 1 ;;
	"hint"   ) ./scripts/hint.sh $file ;;
	"answer" ) printf "\n%s\n\n" $answer ;;
	*        ) printf "\n  Wrong \u274c\n\n" ; source $0 ;;
esac 

# If reply is none of the above (return key for examplea) print 
# answer prompt again.
source $0
