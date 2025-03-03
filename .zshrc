# Path to your oh-my-zsh installation.
# echo "plugins"
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"
# ZSH_THEME="robbyrussell"

# Add wisely, as too many plugins slow down shell startup.
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
# plugins=(zsh-nvm zsh-autosuggestions last-working-dir)
plugins=(zsh-autosuggestions last-working-dir)

source $ZSH/oh-my-zsh.sh

# my edits
export GOPATH=$HOME/gopath
export PATH=$GOPATH:$GOPATH/bin:$PATH
export TELEGRAM_TOKEN=1120452441:AAFkc-lVQwfdRwM1k9JaxqXXpbvnzhH9Evs
export TELEGRAM_CHAT_ID=952789835
# echo "started"

alias count="find . -maxdepth 1 -type f | wc -l"
export SCREENDIR=/home/luka/.screen
alias cd.="cd .."
alias cd..="cd .."
alias count="find . -maxdepth 1 -type f | wc -l"
alias countdir="find . -mindepth 1-maxdepth 1 -type d | wc -l"
alias dirspace="du -h --max-depth=1 | sort -h"
alias co="code ."
alias gitree="git log --graph --pretty=oneline --abbrev-commit"
alias telegram="python ~/.local/bin/telegram.py"
alias acpoet='source $(poetry env info --path)/bin/activate'
alias msync="rsync -axS --info=progress2"
# echo "alias"

alias vi="nvim"
alias lgit="lazygit"
# add nvim as default editor
export EDITOR=nvim

#-------------------
# LS colors
#-------------------
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
export TERM='xterm-256color'

export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0
export LIBGL_ALWAYS_INDIRECT=1
alias pip='noglob pip'
#alias python=python3.10
#alias pip=pip3.10

# ====================
# POETRY
# ====================

# mkdir -p $ZSH_CUSTOM/plugins/poetry
# poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry

export PATH="/Users/lukaskoric/Library/Caches/pypoetry/virtualenvs/rigetti-experiments-RF8ciRKz-py3.10/bin:/Users/lukaskoric/.qcs/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# echo "Got here"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# echo "pyenv"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true
eval "$(zoxide init zsh)"
alias cd=z
if [ $ITERM_SESSION_ID ]; then
precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
}
fi
# echo "zoxide"
# tmux attach -t main || tmux new -s main
# export NVM_DIR="$HOME/.nvm"
#
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
