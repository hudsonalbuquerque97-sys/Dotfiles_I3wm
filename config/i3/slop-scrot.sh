#!/bin/sh

geom=$(slop -f "%x,%y,%w,%h")

if [ -n "$geom" ]; then
    scrot -a "$geom" ~/Imagens/$(date +%F_%H-%M-%S).png
fi
