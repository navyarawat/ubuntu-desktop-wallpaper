#!/bin/bash

picDir=~/Documents/desktop-wallpapers
mkdir $picDir
rm $picDir/*.jpg $picDir/*.html $picDir/*.txt
user=$(whoami)
cd $picDir
wget http://apod.nasa.gov/apod/astropix.html
a='http://apod.nasa.gov/apod/'
grep 'href="i' astropix.html > temp.txt
b=$(awk -F "\"" '{print $2}' temp.txt) 
c=$a$b
wget $c
imname=$(ls *.jpg)
echo $imname
/users/btech/navyar/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/$imname
cd ~/Desktop