#!/bin/bash

# Date: 07/10/2021
# Author: Israel Pereira Tavares da Silva

# Directory in which shuffle will occur.
dir="data"

# Random touch to update file timestamp.
for filename in $(ls $dir | sort -R) ; do
	touch data/$filename
done
