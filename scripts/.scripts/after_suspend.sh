#!/bin/sh

xsecurelock

i=1
end_of_loop=10

while [ "$i" -lt "$end_of_loop" ]; do
    pkill -RTMIN+$i dwmblocks
    i=$((i + 1))
done