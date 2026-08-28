# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

fpath=(~/.zsh/completion $fpath)
eval $(/opt/homebrew/bin/brew shellenv)

export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_AUTO_UPDATE=1

export VISUAL="nvim"
export RANGER_LOAD_DEFAULT_RC=false
export FZF_DEFAULT_COMMAND="fd --type f"
export GREP_COLORS="mt=37;31"
export CARAPACE_BRIDGES='zsh'
export KUBECONFIG=~/.kube/k3s-config

export ANDROID_HOME='/opt/homebrew/share/android-commandlinetools'
export JAVA_HOME=`/usr/libexec/java_home -v 21`
export PNPM_HOME="$HOME/Library/pnpm"
export VOLTA_HOME="$HOME/.volta"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$PNPM_HOME:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$ANDROID_HOME/build-tools/37.0.0:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.platformio/penv/bin:$PATH"
export PATH="$HOME/.platformio/packages/toolchain-xtensa-esp-elf/bin:$PATH"
export PATH="$(brew --prefix python)/libexec/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"
