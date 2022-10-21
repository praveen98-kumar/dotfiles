# Created by newuser for 5.9
unsetopt BEEP

zmodload zsh/datetime

typeset -A __DOTS

__DOTS[ITALIC_ON]=$'\e[3m'
__DOTS[ITALIC_OFF]=$'\e[23m'

exists() { (( $+commands[$1] )); }

_comp_options+=(globdots)

source "$ZDOTDIR/zsh-functions"

autoload -Uz colors && colors

zsh_add_file "zsh-aliases"

zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-completions"

autoload zmv

autoload -Uz compinit
compinit

setopt ALWAYS_TO_END
setopt AUTO_MENU
setopt LIST_PACKED

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select
zmodload zsh/complist

zstyle ':completion:*' rehash true

zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(..) ]] && reply=(..)'

zstyle ':completion:*' group-name ''
zstyle ':completion:*' format %F{yellow}%B%U%{$__DOTS[ITALIC_ON]%}%d%{$__DOTS[ITALIC_OFF]%}%b%u%f


# Added by running `compinstall`
zstyle ':completion:*' expand suffix
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
# End of lines added by compinstall
#
zstyle ':completion:*' matcher-list '' \
  '+m:{[:lower:]}={[:upper:]}' \
  '+m:{[:upper:]}={[:lower:]}' \
  '+m:{_-}={-_}' \
  'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR/zcompcache"

# Options ========================================
setopt AUTO_CD
setopt RM_STAR_WAIT
setopt CORRECT                  # command auto-correction
setopt COMPLETE_ALIASES
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt AUTOPARAMSLASH            # tab completing directory appends a slash
setopt SHARE_HISTORY             # Share your history across all your terminal windows
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits
setopt AUTO_PUSHD                # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS         # Do not store duplicates in the stack.
setopt PUSHD_SILENT              # Do not print the directory stack after pushd or popd.

# Keep a ton of history.
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=$ZSH_CACHE_DIR/.zsh_history
#
#
#
#

# Prompt
setopt PROMPT_SUBST

# function __prompt_eval(){
#   local prompt_icon="%F{green}%f"
#   local top = "%B%F{magenta}%n %f%b"
#   local bottom = prompt_icon 
#   echo $top$'\n'$bottom
# }
# ❯   
# export PROMPT='$(__prompt_eval)'
export PROMPT='%(?.%B%F{green}.%B%F{red}✘)%f%b %B%F{blue}%~%b%f '
#
#
#
#
#
#
#
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ANDROID_SDK_ROOT="$HOME/Android/Sdk/"
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
