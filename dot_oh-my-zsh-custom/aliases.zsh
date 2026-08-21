# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#

#DDEV stuffs
alias ddrush="ddev drush"
alias dcomposer="ddev composer"
alias dstart="ddev start; ddev auth ssh; ddev launch"

alias ys='yarn start'
alias vim=nvim
alias x='exit'

alias gstat='git status -s'
# ignore *-lock files on git diff
alias gd="git diff -- ':!package-lock.json' ':!yarn.lock'"
# install trash, (either from the macports or by the brew.)
alias del="trash"       # del / trash are shorter than trash

alias rm="echo Use 'del', or the full path i.e. '/bin/rm'"

# noblob for homebrew youtube-dl
# alias youtube-dl='noglob youtube-dl'

alias ssbg='nohup ~/.oh-my-zsh-custom/screenshot.sh </dev/null &'
alias ss='~/.oh-my-zsh-custom/screenshot.sh'

alias weather='curl http://wttr.in/Goochland\?u'
alias weather2=ansiweather
# alias weather='wego'

alias pi='echo "scale=1000;4*a(1)" | BC_LINE_LENGTH=1004 bc -l'

# alias c="pygmentize -O encoding=UTF-8 -g"

function server() {
    local port
    port="${1:-8000}"
    open "http://localhost:${port}/"
    python3 -m http.server "$port"
}

function ffmpeg-sidebyside() {
    mkdir -p out
    local leftfilename=$(basename "$1")
    local rightfilename=$(basename "$2")
    leftfilename="${leftfilename%.*}"
    rightfilename="${rightfilename%.*}"
    echo "$leftfilename"
    echo "$rightfilename"
    /usr/local/bin/ffmpeg -i "$1" -i "$2" -filter_complex "[0:v:0]pad=iw*2:ih[bg]; [bg][1:v:0]overlay=w[combined]; [combined]scale=1024:-2" "out/combined$leftfilename-$rightfilename.mp4" &&
}

fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Usage: compresspdf [input file] [output file] [screen*|ebook|printer|prepress]
compresspdf() {
    hash gs 2>/dev/null || { echo >&2 "I require ghostscript but it's not installed. Install gs with 'brew install ghostsript'  Aborting."; exit 1; }
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/"${3:-"screen"}" -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}

# yell out BETH!
play-beth() {
    osascript -e 'get volume settings'
    SwitchAudioSource -s 'MacBook Pro Speakers'
    osascript -e "set Volume 10"
    afplay $HOME/Music/beth.m4a
    osascript -e "set Volume 3"
    # SwitchAudioSource -s 'Built-in Output'
    osascript -e 'get volume settings'
}

play-airhorn() {
    osascript -e 'get volume settings'
    SwitchAudioSource -s 'MacBook Pro Speakers'
    osascript -e "set Volume 5"
    afplay $HOME/Music/airhorn.m4a
    osascript -e "set Volume 2"
    # SwitchAudioSource -s 'Built-in Output'
    osascript -e 'get volume settings'
}

# add entry to dayone
journal() {
    dayone2 new "$1" -t hourly "$2"
}

# kill process on a given port, range, or comma-separated list
# Usage: killp 4001          — single port
#        killp 4000-4004     — range
#        killp 4001,4003,6379 — comma-separated
#        killp 4000-4004,6379 — mix of both
killp() {
    if [ -z "$1" ]; then
        echo "Usage: killp <port|range|list>"
        echo "  killp 4001"
        echo "  killp 4000-4004"
        echo "  killp 4001,4003,6379"
        echo "  killp 4000-4004,6379"
        return 1
    fi
    local ports=()
    # split on commas, then expand ranges
    for part in ${(s:,:)1}; do
        if [[ "$part" == *-* ]]; then
            local lo=${part%%-*}
            local hi=${part##*-}
            for p in $(seq "$lo" "$hi"); do
                ports+=("$p")
            done
        else
            ports+=("$part")
        fi
    done
    local any_killed=0
    for port in "${ports[@]}"; do
        local pids
        pids=$(lsof -ti :"$port" 2>/dev/null)
        if [ -n "$pids" ]; then
            echo "$pids" | xargs kill -9
            echo "Killed on port $port: $pids"
            any_killed=1
        fi
    done
    if [ "$any_killed" -eq 0 ]; then
        echo "No processes found on port(s): ${ports[*]}"
        return 1
    fi
}

# Refresh the chezmoi-tracked Brewfile after installing/removing packages.
# Keeps the Brewfile from drifting the way the old .brew.sh script did.
brewdump() {
    brew bundle dump --file="$HOME/Brewfile" --force && \
    chezmoi re-add "$HOME/Brewfile" && \
    echo "✓ Brewfile refreshed and re-added to chezmoi — commit when ready"
}
