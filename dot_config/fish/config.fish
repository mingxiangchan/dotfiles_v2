# disable fish greeting message
set fish_greeting

set --export EDITOR nvim
set --export VIMCONFIG $HOME/.vim
set -U fish_user_paths $HOME/.local/bin
set -U fish_user_paths $HOME/.poetry/bin
set -U fish_user_paths $HOME/.config/composer/vendor/bin
set --export MANPAGER "nvim -c 'set ft=man' -"
set --export FZF_DEFAULT_COMMAND  'rg --files --hidden --glob="!git/*" --glob="!node_modules/*"'
set --export ERL_AFLAGS "-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"
set --export SSH_AUTH_SOCK "/run/user/1000/yubikey-agent/yubikey-agent.sock"
set PATH "/snap/bin/" $PATH
set fish_color_command --bold cyan

abbr -a gco 'git checkout'
abbr -a gfm "git pull"
abbr -a rcd 'ranger-cd'
abbr -a abd 'abduco'
abbr -a dco 'docker-compose'
abbr -a gf "git fuzzy"


alias be="bundle exec"
alias cmus='tmux attach-session -t cmus; or tmux new-session -A -D -s cmus "/usr/bin/cmus"'
alias vi="nvim"
alias vim="nvim"
alias cls="clear"
alias pr="poetry run"

fish_vi_key_bindings

function ranger-cd
    set tmpfile "/tmp/pwd-from-ranger"
    ranger --choosedir=$tmpfile $argv
    set rangerpwd (cat $tmpfile)
    if test "$PWD" != $rangerpwd
        cd $rangerpwd
    end
end

function vmux
  abduco -e '^g' -A $argv nvim
end

source ~/.asdf/asdf.fish

starship init fish | source
