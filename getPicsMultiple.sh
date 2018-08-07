#!/bin/bash

picDir=~/Documents/desktop-wallpapers-multi
mkdir $picDir
rm $picDir/*.jpg $picDir/*.html $picDir/*.txt
user=$(whoami)
cd $picDir
wget -q https://www.cse.iitk.ac.in/users/namanv/pics.html
a='https://www.cse.iitk.ac.in/users/namanv'
grep 'href="i' astropix.html > temp.txt
# b=$(awk -F "\"" '{print $2}' temp.txt) 
# c=$a$b
# wget -q $c
# imname=$(ls *.jpg)
# echo $imname
# /users/btech/navyar/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/$imname
# cd ~/Desktop