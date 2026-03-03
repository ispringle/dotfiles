if status is-interactive
    # Commands to run in interactive sessions can go here
end

#fnm env --use-on-cd --shell fish | source

# if not functions -q fisher
#    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
#    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# end

# Load environment variables (cross-shell compatible)
load_envvars

source ~/.config/fish/eat.fish
source ~/.config/fish/aliases.fish

function fish_greeting
    set Fishers_of_Men \
        "Then He said to them, “Follow Me, and I will make you fishers of men.”\n\t-Matthew 4:19" \
        "And Jesus said to them, “Follow me, and I will make you become fishers of men.”\n\t-Mark 1:17" \
        "And Jesus said to Simon, “Do not be afraid; from now on you will be catching men.”\n\t -Luke 5:10"
    echo "<>< <>< <>< <>< <><
<>< <>< [2;31m><>[0m[1;2m[0m <>< <><
<>< <>< <>< <>< <><"
    echo -e (random choice $Fishers_of_Men)
end
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/IPringle/.bin/google-cloud-sdk/path.fish.inc' ]
    . '/Users/IPringle/.bin/google-cloud-sdk/path.fish.inc'
end

set --export BINCI_TMP /tmp/rancher-desktop
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/IPringle/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Guile
set --export GUILE_LOAD_PATH "/opt/homebrew/share/guile/site/3.0"
set --export GUILE_LOAD_COMPILED_PATH "/opt/homebrew/lib/guile/3.0/site-ccache"
set --export GUILE_SYSTEM_EXTENSIONS_PATH "/opt/homebrew/lib/guile/3.0/extensions"
