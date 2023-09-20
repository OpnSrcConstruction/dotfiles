#!/bin/bash

echo "Enter first string"
read str1
echo "Enter second string"
read str2
echo $str1
echo $str2
myLen1=${#str1}
myLen2=${#str2}
echo "The length of the first string is: $myLen1."
echo "The length of the second string is: $myLen2."

