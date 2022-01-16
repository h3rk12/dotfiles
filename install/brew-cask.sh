# Install cask packages

apps=(
  1password
  alfred
  bartender
  docker
  figma
  google-chrome
  google-japanese-ime
  itsycal
  visual-studio-code
  slack
)

brew install "${apps[@]}" --cask
