# Cross-Shell Environment Variables

This directory contains environment variables that work across Fish, Bash, and Zsh.

## File Types

### `common.env` - Simple environment variables
Shell-agnostic KEY=VALUE format parsed by all shells.

**Format:**
```bash
# Comments start with #
EDITOR=emacs
VISUAL=emacs
MY_VAR=some_value
```

**Rules:**
- No spaces around `=`
- No `export` keyword
- One variable per line
- Comments with `#`

### `path.env` - PATH additions
Shell-agnostic path list, one path per line.

**Format:**
```bash
# One path per line
~/.local/bin
~/bin
/opt/custom/bin
```

**Rules:**
- One path per line
- Tilde (`~`) is expanded
- Paths are prepended to `$PATH` in order
- Comments with `#`

### `*.sh` - Bash/Zsh complex scripts
For complex logic that needs shell scripting (like base64 encoding, conditionals, etc.).

**Format:**
```bash
export ARTIFACTORY_USERNAME="user@example.com"
export NPM_TOKEN=$(echo -n "$USER:$PASS" | base64)
```

**Use for:**
- Computed values
- Conditional logic
- Complex string manipulation

### `*.fish` - Fish complex scripts
Fish-specific scripts for complex logic.

**Format:**
```fish
set -gx MY_VAR "value"
set -gx COMPUTED (some-command)
```

**Use for:**
- Fish-specific computed values
- Fish syntax requirements

## How It Works

Each shell config loads these files in order:

1. **`common.env`** - Parsed into simple KEY=VALUE exports
2. **`path.env`** - Parsed and prepended to PATH
3. **`*.sh`** - Sourced (Bash/Zsh) or parsed (Fish)
4. **`*.fish`** - Sourced (Fish only)

## Adding Variables

### Simple variable (works everywhere)
Edit `common.env`:
```bash
MY_NEW_VAR=value
```

### PATH addition (works everywhere)
Edit `path.env`:
```bash
~/my/custom/bin
```

### Complex variable (shell-specific)
Create a `.sh` file:
```bash
# ~/.config/envvars/myapp.sh
export MY_TOKEN=$(generate-token)
```

Or for Fish-specific:
```fish
# ~/.config/envvars/myapp.fish
set -gx MY_TOKEN (generate-token)
```

## Migration Tips

**Migrate from .sh to .env:**

Before (myapp.sh):
```bash
export SIMPLE_VAR="value"
export ANOTHER_VAR="something"
```

After (common.env):
```bash
SIMPLE_VAR=value
ANOTHER_VAR=something
```

**Keep complex vars in .sh:**
```bash
# This needs to stay in .sh
export COMPUTED=$(echo "complex" | base64)
```

## Testing

After editing, reload your shell:

**Fish:**
```fish
source ~/.config/fish/config.fish
echo $MY_VAR
```

**Bash:**
```bash
source ~/.bashrc
echo $MY_VAR
```

**Zsh:**
```zsh
source ~/.zshrc
echo $MY_VAR
```
