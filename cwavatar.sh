#!/bin/sh

orgfile=$1

if [ ! -f ${orgfile} ]; then
  echo "Not found file: ${orgfile}"
  exit 0;
fi

size_set=`identify profile.png | awk '{print $3}'`
width=`echo ${size_set} | awk '{print $1}'`
height=`echo ${size_set} | awk '{print $2}'`

if [ ${width} -gt ${height} ]; then
  edge=${height}
else
  edge=${width}
fi

icon_edge=`expr ${edge} / 3`

convert ./img/chatwork.png -resize ${icon_edge}x${icon_edge} ./img/chatwork.tmp.png
convert ${orgfile} ./img/chatwork.tmp.png -gravity southwest -composite ./output.png
