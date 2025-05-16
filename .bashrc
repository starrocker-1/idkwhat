#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# For starship
eval "$(starship init bash)"

# For vim mode in bash
set -o vi

# Aliases
alias ls='lsd -lA --color=always --icon=always'
alias grep='grep --color=always'
alias less='less -Rr'
alias nwg-drawer='nwg-drawer -mt 6 -mb 6 -mr 5 -ml 5'

# Created by `pipx` on 2025-02-03 21:19:10
export PATH="$PATH:/home/starrocker/.local/bin"
# exporting editor env
export EDITOR=nvim

# For TUIR
export TUIR_BROWSER=mpv

# Bash history
export HISTFILESIZE=10000000
export HISTSIZE=10000000

# fzf catppuccin theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# fzf key-bindings
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash


export QT_QPA_PLATFORMTHEME=gtk3
