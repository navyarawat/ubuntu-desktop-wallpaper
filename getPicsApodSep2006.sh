#!/bin/bash

picDir=~/Documents/desktop-wallpapers-apod-sep-2006
mkdir -p $picDir
cd $picDir
rm *.jpg *.html *.txt
user=$(whoami)
num=$(shuf -i 1-30 -n 1)
if [[ $num =~ ^[0-9]$ ]]; then 
	num=0$num
fi
wget https://apod.nasa.gov/apod/ap0609"$num".html --no-check-certificate
ls
a='http://apod.nasa.gov/apod/'
grep 'href="i' ap0609"$num".html > temp.txt
cat temp.txt
b=$(awk -F "\"" '{print $2}' temp.txt) 
c=$a$b
wget -q $c --no-check-certificate
imgName=$(ls *.jpg)
echo $imgName
/usr/bin/gsettings set org.gnome.desktop.background picture-uri $picDir/$imgName
