#!/bin/bash
###################################################################### 
#Copyright (C) 2021  Kris Occhipinti
#https://filmsbykris.com

#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.
###################################################################### 

url="http://wttr.in/?format=j1"
json="$(wget -qO- "$url")"

#color library
default=`echo -en "\e[39m"`
red=`echo -en "\e[31m"`
orange=`echo -en "\e[33m"`
blue=`echo -en "\e[34m"`

bold=`echo -en "\e[1m"`
normal=`echo -en "\e[0m"`

temp=$(echo $json|jq -r ."current_condition[0]|(.temp_F)")
humidity=$(echo $json|jq -r ."current_condition[0]|.humidity")
description=$(echo $json|jq -r ."current_condition[0]|(.weatherDesc[0].value)")

if [[ ${temp} > 90 ]]
then
  color=${red}
elif [[ ${temp} > 75 ]]
then
  color=${orange}
elif [[ ${temp} < 50 ]]
then
  color=${blue}
else
  color=""
fi

echo "It is currently ${bold}${description}${normal}"
echo "${color}Temperature: ${temp}℉ ${default}"
echo "Humidity: ${humidity}%"