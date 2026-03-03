### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/IPringle/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Load environment variables (cross-shell compatible)
# Load common.env
if [ -f ~/.config/envvars/common.env ]; then
    while IFS='=' read -r key value; do
        # Skip empty lines and comments
        [[ -z "$key" || "$key" =~ ^[[:space:]]*# ]] && continue
        # Export the variable
        export "$key=$value"
    done < ~/.config/envvars/common.env
fi

# Load path.env
if [ -f ~/.config/envvars/path.env ]; then
    while IFS= read -r path; do
        # Skip empty lines and comments
        [[ -z "$path" || "$path" =~ ^[[:space:]]*# ]] && continue
        # Expand tilde and add to PATH
        expanded_path="${path/#\~/$HOME}"
        [ -d "$expanded_path" ] && export PATH="$expanded_path:$PATH"
    done < ~/.config/envvars/path.env
fi

# Source zsh-specific scripts
for envfile in ~/.config/envvars/*.sh; do
  [ -f "$envfile" ] && source "$envfile"
done

# peon-ping quick controls
alias peon="bash ~/.claude/hooks/peon-ping/peon.sh"
[ -f ~/.claude/hooks/peon-ping/completions.bash ] && source ~/.claude/hooks/peon-ping/completions.bash
