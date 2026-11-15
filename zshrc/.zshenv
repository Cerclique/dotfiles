# zsh-specific settings (loaded for every zsh). Session-wide env lives in environment.d.
export ZSH_CUSTOM="$HOME/.config/zsh/custom"
export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"

# Use the systemd socket-activated ssh-agent (also set via environment.d for the graphical session).
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/ssh-agent.socket"
