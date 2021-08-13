function wttr
  curl -s wttr.in | sed -n 3,7p
end
