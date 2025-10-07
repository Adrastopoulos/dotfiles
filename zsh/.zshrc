# Get the directory where this script is located
ZDOTDIR="${${(%):-%x}:A:h}"

[[ -f "$ZDOTDIR/.zshenv" ]] && source "$ZDOTDIR/.zshenv"
[[ -f "$ZDOTDIR/history.zsh" ]] && source "$ZDOTDIR/history.zsh"
[[ -f "$ZDOTDIR/keybindings.zsh" ]] && source "$ZDOTDIR/keybindings.zsh"
[[ -f "$ZDOTDIR/path.zsh" ]] && source "$ZDOTDIR/path.zsh"

# order matters
[[ -f "$ZDOTDIR/plugins/brew.zsh" ]] && source "$ZDOTDIR/plugins/brew.zsh"
[[ -f "$ZDOTDIR/plugins/ohmyzsh.zsh" ]] && source "$ZDOTDIR/plugins/ohmyzsh.zsh"
[[ -f "$ZDOTDIR/plugins/asdf.zsh" ]] && source "$ZDOTDIR/plugins/asdf.zsh"
[[ -f "$ZDOTDIR/plugins/nvm.zsh" ]] && source "$ZDOTDIR/plugins/nvm.zsh"
[[ -f "$ZDOTDIR/plugins/python.zsh" ]] && source "$ZDOTDIR/plugins/python.zsh"
[[ -f "$ZDOTDIR/plugins/java.zsh" ]] && source "$ZDOTDIR/plugins/java.zsh"
[[ -f "$ZDOTDIR/plugins/elixir.zsh" ]] && source "$ZDOTDIR/plugins/elixir.zsh"
[[ -f "$ZDOTDIR/plugins/bun.zsh" ]] && source "$ZDOTDIR/plugins/bun.zsh"
[[ -f "$ZDOTDIR/plugins/pnpm.zsh" ]] && source "$ZDOTDIR/plugins/pnpm.zsh"
[[ -f "$ZDOTDIR/plugins/terraform.zsh" ]] && source "$ZDOTDIR/plugins/terraform.zsh"
[[ -f "$ZDOTDIR/plugins/ngrok.zsh" ]] && source "$ZDOTDIR/plugins/ngrok.zsh"
[[ -f "$ZDOTDIR/plugins/bat.zsh" ]] && source "$ZDOTDIR/plugins/bat.zsh"
[[ -f "$ZDOTDIR/plugins/atuin.zsh" ]] && source "$ZDOTDIR/plugins/atuin.zsh"
[[ -f "$ZDOTDIR/plugins/starship.zsh" ]] && source "$ZDOTDIR/plugins/starship.zsh"
[[ -f "$ZDOTDIR/plugins/zoxide.zsh" ]] && source "$ZDOTDIR/plugins/zoxide.zsh"


[[ -f "$ZDOTDIR/aliases.zsh" ]] && source "$ZDOTDIR/aliases.zsh"
