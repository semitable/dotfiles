img=/tmp/i3lock.png

scrot -o $img
convert $img -scale 10% -blur 0x2.5 -resize 1000% $img

i3lock -i $img
