export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
[[ -f "$HOME/completion-for-pnpm.bash" ]] && source "$HOME/completion-for-pnpm.bash"