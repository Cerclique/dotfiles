# oh-my-zsh : Dissoni theme
# Author : Aurélien VERNIZEAU
# Github : https://github.com/cerclique/dotfiles

setopt PROMPT_SUBST

autoload -U add-zsh-hook
autoload -Uz vcs_info

if [[ "${terminfo[colors]}" -ge 256 ]]; then
    dissoni_turquoise="%F{73}"
    dissoni_orange="%F{179}"
    dissoni_red="%F{167}"
    dissoni_limegreen="%F{107}"
fi

dissoni_reset_color="%f"
bold_on="%B"
bold_off="%b"

FMT_UNSTAGED="%{$dissoni_reset_color%} %{$dissoni_orange%}●"
FMT_STAGED="%{$dissoni_reset_color%} %{$dissoni_limegreen%}✚"
FMT_ACTION="(%{$dissoni_limegreen%}%a%{$dissoni_reset_color%})"
FMT_VCS_STATUS="on %{$dissoni_turquoise%} %b%u%c%{$dissoni_reset_color%}"

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr    "${FMT_UNSTAGED}"
zstyle ':vcs_info:*' stagedstr      "${FMT_STAGED}"
zstyle ':vcs_info:*' actionformats  "${FMT_VCS_STATUS} ${FMT_ACTION}"
zstyle ':vcs_info:*' formats        "${FMT_VCS_STATUS}"
zstyle ':vcs_info:*' nvcsformats    ""
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

# Check for untracked files.
+vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
            git status --porcelain | grep --max-count=1 '^??' &> /dev/null; then
        hook_com[staged]+="%{$dissoni_reset_color%} %{$dissoni_red%}●"
    fi
}

# Executed before each prompt.
add-zsh-hook precmd vcs_info

# Prompt style.
PROMPT=$'%{$bold_on%}%{$dissoni_orange%}%~%{$dissoni_reset_color%}%{$bold_off%} ${vcs_info_msg_0_} %(?.%{%F{white}%}.%{$dissoni_red%})%(!.#.❯)%{$dissoni_reset_color%} '
