# Custom completions for git commit with commitlint format
# Provides type and scope suggestions for commit messages

# Function to extract workspace scopes from package.json (with caching)
function __fish_git_commitlint_scopes
    # Only provide scopes if we're in a git repo
    if not git rev-parse --git-dir >/dev/null 2>&1
        return
    end

    # Find package.json in git root
    set -l git_root (git rev-parse --show-toplevel 2>/dev/null)
    if test -z "$git_root"
        return
    end

    set -l package_json "$git_root/package.json"
    if not test -f "$package_json"
        return
    end

    # Use a cache file based on the git root path
    set -l cache_key (string replace -a '/' '_' "$git_root")
    set -l cache_file "/tmp/fish_commitlint_scopes_$cache_key"

    # Check if cache exists and is newer than package.json
    if test -f "$cache_file" -a "$cache_file" -nt "$package_json"
        cat "$cache_file"
        return
    end

    # Extract workspace package names using jq if available
    if command -v jq >/dev/null 2>&1
        # Find all package.json files matching workspace patterns
        set -l workspace_patterns (jq -r '
            if .workspaces then
                if (.workspaces | type) == "array" then
                    .workspaces[]
                else
                    .workspaces.packages[]?
                end
            else
                empty
            end
        ' "$package_json" 2>/dev/null)

        # Create a temporary file to store results
        set -l temp_scopes (mktemp)

        # For each pattern, use find to locate package.json files
        for pattern in $workspace_patterns
            set -l search_dir (string split -m 1 '/' $pattern)[1]

            if test -d "$git_root/$search_dir"
                # Limit find depth to avoid scanning node_modules
                find "$git_root/$search_dir" -name "package.json" -type f -not -path "*/node_modules/*" 2>/dev/null | while read -l pkg_file
                    set -l pkg_name (jq -r '.name // empty' "$pkg_file" 2>/dev/null)
                    if test -n "$pkg_name"
                        # Extract scope: if scoped (@org/name), take the part after /
                        if string match -q '*/*' $pkg_name
                            string split -m 1 '/' $pkg_name | tail -n 1
                        else
                            echo $pkg_name
                        end
                    end
                end >> "$temp_scopes"
            end
        end

        # Sort and deduplicate
        sort -u "$temp_scopes" > "$cache_file"
        rm "$temp_scopes"
        cat "$cache_file"
    end
end

# Provide all possible completions and let Fish do the filtering
function __fish_git_commitlint_completions
    # Define types with descriptions
    echo -e "feat:\tNew feature"
    echo -e "fix:\tBug fix"
    echo -e "docs:\tDocumentation"
    echo -e "style:\tCode style"
    echo -e "refactor:\tRefactoring"
    echo -e "perf:\tPerformance"
    echo -e "test:\tTests"
    echo -e "build:\tBuild system"
    echo -e "ci:\tCI config"
    echo -e "chore:\tMaintenance"
    echo -e "revert:\tRevert commit"

    # Output type(scope): combinations
    set -l scopes (__fish_git_commitlint_scopes)
    if test -n "$scopes"
        for scope in $scopes
            echo -e "feat($scope):\tNew feature for $scope"
            echo -e "fix($scope):\tBug fix for $scope"
            echo -e "docs($scope):\tDocs for $scope"
            echo -e "style($scope):\tStyle for $scope"
            echo -e "refactor($scope):\tRefactor $scope"
            echo -e "perf($scope):\tPerf for $scope"
            echo -e "test($scope):\tTests for $scope"
            echo -e "build($scope):\tBuild for $scope"
            echo -e "ci($scope):\tCI for $scope"
            echo -e "chore($scope):\tChore for $scope"
        end
    end
end

# Register completion for git commit -m
complete -c git -n '__fish_seen_subcommand_from commit' -s m -l message -x -a '(__fish_git_commitlint_completions)'
