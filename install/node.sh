brew install volta

volta install node
volta install npm

# Globally install with npm

packages=(
  @angular/cli
  pnpm
)

npm install -g "${packages[@]}"
