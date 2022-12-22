#!/bin/zsh

alias v=nvim
#alias vim=nvim
alias sysinfo="inxi -Fxxxz"
# alias cat=bat
alias open=xdg-open

# go to root git dir
cdr() {
    cd "$(git rev-parse --show-toplevel)" || return
}

if command -v pamac > /dev/null 2>&1; then
    alias checkup="sudo pamac checkupdates -a"
    alias up="pamac upgrade -a --no-confirm"
    alias buildup="pamac build --no-confirm"
fi

if command -v pacman > /dev/null 2>&1; then
    alias upnup="sudo pacman -Syyuu"
    alias cleanup='sudo pacman -Rsn $(pacman -Qdtq)'
fi

if command -v microk8s > /dev/null 2>&1; then
    alias k="microk8s.kubectl"
    alias kube="microk8s.kubectl"
    alias kubectl="microk8s.kubectl"
fi

# Github CLI aliases
prcreate() {
    if [ -z "$2" ]; then
        # If title is not provided then use autofill
        gh pr create -B "$1" -f
    else
        # Otherwise use provided title
        gh pr create -B "$1" -t "$2"
    fi
}

prmerge() {
    gh pr merge --merge --delete-branch=false "$1"
}
prlist() {
    gh pr list --state open
}
prcheck() {
    gh pr checkout "$1" && gh pr diff
}

# IP aliases
ip-internal() {
    echo "Wireless :: IP => $(ip -4 -o a show wlo1 | awk '{ print $4 }')"
}
ip-external() {
    echo "External :: IP => $(curl --silent https://ifconfig.me)"
}
ipinfo() {
    ip-internal && ip-external
}

vf() { fzf | xargs -r -I % $EDITOR % ;}
gadd() { git status -s | fzf -m | awk '{print $2}' | xargs git add && git status -s}
greset() { git status -s |  fzf -m | awk '{print $2}' |xargs git reset && git status -s}


alias myip=ip-internal
alias yt='youtube-dl --extract-audio --add-metadata --xattrs --embed-thumbnail --audio-quality 0 --audio-format mp3'
alias ytv='youtube-dl --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" --embed-thumbnail --add-metadata'
alias upgrade='sudo apt update && sudo apt upgrade'

alias q=exit
alias e=nvim
alias php7.4=/usr/bin/php7.4
alias ti='php artisan ti'
alias rl='php artisan r:l'
alias c='f() { cd $1 && clear && pwd && ls -lht };f'
alias w='clear && curl "wttr.in/?pq"'
alias m='clear && curl "wttr.in/moon?pq"'
alias ignore='curl https://www.gitignore.io/api/vim,node,data,emacs,python,pycharm,executable,sublimetext,visualstudio,visualstudiocode > .gitignore'
alias cat=batcat

alias tls=tmux ls
alias ta='tmux attach -t "$(tmux ls | cut -d : -f1 | fzf)"'
alias sa='bash ~/.machines/"$(ls ~/.machines | fzf)"'
alias tn='tmux new -s $1'


# open_with_fzf() {
#     fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
# }
# cd_with_fzf() {
#     cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
# }
# pacs() {
#     sudo pacman -Syy $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
# }
#
#

source $HOME/.local/share/zinit/plugins/tj---git-extras/etc/git-extras-completion.zsh
