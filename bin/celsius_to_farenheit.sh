#!/bin/sh
# shell script to convert celsius temp to farenheit
# taken from: https://www.linuxquestions.org/questions/ubuntu-63/shell-script-to-convert-celsius-to-fahrenheit-929261/

echo "*** Converting between the different temperature scales ***"
echo "1. Convert Celsius temperature into Fahrenheit"
echo "2. Convert Fahrenheit temperatures into Celsius"
echo -n "Select your choice (1-2) : "
read choice

if [ $choice -eq 1 ]
then
echo -n "Enter temperature (C) : "
read tc
# formula Tf=(9/5)*Tc+32
tf=$(echo "scale=2;((9/5) * $tc) + 32" |bc)
echo "$tc C = $tf F"

elif [ $choice -eq 2 ]
then
echo -n "Enter temperature (F) : "
read tf
# formula Tc=(5/9)*(Tf-32)
tc=$(echo "scale=2;(5/9)*($tf-32)"|bc)
echo "$tf = $tc"
else
echo "Please select 1 or 2 only"
exit 1
fi
