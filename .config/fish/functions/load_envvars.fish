# Load environment variables from ~/.config/envvars/
function load_envvars
    set -l envvars_dir ~/.config/envvars

    # Load common.env (simple KEY=VALUE format)
    if test -f $envvars_dir/common.env
        while read -l line
            # Skip empty lines and comments
            if test -z "$line"; or string match -qr '^\s*#' $line
                continue
            end

            # Parse KEY=VALUE
            set -l parts (string split -m 1 '=' $line)
            if test (count $parts) -eq 2
                set -gx $parts[1] (string trim $parts[2])
            end
        end < $envvars_dir/common.env
    end

    # Load path.env (one path per line)
    if test -f $envvars_dir/path.env
        while read -l line
            # Skip empty lines and comments
            if test -z "$line"; or string match -qr '^\s*#' $line
                continue
            end

            # Expand tilde and add to PATH
            set -l expanded_path (string replace -r '^~' $HOME $line)
            if test -d $expanded_path
                fish_add_path -p $expanded_path
            end
        end < $envvars_dir/path.env
    end

    # Source Fish-specific files (*.fish)
    for envfile in $envvars_dir/*.fish
        if test -f $envfile
            source $envfile
        end
    end

    # Source shell scripts (*.sh) - Fish can parse basic export statements
    # But prefer converting these to .fish or .env format
    for envfile in $envvars_dir/*.sh
        if test -f $envfile
            source $envfile
        end
    end
end
