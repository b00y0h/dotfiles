#!/bin/bash
# set -ux

SLEEPINT=2; #how long to wait between screenshots
MAXTIME=11; #how long to wait before not grabbing a screenshot?

IFS=$'\n\t'

input=${1:-}

# check if installed

# brew bundle --file=- <<-EOS
# brew "ImageMagick"
# brew "rmtrash"
# brew "ffmpeg"
# EOS


# grab idle time in seconds
idle=$(($(ioreg -c IOHIDSystem | sed -e '/HIDIdleTime/ !{ d' -e 't' -e '}' -e 's/.* = //g' -e 'q') / 1000000000));

#just a bit o color
RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

function get_filenames () {
    # echo "Parameter #1 is $1"
    local ti=0
    local outp=()

    while [[ $ti -lt $1 ]]
      do
        if [ "$displays" -eq 1 ]; then
          outp=("${outp[@]}" "${vardate}-s-${ti}.png")
        else
          outp=("${outp[@]}" "${vardate}-m-${ti}.png")
        fi
      (( ti++ ))
      done
    echo ${outp[@]}
}


function take_screenshot () {
  local filenames=$(get_filenames $displays)

  printf "${GREEN}Capturing screenshot...${NC} (${displays} displays detected)\\n"
  eval "screencapture -t png -x ${filenames}"

  printf "\\nScreen shot files:\\n"
    for item in ${filenames[*]}
      do
          printf "\\n   ${PURPLE} $item ${NC} %s\\n"
      done
}


function recordScreen() {

  mkdir -p ~/Screenshots/daily


  displays=''
  vardate=''

  #the meat of the function
  while true; do

    #set datetime stamp for directory
    local dir
    dir=$(date +%Y%m%d)

    #set datetime stamp for filename
    local vardate
    vardate=$(date "+%Y-%m-%d-%H_%M_%S")

    #number of screens
    displays=$(system_profiler SPDisplaysDataType | grep -c Resolution)

    #make dir if not already made and cd into it
    mkdir -p "$HOME/Screenshots/daily/$dir" && cd "$HOME/Screenshots/daily/$dir" || exit

    # Clear the screen.
    clear

    # if idle time is less than the max time then we can take a pic
    if [ "$idle" -lt "$MAXTIME" ]; then
      # take a screen capture of all displays
      take_screenshot

      local filenames=$(get_filenames $displays)
      # if there are multiple files, combine them
      if [ "$displays" -gt 1 ]; then
       # combine multiple images into one
        printf "\\nMerging files into >> ${GREEN}$vardate-m.png${NC}\n\n"
        eval "convert +append "${filenames[@]}" "$vardate-m.png" && /bin/rm "${filenames[*]}""
      fi


    fi

  echo ''

  countdownTimer

  #update idle time
  idle=$(idleCount)
  done
}



function countdownTimer () {
  #countdown timer
  hour=0
  min=0
  sec=$SLEEPINT
  while [ $hour -ge 0 ]; do
    while [ $min -ge 0 ]; do
      while [ $sec -ge 0 ]; do

        if [ "$idle" -gt "$MAXTIME" ]; then
          echo -ne  "Countdown till next attempt: $sec. You're getting lazy! (Idle time: ${RED}$(show_time $idle)${NC} secs). \033[0K\r"
        else
          echo -ne  "Countdown till next screenshot: ${CYAN}$sec${NC}. \033[0K\r"
        fi
              #update the idle count
              idle=$(idleCount)
              let "sec=sec-1"
              sleep 1
      done
      sec=59
      let "min=min-1"
    done
    min=59
    let "hour=hour-1"
  done
}


function idleCount() {
  # return time (in seconds) since last movement on computer
  local idleTime=$(( $(ioreg -c IOHIDSystem | sed -e '/HIDIdleTime/ !{ d' -e 't' -e '}' -e 's/.* = //g' -e 'q') / 1000000000));
  echo $idleTime
}

function show_time () {
    num=$1
    min=0
    hour=0
    # day=0
    if((num>59));then
        ((sec=num%60))
        ((num=num/60))
        if((num>59));then
            ((min=num%60))
            ((num=num/60))
            if((num>23));then
                ((hour=num%24))
                # ((day=num/24))
            else
                ((hour=num))
            fi
        else
            ((min=num))
        fi
    else
        ((sec=num))
    fi
    # echo "$day"d "$hour"h "$min"m "$sec"s
    echo "$hour"h "$min"m "$sec"s
}

function listVideoFolders() {
  clear
  # TOT_FR=''
  FILES="$HOME/Screenshots/daily/*"
  printf "Please select folder:\\n"
  select d in $FILES; do test -n "$d" && break; echo ">>> Invalid Selection"; done
  echo "$d"
  cd "$d" && pwd
}

function makeAllVideos() {
  FILES=("$HOME/Screenshots/daily/*")
    local dir
    dir=$(date +%Y%m%d)

for index in "${!FILES[@]}" ; do [[ ${FILES[$index]} =~ "$dir" ]] && unset -v 'FILES[$index]' ; done

  for f in ${FILES[@]}
    do
      echo "$f"
      cd "$f"
      makeScreenVideo
    done
}

function chooseAction() {
  clear
  echo "Do you want to encode all or just one?"
  select yn in "All" "One" "None"; do
      case $yn in
          All ) makeAllVideos; break;;
          One ) makeOneScreenVideo; break;;
          None ) break;;
      esac
  done
}


function makeOneScreenVideo() {
  listVideoFolders
  makeScreenVideo
}

function makeScreenVideo() {
  # find . -name "*.png" -size -2k -delete
  date=${PWD##*/};
  d=${PWD}
  DAILYMOVIES=~/Screenshots/daily_movies;
  mkdir -p $DAILYMOVIES
  local multiScreens=(*-m.png)
  local singleScreen=(*-s-0.png)
  echo "multiScreens size: ${#multiScreens[*]}"
  echo "singleScreen size: ${#singleScreen[*]}"
  if [[ -e "${multiScreens[0]}" ]]
    then
    # TOT_FR=${#multiScreens[*]}
    echo 'Multiscreen video found'
    ffmpeg -framerate 15 -pattern_type glob -i '*-m.png' -v quiet  -stats -y -c:v libx264 -pix_fmt yuv420p -vf "drawtext=fontfile=/Library/Fonts/Arial.ttf:text='$date':fontcolor=black:fontsize=172:x=w-tw:y=h-th" "$DAILYMOVIES/$date-m.mp4"
  fi

  if [[ -e "${singleScreen[0]}" ]]
    then
    # TOT_FR=${#multiScreens[*]}
    echo 'Single video found'
    ffmpeg -framerate 15 -pattern_type glob -i '*-s-0.png' -v quiet -stats -y -c:v libx264 -pix_fmt yuv420p -vf "drawtext=fontfile=/Library/Fonts/Arial.ttf:text='$date':fontcolor=black:fontsize=172:x=w-tw:y=h-th" "$DAILYMOVIES/$date-s.mp4"
  fi
  cd .. || return;
  rmtrash "$d";
}

function parentName() {
  date=${PWD##*/};
  echo "$date";
}

# if no arguments given,
if [[ -z "$input" ]]
then
   recordScreen
elif [ "$1" == "--video" ] || [ "$1" == "-V" ] || [ "$1" == "-v" ]
then
    echo "making video"
        chooseAction
else

    echo "Unknown argument: $1"
    echo "Usage $0 [-combine ouputname.mp4]"
fi
