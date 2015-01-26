#!/bin/sh

names=(lA lM lP rA rM rP)
x=(-28 -28 -28 28 28 28 0)
y=(-16 -27 -37 -16 -27 -37 -53)
z=(-20 -13 -4 -20 -13 -4 -26)

if [ $# -ne 1 ]; then echo "Usage: $0 <inputFolder (/data/data03/wang/input/20150119_mcsa/preprocessing/fmri/)>"; exit; fi

input="$1"
for i in `ls $input/*.mnc`; do
	for ((j = 0; j < 6; j++)); do
		output=/data/data03/wang/input/20150119_mcsa/fMRIStat/${names[j]}/data/
		info=`echo $i | sed "s:.*subject:subject:" | sed "s:\.mnc*::"`
		mkdir -p $output
		echo "runFmrilm('$i','$output/$info','${names[j]}',${x[j]},${y[j]},${z[j]});"
	done
done
