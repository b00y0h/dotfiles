
# -- Symbols
WORLD_SYMBOL="\uf484"
HOUSE_SYMBOL="\uf7db"
PLAY_SYMBOL="\uf04b"
NETWORK_SYMBOL="\uf819"
NO_NETWORK_SYMBOL="\uf818"
CLOCK_SYMBOL="\uf017"
CALENDAR_SYMBOL="\uf073"
# -- Update --------------------------------------------------------------------
# dotfiles
export HOMEBREW_CASK_OPTS="--appdir=~/Tools"

export NODE_PATH=$HOME/.nvm/lib/node_modules:/usr/local/lib/node_modules

export GOPATH=$HOME/go

export PATH="$PATH::$GOPATH/bin:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# setting the suspend character to ctrl-z
stty susp "^Z"




# https://github.com/bhilburn/powerlevel9k/wiki/Show-Off-Your-Config

prompt_zsh_showSpotifyStatus () {
if pgrep -xq -- "Spotify"
  then

  local color='%F{white}'
  local bgcolor='%K{black}'
  state=`osascript -e 'tell application "Spotify" to player state as string'`;
  if [ $state = "playing" ]; then
    artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`;
    track=`osascript -e 'tell application "Spotify" to name of current track as string'`;

      echo -n "$PLAY_SYMBOL  $artist - $track " ;
  fi

fi

}

zsh_proxy_setting() {
  local symbol=$HOUSE_SYMBOL
  local color='%F{yellow}'

  if [ ${http_proxy} ];
    then
    echo -n "%{$color%}$symbol";
  fi

}

zsh_wifi_signal(){
        local output="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)"
        local airport="$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')"
        local symbol="\ufb09"

        if [[ "${airport}" = "Off" ]]; then
                local color='%F{yellow}'
                echo -n "%{$color%}Wifi Off"
        else
                local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
                local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
                local color='%F{yellow}'

                [[ $speed -gt 100 ]] && color='%F{green}'
                [[ $speed -lt 50 ]] && color='%F{red}'

                echo -n "%{$color%}$symbol $ssid" # removed char not in my PowerLine font
        fi
}


zsh_internet_signal(){
  #source on quality levels - http://www.wireless-nets.com/resources/tutorials/define_SNR_values.html
  #source on signal levels  - http://www.speedguide.net/faq/how-to-read-rssisignal-and-snrnoise-ratings-440

  local signal=$(airport -I | grep agrCtlRSSI | awk '{print $2}' | sed 's/-//g')
  local noise=$(airport -I | grep agrCtlNoise | awk '{print $2}' | sed 's/-//g')
  local SNR=$(bc <<<"scale=2; $signal / $noise")

  local airport=$(airport -I | grep 'AirPort' | awk -F': ' '{print $2}')

  local color='%F{yellow}'
  local symbol=$NETWORK_SYMBOL

  # Excellent Signal (5 bars)
  if [[ ! -z "${signal// }" ]] && [[ $SNR -gt .40 ]] ;
    then color='%F{blue}' ;
  fi

  # Good Signal (3-4 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .40 ]] && [[ $SNR -gt .25 ]] ;
    then color='%F{green}' ;
  fi

  # Low Signal (2 bars)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .25 ]] && [[ $SNR -gt .15 ]] ;
    then color='%F{yellow}' ;
  fi

  # Very Low Signal (1 bar)
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .15 ]] && [[ $SNR -gt .10 ]] ;
    then color='%F{red}' ;
  fi

  # No Signal - No Internet
  if [[ ! -z "${signal// }" ]] && [[ ! $SNR -gt .10 ]] ;
    then color='%F{red}' ;
    symbol=$NO_NETWORK_SYMBOL;
  fi

  # Ethernet Connection (no wifi, hardline)
  if [[ -z "${signal// }" ]] ;
    then color='%F{blue}' ;
    symbol=$NETWORK_SYMBOL ;
  fi

  echo -n "%{$color%}$symbol " # \f1eb is wifi bars
}

# Please only use this battery segment if you have material icons in your nerd font (or font)
# Otherwise, use the font awesome one in "User Segments"
prompt_zsh_battery_level() {
  local percentage1=`pmset -g ps  |  sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p'`
  local percentage=`echo "${percentage1//\%}"`
  local color='%F{red}'
  local symbol="\uf00d"
  pmset -g ps | grep "discharging" > /dev/null
  if [ $? -eq 0 ]; then
    local charging="false";
  else
    local charging="true";
  fi
  if [ $percentage -le 20 ]
  then symbol='\uf579' ; color='%F{red}' ;
    #10%
  elif [ $percentage -gt 19 ] && [ $percentage -le 30 ]
  then symbol="\uf57a" ; color='%F{red}' ;
    #20%
  elif [ $percentage -gt 29 ] && [ $percentage -le 40 ]
  then symbol="\uf57b" ; color='%F{yellow}' ;
    #35%
  elif [ $percentage -gt 39 ] && [ $percentage -le 50 ]
  then symbol="\uf57c" ; color='%F{yellow}' ;
    #45%
  elif [ $percentage -gt 49 ] && [ $percentage -le 60 ]
  then symbol="\uf57d" ; color='%F{blue}' ;
    #55%
  elif [ $percentage -gt 59 ] && [ $percentage -le 70 ]
  then symbol="\uf57e" ; color='%F{blue}' ;
    #65%
  elif [ $percentage -gt 69 ] && [ $percentage -le 80 ]
  then symbol="\uf57f" ; color='%F{blue}' ;
    #75%
  elif [ $percentage -gt 79 ] && [ $percentage -le 90 ]
  then symbol="\uf580" ; color='%F{blue}' ;
    #85%
  elif [ $percentage -gt 89 ] && [ $percentage -le 99 ]
  then symbol="\uf581" ; color='%F{blue}' ;
    #85%
  elif [ $percentage -gt 98 ]
  then symbol="\uf578" ; color='%F{green}' ;
    #100%
  fi
  if [ $charging = "true" ];
  then color='%F{green}'; if [ $percentage -gt 98 ]; then symbol='\uf584'; fi
  fi
  echo -n "%{$color%}$symbol" ;
}


