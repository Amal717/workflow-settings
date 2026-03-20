# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ── HISTORY ─────────────────────────────────────────────────
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize

# ── LESS ────────────────────────────────────────────────────
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ── PS1 — purple + neon green (Mocha-blended) ───────────────
_PURPLE="\[\e[38;2;180;100;255m\]"   # vivid purple  — username + $
_NEON="\[\e[38;2;50;255;120m\]"      # neon green    — directory
_BRACKET="\[\e[38;2;130;80;200m\]"   # dim purple    — brackets/lines
_HOST="\[\e[38;2;200;180;255m\]"     # soft lavender — hostname
_RESET="\[\e[0m\]"
_status() { [[ $? != 0 ]] && printf "\[\e[38;2;255;80;80m\] ✗\[\e[0m\]"; }
PS1="${_BRACKET}┌─[${_PURPLE}\u${_BRACKET}@${_HOST}\h${_BRACKET}]─[${_NEON}\w${_BRACKET}]\$(_status)\n${_BRACKET}└─${_PURPLE}\$${_RESET} "

# ── COLORS ──────────────────────────────────────────────────
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ── ALIASES ──────────────────────────────────────────────────
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# ── COMPLETION ───────────────────────────────────────────────
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
