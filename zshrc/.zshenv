# zsh-specific settings (loaded for every zsh). Session-wide env lives in environment.d.
export ZSH_CUSTOM="$HOME/.config/zsh/custom"
export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"

# systemd user ssh-agent (ssh-agent.socket); also set by environment.d after re-login
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
