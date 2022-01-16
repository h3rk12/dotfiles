# Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brwe update
brew upgrade

# Install packages

apps=(
  dockutil
  fish
  fzf
  git
  neovim
  starship
  tmux
  volta
)

brew install "${apps[@]}"
