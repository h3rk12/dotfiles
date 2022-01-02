alias vim "nvim"

if [[ -o interactive ]]; then
    exec fish
fi

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
