#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# homebrew
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    [[ -f "/opt/homebrew/bin/brew" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# brew packages
brew bundle --file="$DOTFILES/homebrew/Brewfile"

# Oh My Zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 2>/dev/null || true
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2>/dev/null || true

# link configs
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/.zprofile" "$HOME/.zprofile"
ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/git/.gitignore_global" "$HOME/.gitignore_global"
ln -sf "$DOTFILES/.hushlogin" "$HOME/.hushlogin"
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES/.config/starship" "$HOME/.config/starship"
ln -sf "$DOTFILES/.config/bat" "$HOME/.config/bat"
ln -sf "$DOTFILES/.config/atuin" "$HOME/.config/atuin"

# apply macOS defaults
bash "$DOTFILES/scripts/macos.sh"

echo "Done. Don't foget to update your git config:"
echo "  git config --global user.name 'Your Name'"
echo "  git config --global user.email 'your@email.com'"
