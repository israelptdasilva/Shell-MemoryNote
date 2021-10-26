#!/bin/bash

# Date: 07/10/2021
# Author: Israel Pereira Tavares da Silva

file=$1

# Template string to extract content with sed.
h="/^\[HINT\]/,/^\[HINT\]$/ { /^\[HINT\]$/d; /^\[HINT\]$/d; p; }"

# Extract hint from file.
hint=`sed -n "$h" $file`

# Print hint.
printf "\n%s\n\n" "$hint"
