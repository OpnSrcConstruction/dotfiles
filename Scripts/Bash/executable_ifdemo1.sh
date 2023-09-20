#!/bin/bash
file=$1
if [ -f "$file" ]
then
  echo "File $file exists"
else
  echo "File $file doesn't exist"
fi