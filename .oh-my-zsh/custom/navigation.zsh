alias c="clear"
alias jw='cd $(find ~/dev/* -maxdepth 2 -type d | fzf)'

jc() {
  dotfileFolders=("${HOME}/.config/nvim" "${HOME}/.oh-my-zsh/custom")
  cd $(printf "%s\n" "${dotfileFolders[@]}" | fzf)
}

