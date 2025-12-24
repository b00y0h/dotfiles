#!/bin/bash
set -eux

hash ffmpeg 2>/dev/null || { echo >&2 "I require ffmpeg but it's not installed. Install ffmpeg with 'brew install ffmpeg'  Aborting."; exit 1; }
hash rmtrash 2>/dev/null || { echo >&2 "I require rmtrash but it's not installed. Install ffmpeg with 'brew install rmtrash'  Aborting."; exit 1; }


#set datetime stamp for directory
DIR=$HOME/Screenshots/daily
FILES=$(find $DIR/* -type d)
DAILYMOVIES=~/Screenshots/daily_movies
TODAYDATE=$(date +%Y%m%d)
TODAYDIR=$DIR/$TODAYDATE
# echo "TODAYDATE: $TODAYDATE"
# echo "DIR: $DIR"
# echo "FILES: $FILES"
# echo "TODAYDIR: $TODAYDIR"
# echo "DAILYMOVIES: $DAILYMOVIES"


#### FFMPEG options

FRAMERATE="25"
CODEC="libx264"
OPTIONS="scale=iw*1:ih*1,format=yuv420p"

# setup
mkdir -p $DAILYMOVIES


# the leg work
doTheEncoding() {
  for d in $FILES ; do

    if [ "$d" != "$TODAYDIR" ]
    then
    echo "but "
    folderDate=$(basename $d)
    echo "folderDate: $folderDate"
    multiScreens=("$d"/*-m.png)
    singleScreen=("$d"/*-s-0.png)

      if [ -e $multiScreens ]
        then
        TOT_FR=${#multiScreens[*]}
        echo 'Encoding Multiscreen video'
        /usr/local/bin/ffmpeg -y -stats -framerate $FRAMERATE -pattern_type glob -i "$d/*-m.png" -c:v $CODEC -vf $OPTIONS $DAILYMOVIES/$folderDate-m.mp4
      fi

      if [ -e $singleScreen ]
        then
        TOT_FR=${#multiScreens[*]}
        echo 'Encoding Single video'
        /usr/local/bin/ffmpeg -y -stats -framerate $FRAMERATE -pattern_type glob -i "$d/*-s-0.png" -c:v $CODEC -vf $OPTIONS $DAILYMOVIES/$folderDate-s.mp4

      fi

      # send notification to osx
      osascript -e 'display notification "Video '$folderDate' is complete" with title "Encoding complete"'

      /usr/local/bin/rmtrash $d

    fi

  done
}


# let's check if there's something to work on
if [  -z "$FILES" ]
  then
  echo "empty"
      osascript -e 'display notification "There were no files in the directory to parse." with title "No siree"'
else
  echo "not empty"

  doTheEncoding

fi
