# terminal emulator specific
# if xprop -notype -id $WINDOWID 2>&1| awk '/^WM_CLASS.*kitty/' | grep "kitty" > /dev/null
#   alias ssh="kitty +kitten ssh"
#   alias icat="kitty +kitten icat"
# end

# chezmoi
abbr cz "chezmoi"
abbr cza "chezmoi add"
abbr cze "chezmoi edit"
abbr czcd "chezmoi cd"

# clear
abbr c "clear -x"
abbr c! "clear"

# configs
abbr vi3 "$EDITOR ~/.config/i3/config"
abbr fishrc "$EDITOR ~/.config/fish"
abbr vimrc "$EDITOR ~/.config/nvim"

# docker
abbr d "docker"
abbr db "docker build"
abbr dbt "docker build -t"
abbr dp "docker push"
abbr dr "docker run"
abbr drit "docker run -it"

# emacs
abbr e "emacs"

# git
abbr g "git"
abbr ga "git add"
abbr ga. "git add ."
abbr gb "git branch"
abbr gbd "git branch -D"
abbr gc "git commit"
abbr gcm "git commit -m"
abbr gcm!! "git add .; and git commit -m "Update!"; and git push"
abbr gcl "git clone"
abbr gco "git checkout"
abbr gd "git diff"
abbr gi "gitignore"
abbr gl "git log"
abbr gm "git merge"
abbr gpl "git pull"
abbr gps "git push"
abbr gps! "git push --force"
abbr gpsu "git push -u origin master"
abbr gri "git rebase -i"
abbr gs "git status"

# kubectl
abbr k "kubectl"
abbr ka "kubectl apply"
abbr kaf "kubectl apply -f"
abbr kd "kubectl delete"
abbr kdf "kubectl delete -f"
abbr kg "kubectl get"
abbr kgd "kubectl get deployments"
abbr kgj "kubectl get jobs"
abbr kgns "kubectl get ns"
abbr kgpo "kubectl get pods"
abbr kgs "kubectl get services"
abbr kl "kubectl logs"

# ls
if test -f /bin/lsd
  alias ls="lsd"
  abbr lt "ls --tree"
else if test -f $HOME/.cargo/bin/lsd
  alias ls="lsd"
  abbr lt "ls --tree"
else
  alias ls="ls"
end

abbr l "ls"
abbr ll "ls -l"
abbr la "ls -a"
abbr lal "ls -al"
abbr lla "ls -al"

# mbsync
alias mbsync="mbsync -c \"/home/ian/.config/isync/mbsyncrc\""

# newsboat
abbr nb "newsboat"

# ranger
abbr r "ranger"

# scrot
alias scrot="scrot -z"
abbr ss "scrot --select ~/docs/pics/scrot/%Y_%m_%d-%H:%M:%S.png"

# taskbook
#abbr tb "taskbook"
#abbr tba "taskbook --archive"
#abbr tbb "taskbook --begin"
#abbr tbc "taskbook --check"
#abbr tbcl "taskbook --clear"
#abbr tbd "taskbook --delete"
#abbr tbe "taskbook --edit"
#abbr tbf "taskbook --find"
#abbr tbh "taskbook --help"
#abbr tbl "taskbook --list"
#abbr tbm "taskbook --move"
#abbr tbn "taskbook --note"
#abbr tbp "taskbook --priority"
#abbr tbr "taskbook --restore"
#abbr tbs "taskbook --star"
#abbr tbtl "taskbook --timeline"
#abbr tbt "taskbook --task"
#abbr tby "taskbook --copy"

# taskwarrior
abbr t "task"
abbr ta "task add"
abbr tde "task delete"
abbr td "task done"
abbr tm "task modify"
abbr tp "task stop"
abbr ts "task start"

# timewarrior
abbr tw "timew"
abbr twm "timew modify"
abbr tws "timew summary"
abbr twsd "timew summary :day"
abbr twsi "timew summary :ids"
abbr twsy "timew summary :yesterday"
abbr twr "timew report"

# terraform
#abbr tf "terraform"

# vim
abbr v "$EDITOR"
abbr vim "$EDITOR"
