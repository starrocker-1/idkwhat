#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# For starship
eval "$(starship init bash)"

set -o vi

# Aliases
alias ls='lsd'
alias grep='grep --color=always'

# Created by `pipx` on 2025-02-03 21:19:10
export PATH="$PATH:/home/starrocker/.local/bin"
# exporting editor env
export EDITOR=nvim

# For TUIR
export TUIR_BROWSER=mpv
export BROWSER=w3m

# Bash history
export HISTFILESIZE=1000000
export HISTSIZE=1000000

# fzf catppuccin theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

alias dotfiles=/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
