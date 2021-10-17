# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original false
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt notify
unsetopt beep
setopt histignorespace
bindkey -v
# End of lines configured by zsh-newuser-install

#if (( $+commands[acpi] )); then
#    function __prompt_command() {
#        local LAST_EXIT_CODE="$?"
#
#        local exit_code_str=""
#        if [[ $LAST_EXIT_CODE -ne 0 ]]
#        then
#            exit_code_str="-$LAST_EXIT_CODE- "
#        fi
#
#        local bat_str=""
#        local BAT_PCT=$(acpi | grep -P -o "[0-9]*(?=%)")
#        if [[ $BAT_PCT -le 10 ]] && acpi | grep 'Discharging' > /dev/null 2>&1
#        then
#            bat_str="$BAT_PCT%% "
#        fi
#
#        PS1="$exit_code_str$bat_str%1~%# "
#    }
#else
#    function __prompt_command() {
#        local LAST_EXIT_CODE="$?"
#
#        local exit_code_str=""
#        if [[ $LAST_EXIT_CODE -ne 0 ]]
#        then
#            exit_code_str="-$LAST_EXIT_CODE- "
#        fi
#
#        PS1="$exit_code_str%1~%# "
#    }
#fi
#
#precmd() { __prompt_command; }

if [[ $PATH != *"$HOME/.local/bin"* ]]
then
    PATH=$PATH:$HOME/.local/bin
fi

# zsh-vim-mode
source "$HOME/.zsh-vim-mode.plugin.zsh"
RPS1=""

alias dog='pygmentize -g -O style=colorful'
alias whitenoise='play -n synth brownnoise synth pinknoise mix synth sine amod \
    0.3 10'
alias ls='ls -F'
alias calc='ipython -i ~/.mathenv'

# powerline
powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh
