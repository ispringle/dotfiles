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
set -gx PATH $HOME/.cargo/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/core_perl:/usr/local/go/bin/:/usr/local/go/bin/:$HOME/.emacs.d/bin/:$HOME/.npm-global/bin:$HOME/.local/share/nvim/lsp_servers

set FISH_EXE_PATH (which fish)
# set TERMINAL_EMULATOR_PID (ps -o ppid= $fish_pid)
# set TERMINAL_EMULATOR (ps -p $TERMINAL_EMULATOR_PID -o command= | cut -d ' ' -f 1)

# Walk up ppids until we get one that isn't fish
# while test $TERMINAL_EMULATOR = $FISH_EXE_PATH; or test "$TERMINAL_EMULATOR" = "fish";
#   set TERMINAL_EMULATOR_PID (ps -o ppid= $TERMINAL_EMULATOR_PID)
#   set TERMINAL_EMULATOR (ps -p $TERMINAL_EMULATOR_PID -o command= | cut -d ' ' -f 1)
# end

# Do stuff here based on the terminal emulator/parent process of fish
# switch $TERMINAL_EMULATOR
#   case '*nvim*'
#     fish_default_key_bindings
#     if test -f (which nvr); and test $NVIM_LISTEN_ADDRESS
#       set --export EDITOR /usr/local/bin/nvr
#     else
#       # I guess just give up and accept nested nvim?
#       set --export EDITOR /usr/local/bin/nvim
#     end
#
#   case '*'
#     fish_vi_key_bindings
#     set --export EDITOR /usr/local/bin/nvim
# end

# Set export/globals
set --export EDITOR /usr/local/bin/nvim
set --export SHELL /usr/local/bin/fish
set --export VISUAL $EDITOR
# set --export NOTMUCH_CONFIG ~/.config/notmuch/config
# set --export SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
# set --export LEDGER_FILE ~/docs/budget/current
set -e fish_greeting

# This is needed if app-store sign-in isn't wanted
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
