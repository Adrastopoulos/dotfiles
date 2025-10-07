if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi
autoload -U +X bashcompinit && bashcompinit