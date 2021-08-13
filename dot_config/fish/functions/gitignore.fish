function gitignore --description 'Generate a .gitignore file from gitignore.io'
  if count $argv > /dev/null
    curl -L -s https://gitignore.io/api/$argv
  else
    echo "Usage: gitignore choice1,choice2,choiceN >> .gitignore"
    echo ""
    echo "To get a list of possible: gitignore list"
  end
end
