#!/bin/bash

category=

function list {
	IFS=$'\n'
	count=0
	local categories=`cut -d: -f2 scripts/categories`
	for category in $categories ; do
		printf "$count: $category\n"
		(( count++ ))
	done
}

function set_category {
	if [ "$1" == "" ] ; then
		return 0
	fi
	local code=$1
	(( code++ ))
	#local categories=`cut -d: -f1,2,3 scripts/categories`
	local categories=`cat scripts/categories`
  category=$(echo "$categories" | sed "${code}q;d" 2> /dev/null)
}

function read_code {
	read -p "> (use l to see all codes) " code
	case $code in
		"l") list ; read_code ;;
		*  ) 
				set_category $code
				if [ -z "$category" ] ; then
					printf "Not a valid code \n"
					read_code
				fi ;;
	esac	
}

if [ ! -z scripts/categories ] ; then
	clear
	printf "Enter category code:\n\n"	
	read_code
fi

