function moon
  curl -s wttr.in/moon | sed -e '$ d' -e '/^[[:space:]]*$/d'
end
