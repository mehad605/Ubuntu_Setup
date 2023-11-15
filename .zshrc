#This command changes the path variable from a regular array to an array of unique values. Since the PATH variable and the path variable are linked in zsh, #this command will also remove duplicates from the $PATH
typeset -U path



HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# options
unsetopt menu_complete
unsetopt flowcontrol

setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

autoload -U compinit 
compinit

bindkey '^d' end-of-line

# theme/plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/alias.zsh
source ~/.zsh/zsh-you-should-use/you-should-use.plugin.zsh
eval "$(starship init zsh)"
[[ -s ~/.zsh/autojump/bin/autojump.sh ]] && . ~/.zsh/autojump/bin/autojump.sh

zstyle ':completion:*' menu select

# history substring search options
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down


ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Set environment variables
export CHROME_EXECUTABLE=/usr/bin/thorium-browser
export PATH="$PATH:$HOME/Scripts/flutter/bin"
