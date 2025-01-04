# Setup

### Mac

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/bin init --apply h3rk12
```

### Linux

```bash
apt update && \
  apt install -y curl git zsh && \
  chsh -s /usr/bin/zsh && \
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/bin init --apply h3rk12
```

### Forcely refresh archives

```bash
chezmoi apply --init --refresh-externals
```
