#                      _  ____  _____ _
#                     | |/ ___||  _  ( )
#  _ __   __ _ _ __ __| / /___  \ V /|/ ___
# | '_ \ / _` | '__/ _` | ___ \ / _ \  / __|
# | |_) | (_| | | | (_| | \_/ || |_| | \__ \
# | .__/ \__,_|_|  \__,_\_____/\_____/ |___/
# | |     __________    __ _     _                        __
# |_|    /          \  / _(_)   | |                      / _|     (
#       /____________\| |_ _ ___| |__     ___ ___  _ __ | |_     (\)
#        |:_:_:_:_:_| |  _| / __| '_ \   / __/ _ \| '_ \|  _|     ))
#        |_:_,--.:_:| | | | \__ \ | | | | (_| (_) | | | | |    (\//   )
#        |:_:|__|_:_| |_| |_|___/_| |_|  \___\___/|_| |_|_|   ) ))   ((
#     _  |_   _  :_:|   _   _   _              _             ((((   /)\`
#    | |_| |_| |   _|  | |_| |_| |            (_)             \\)) (( (
#     \_:_:_:_:/|_|_|_|\:_:_:_:_/               o              ((   ))))
#      |_,-._:_:_:_:_:_:_:_.-,_|               .                )) ((//
#      |:|_|:_:_:,---,:_:_:|_|:|                               ,-.  )/
#      |_:_:_:_,'     `,_:_:_:_|           _  o               ,;'))((
#      |:_:_:_/  _ | _  \_:_:_:|          (_O                   ((  ))
# _____|_:_:_|  (o)-(o)  |_:_:_|--'`-.     ,--.                (((\'/
#  ', ;|:_:_:| -( .-. )- |:_:_:| ', ; `--._\  /,---.~           \`))
# .  ` |_:_:_|   \`-'/   |_:_:_|.  ` .  `  /()\.__( ) .,-----'`-\((
#  ', ;|:_:_:|    `-'    |:_:_:| ', ; ', ; `--'|   \ ', ; ', ; ',')).,--
# .  `  `. ` .  ` .  ` .  ` .  ` .  ` .  ` .    .  ` .  ` .  ` .  ` .  `
#  ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ;

# Set PATH
set -gx PATH $HOME/.cargo/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/core_perl:/usr/local/go/bin/:/usr/local/go/bin/:$HOME/.emacs.d/bin/:$HOME/.npm-global/bin

# Set export/globals
set --export SHELL /usr/local/bin/fish
if command -v lvim > /dev/null
  set --export EDITOR lvim
else
  set --export EDITOR /usr/local/bin/nvim
end
set --export VISUAL $EDITOR
# set --export NOTMUCH_CONFIG ~/.config/notmuch/config
# set --export SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
# set --export LEDGER_FILE ~/docs/budget/current
set -e fish_greeting
set --export HOMEBREW_BREWFILE_APPSTORE 0

# Ensure fisher package manager is installed
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

# Source aliases
if [ -f ~/.config/fish/aliases.fish ]
  source ~/.config/fish/aliases.fish
end

# pure prompt overrides
# set -g pure_symbol_git_unpulled_commits 
# set -g pure_symbol_git_unpushed_commits 
# set -g pure_symbol_git_dirty 

if type -q starship
  starship init fish | source
end
