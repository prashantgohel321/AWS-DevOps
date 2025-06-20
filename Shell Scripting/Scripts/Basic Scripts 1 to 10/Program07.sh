#!/bin/bash

# This script takes one string input from user and checks whether given string is palindrome or not.

echo "Enter string: "
read str

# reverse the string

# rev_str=$(echo "$str"|rev)

# Manually
length=${#str}
rev=""

for (( i=$length-1; i>=0; i-- ))
do 
    rev="$rev${str:$i:1}"
done

# echo "$rev"

if [ "$str" == "$rev" ]; then
    echo "'$str' is Palindrome."
else
    echo "'$str' is not Palindrome."
fi