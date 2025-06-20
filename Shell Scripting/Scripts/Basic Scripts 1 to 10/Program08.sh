#!/bin/bash

# This script prints fibonacci series

echo "Enter number: "
read num

a=0
b=1

echo "Fibonacci Series: "

for (( i=0; i<num; i++ ))
do 
    echo -n "$a "
    fn=$((a + b))
    a=$b
    b=$fn
done
echo