complete -f -c gitignore -a (__gitignore_list)

function __gitignore_list
  if ! set -q __FISH_PRINT_GITIGNORE_LIST
    set -g __FISH_PRINT_GITIGNORE_LIST (curl -L -s https://gitignore.io/api/list | string split ",")
  end
  echo $__FISH_PRINT_GITIGNORE_LIST
end

