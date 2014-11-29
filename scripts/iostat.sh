#!/bin/sh

#while [ 1 ]; do
iostat -xn 58  2 | sed -n 'H; /extended device statistics/h; ${g;p;}' > /tmp/iostat.tmp.new
mv /tmp/iostat.tmp.new /tmp/iostat.tmp
#done

