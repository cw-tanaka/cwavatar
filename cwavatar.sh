#!/bin/sh

orgfile=$1
output_file=$2

if [ ! -f ${orgfile} ]; then
  echo "Not found file: ${orgfile}"
  exit 0;
fi

if [ "${output_file}" = "" ]; then
  output_file="./output.png"
fi

size_set=`identify ${orgfile} | awk '{print $3}'`
width=`echo ${size_set} | awk -F'x' '{print $1}'`
height=`echo ${size_set} | awk -F'x' '{print $2}'`

if [ ${width} -gt ${height} ]; then
  edge=${height}
else
  edge=${width}
fi

icon_edge=`expr ${edge} / 3`

convert ./img/chatwork.png -resize ${icon_edge}x${icon_edge} ./img/chatwork.tmp.png
convert ${orgfile} ./img/chatwork.tmp.png -gravity southwest -composite ${output_file}
