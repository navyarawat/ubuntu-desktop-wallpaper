#!/bin/bash

picDir=~/Documents/desktop-wallpapers-nv
mkdir -p $picDir
cd $picDir
rm *.jpg *.html *.txt
user=$(whoami)
wget -q https://www.cse.iitk.ac.in/users/namanv/pics.html --no-check-certificate
a='https://www.cse.iitk.ac.in/users/namanv'
grep -e '.jpg' -e '.png' pics.html > temp.txt
chosenImHref = $(shuf -n 1 temp.txt)
b=$(awk -F "\"" '{print $2}' chosenImRef) 
c=$a"/Wallpapers/"$chosenImHref
wget -q $c --no-check-certificate
imgName=$(ls *.jpg)
echo $imgName
/usr/bin/gsettings set org.gnome.desktop.background picture-uri file:///$(pwd)/$imgName
cd ~