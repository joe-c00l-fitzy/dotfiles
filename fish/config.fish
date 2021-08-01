#!/usr/bin/env fish

# Pro-tip: use fish_add_path to edit the PATH variable in this config file
# DO NOT MANUALLY EDIT $PATH IN THIS FILE!!!!
# etc: fish_add_path $HOME/.cargo/bin

# Remove fish greeting
set -g fish_greeting

# Setup Common Paths
set MYFISHCONFIG $XDG_CONFIG_HOME/fish/config.fish

if ! set -q MYVIMRC
    set -x MYVIMRC $XDG_CONFIG_HOME/nvim/init.vim
end

if ! set -q SRC_PATH
    set -x SRC_PATH $HOME/Source
end

if ! set -q DOTFILES
    set -x DOTFILES $SRC_PATH/dotfiles
end

# macOS Specific thangs
if test (uname) = "Darwin"
    alias updatedb="sudo /usr/libexec/locate.updatedb"
end

# Aliases
alias ll='ls -lah'
alias mongo='mongosh'
# Set Abbreviations

# Docker
abbr --add d 'docker'
abbr --add dc 'docker-compose'
abbr --add dcdr 'docker-compose down --remove-orphans'

# Edit Common Configs
abbr --add edit_fish 'nvim $MYFISHCONFIG'
abbr --add edit_nvim 'nvim $MYVIMRC'
abbr --add edit_profile 'nvim $HOME/.profile'

# Updates and Upgrades
abbr --add fupdate 'flatpak update'
abbr --add rupdate 'rustup update'
abbr --add update 'sudo apt update && apt list --upgradable'
abbr --add upgrade 'sudo apt upgrade -y'

# Misc
abbr --add dotfiles 'cd $DOTFILES'
abbr --add flatpak_unused 'flatpak uninstall --unused'
abbr --add install_vimplugs 'nvim -es -u init.vim -i NONE -c "PlugInstall" -c "qa"'
abbr --add ppath 'echo $PATH'
abbr --add py3 'python3.9'
abbr --add reset_fish 'source $MYFISHCONFIG'
abbr --add rust_book_code 'cd $SRC_PATH/rust/book-code && code . && rustup doc --book'

# Git abbr's
abbr --add ga 'git add'
abbr --add gaa 'git add -A'
abbr --add gb 'git branch'
abbr --add gcam 'git commit -a -m'
abbr --add gcb 'git checkout -b'
abbr --add gch 'git checkout'
abbr --add gcm 'git commit -m'
abbr --add gd 'git diff'
abbr --add gds 'git diff --staged'
abbr --add gl 'git pull'
abbr --add gp 'git push'
abbr --add gpu 'git push -u origin'
abbr --add gpum 'git push -u origin main'
abbr --add gsl 'git status --long'
abbr --add gss 'git status -s'
abbr --add gst 'git status'

set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

status is-interactive; and pyenv init --path | source
pyenv init - | source

# Starship Prompt Setup
starship init fish | source

