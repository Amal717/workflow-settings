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

# ── CATPPUCCIN MOCHA PS1 ─────────────────────────────────────
_MAUVE="\[\e[38;2;203;166;247m\]"
_GREEN="\[\e[38;2;166;227;161m\]"
_BLUE="\[\e[38;2;137;180;250m\]"
_PEACH="\[\e[38;2;250;179;135m\]"
_RESET="\[\e[0m\]"
_status() { [[ $? != 0 ]] && echo -n " ✗"; }
PS1="${_MAUVE}┌─[${_GREEN}\u${_MAUVE}@${_BLUE}\h${_MAUVE}]─[${_PEACH}\w${_MAUVE}]\$(_status)\n${_MAUVE}└─${_GREEN}\$${_RESET} "

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
