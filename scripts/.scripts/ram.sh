#!/bin/sh

free -m | awk 'NR==2 {printf "RAM: %.1f GB ", $7/1000}'