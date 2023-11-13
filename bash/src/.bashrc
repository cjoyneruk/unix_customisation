export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export BASH_SILENCE_DEPRECATION_WARNING=1

source ~/.config/synth-shell/synth-shell-prompt.sh
source ~/.config/vsource.sh