## Run this to get some colors
# ╰ for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"

## POWERLEVEL9K SETTINGS ##
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=false
POWERLEVEL9K_CONTEXT_BACKGROUND='white'
POWERLEVEL9K_CONTEXT_FOREGROUND='white'

# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{blue}\u256D\u2500%f'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{white}%F{black} $CLOCK_SYMBOL `date +%T` %f%k%F{white}%f "
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%f "

POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"

POWERLEVEL9K_CUSTOM_PROXY_SIGNAL="zsh_proxy_setting"
POWERLEVEL9K_CUSTOM_PROXY_SIGNAL_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_PROXY_SIGNAL_FOREGROUND="249"
POWERLEVEL9K_CUSTOM_BATTERY_STATUS="prompt_zsh_battery_level"
POWERLEVEL9K_CUSTOM_BATTERY_STATUS_BACKGROUND="235"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="249"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="249"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="235"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="244"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="244"

POWERLEVEL9K_CUSTOM_SPOTIFY="prompt_zsh_showSpotifyStatus"
POWERLEVEL9K_CUSTOM_SPOTIFY_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_SPOTIFY_FOREGROUND="249"


POWERLEVEL9K_TIME_FORMAT="%D{$CLOCK_SYMBOL %H:%M $CALENDAR_SYMBOL %d.%m.%y}"
POWERLEVEL9K_TIME_BACKGROUND="235"
POWERLEVEL9K_TIME_FOREGROUND="244"

# POWERLEVEL9K_TIME_FORMAT="%D{$CLOCK_SYMBOL %H:%M $CALENDAR_SYMBOL %d.%m.%y}"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( status background_jobs_joined context dir newline vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( custom_proxy_signal custom_wifi_signal_joined disk_usage  custom_spotify time custom_battery_status_joined)


unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1
