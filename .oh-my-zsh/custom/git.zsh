alias gjb='git branch -a | fzf | sed "s/remotes\/origin\///" | xargs --no-run-if-empty git checkout'
