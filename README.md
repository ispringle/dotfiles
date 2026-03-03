# dotfiles

My dotfiles managed with [yadm](https://yadm.io/).

## Installation

```bash
# Install yadm
brew install yadm

# Clone this repo
yadm clone git@github.com:ispringle/dotfiles.git

# Run bootstrap (if present)
yadm bootstrap
```

## What's tracked

- Shell configs (Fish, Bash, Zsh)
- Git config
- Environment variables (`~/.config/envvars/`)
- Fish completions and functions
- Other configs as needed

## Structure

Uses yadm's native structure:
- Files are tracked in their actual locations (`~/.bashrc`, not `dot_bashrc`)
- Templates end with `##template` (processed with Jinja2)
- Alternate files use `##os.Darwin`, `##os.Linux` syntax
- Encrypted files tracked with `~/.config/yadm/encrypt`

## Notes

Old chezmoi-based setup archived in `archive/chezmoi-2024` branch.
