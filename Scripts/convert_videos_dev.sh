#!/usr/bin/bash

while getopts 'hf:o:n:' OPTION; do
  case "$OPTION" in
    h)
      echo "this is the help option"
      ;;
    f)
      file_type=$OPTARG
      ;;
    o)
      output_type=$OPTARG
      ;;
    n)
      N=$OPTARG
      ;;
    ?)
      echo "script usage: $(basename \$0) [-h] [-f file_type] [-o output_type]" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

convert_video () {
  ffmpeg -nostdin -i "$1" ${1%.*}.$output_type
}

if [ -v file_type ] && [ -v output_type ];then
  current_time_millis=$(($(date +%s%N) / 1000000))
  for file in *.$file_type; do
    mv $file "$current_time_millis.$file_type"
    current_time_millis=$(($current_time_millis + 1))
  done
  N=24
  for file in *.$file_type; do
    convert_video $file
    if [[ $(jobs -r -p | wc -l) -ge $N ]]; then
      wait -n
    fi
  done
  wait

else
  echo "must provide arguments for -f and -o"
  exit 1
fi

