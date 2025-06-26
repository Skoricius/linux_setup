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
export TELEGRAM_TOKEN=
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
# TMUX
#-------------------
# start in tmux if available
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux a -d || exec tmux new -s default;
fi


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

# nnn configuration
# n alias to cd on quit nnn
n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}
set --export NNN_FIFO "/tmp/nnn.fifo"# nnn configuratioalias ls="nnn -e"
export NNN_PLUG='f:fzcd;v:imgview'

