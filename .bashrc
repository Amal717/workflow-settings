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

# ── TRUE COLOR ───────────────────────────────────────────────
# Tell terminal and tmux to use 24-bit RGB colors
export COLORTERM=truecolor

# ── COLORS ──────────────────────────────────────────────────
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ── COMPLETION ───────────────────────────────────────────────
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ── ALIASES ──────────────────────────────────────────────────
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# ── PS1 — neon green + catppuccin ───────────────────────────
_GREEN="\[\e[38;2;50;255;120m\]"     # neon green        — username + hostname
_BRACKET="\[\e[38;2;243;139;168m\]"  # catppuccin red    — brackets/lines
_PATH="\[\e[38;2;189;147;249m\]"     # catppuccin violet — directory
_BOLD="\[\e[1m\]"
_RESET="\[\e[0m\]"
_status() { [[ $? != 0 ]] && printf '\e[38;2;235;160;172m ✗\e[0m'; }
PS1="${_BRACKET}┌─[${_GREEN}\u${_BRACKET}@${_GREEN}\h${_BRACKET}]─[${_BOLD}${_PATH}\w${_RESET}${_BRACKET}]\$(_status)\n${_BRACKET}└─${_GREEN}\$${_RESET} "

# ── USER CONFIG ──────────────────────────────────────────────
export PATH=$PATH:/home/amal/TIESYS/ESP/SOFTWARES/lpc21isp
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
. "$HOME/.cargo/env"
alias todo='cd ~/TIESYS/ESP/01_CPROGRAMMING/TODO_Workspace/K_RC'
alias lab='cd ~/TIESYS/ESP/01_CPROGRAMMING/LAB_Workspace/'
