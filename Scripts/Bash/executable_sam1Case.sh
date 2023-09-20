#!/bin/bash
# prompt user to enter a vowel

echo "Please ENTER a vowel:(A,E,I,O,U)"

read charac

case "$charac" in 
	"a"|"A") echo "You have typed a vowel." ;;
	"e"|"E") echo "You have typed a vowel." ;;
	"i"|"I") echo "You have typed a vowel." ;;
	"o"|"O") echo "You have typed a vowel." ;;
	"u"|"U") echo "You have typed a vowel." ;;
	*)	echo "You typed a consonant, number, or special character; dummy!"
esac
exit 0
