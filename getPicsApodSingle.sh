#!/bin/bash

picDir=~/Documents/desktop-wallpapers-apod-single
mkdir -p $picDir
cd $picDir
rm *.jpg *.html *.txt
user=$(whoami)
wget -q http://apod.nasa.gov/apod/astropix.html --no-check-certificate
a='http://apod.nasa.gov/apod/'
grep 'href="i' astropix.html > temp.txt
b=$(awk -F "\"" '{print $2}' temp.txt) 
c=$a$b
wget -q $c --no-check-certificate
imgName=$(ls *.jpg)
echo $imgName
/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/$imgName
cd ~