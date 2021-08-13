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

# Set export/globals
set --export SHELL /usr/bin/fish
set --export EDITOR /bin/nvim
set --export VISUAL $EDITOR
set --export NOTMUCH_CONFIG ~/.config/notmuch/config
set --export SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set --export LEDGER_FILE ~/docs/budget/current
set -e fish_greeting

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

# Set PATH
set -gx PATH /home/ian/.cargo/bin:/home/ian/go/bin:/home/ian/.local/bin:/home/ian/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/core_perl:/usr/local/go/bin/:/usr/local/go/bin/:/home/ian/.emacs.d/bin/

if type -q starship
  starship init fish | source
end