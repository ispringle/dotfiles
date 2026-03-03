# dotfiles

My dotfiles managed with [yadm](https://yadm.io/).

## Installation

### Prerequisites

```bash
# Install required tools
brew install yadm gnupg
```

### Clone and Setup

```bash
# Clone this repo
yadm clone git@github.com:ispringle/dotfiles.git

# If this is a work machine, set the class
yadm config local.class "work"

# Decrypt encrypted secrets (requires GPG key - see below)
yadm decrypt

# Process alternate files (creates machine-specific files)
yadm alt

# Run bootstrap if present
yadm bootstrap
```

## Encryption Setup

This repo uses GPG encryption for secrets (passwords, tokens, API keys).

### First Time Setup (already done)

The encryption is already configured. You just need your GPG key.

### Restoring GPG Key on New Machine

1. **Get your private key from Bitwarden**
   - Look for "GPG Key - ian@dapringles.com (F5320552534F1611)"
   - Copy the private key content

2. **Import the key**
   ```bash
   # Save the key to a file (temporarily)
   pbpaste > /tmp/gpg-key.asc

   # Import it
   gpg --import /tmp/gpg-key.asc

   # Trust the key
   gpg --edit-key F5320552534F1611
   # Type: trust, 5, quit

   # Clean up
   rm -P /tmp/gpg-key.asc
   ```

3. **Decrypt your secrets**
   ```bash
   yadm decrypt
   ```

### What's Encrypted

See `~/.config/yadm/encrypt` for the full list. Currently:
- `.config/envvars/artifactory.sh` - Artifactory credentials
- `.config/envvars/github.sh` - GitHub tokens
- `.npmrc##class.work` - NPM config (work machines only)

## Work Machine Setup

Some files are specific to work machines (like `.npmrc`).

**On a work machine:**
```bash
# Set the machine class
yadm config local.class "work"

# Process alternate files to create work-specific configs
yadm alt
```

**On personal machines:**
Don't set the class - work-specific files won't be created.

## What's Tracked

**Public files (not encrypted):**
- Shell configs (Fish, Bash, Zsh)
- Git config
- Environment variables (`~/.config/envvars/common.env`, `path.env`)
- Fish completions and functions
- Other configs as needed

**Encrypted files:**
- API tokens and credentials
- Work-specific configs
- See `~/.config/yadm/encrypt` for full list

## Structure

Uses yadm's native structure:
- Files are tracked in their actual locations (`~/.bashrc`, not `dot_bashrc`)
- Templates end with `##template` (processed with Jinja2)
- Alternate files use `##class.work`, `##os.Darwin`, etc.
- Encrypted files tracked in `~/.local/share/yadm/archive`

## Adding New Secrets

1. **Add the file path to `~/.config/yadm/encrypt`**
   ```bash
   echo ".config/myapp/secret.conf" >> ~/.config/yadm/encrypt
   ```

2. **Encrypt and commit**
   ```bash
   yadm encrypt
   yadm add -f ~/.local/share/yadm/archive
   yadm add ~/.config/yadm/encrypt
   yadm commit -m "Add myapp secret config"
   yadm push
   ```

## Adding Work-Only Files

For files that should only exist on work machines:

1. **Name the file with `##class.work`**
   ```bash
   mv ~/.myconfig ~/.myconfig##class.work
   ```

2. **If it has secrets, add to encrypt list**
   ```bash
   echo ".myconfig##class.work" >> ~/.config/yadm/encrypt
   ```

3. **Encrypt and commit**
   ```bash
   yadm encrypt
   yadm add -f ~/.local/share/yadm/archive
   yadm commit -m "Add work-specific config"
   ```

## Notes

Old chezmoi-based setup archived in `archive/chezmoi-2024` branch.
