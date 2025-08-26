# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

fpath=(~/.zsh/completion $fpath)
eval $(/opt/homebrew/bin/brew shellenv)

export HOMEBREW_NO_ENV_HINTS=1

export VISUAL="nvim"
export RANGER_LOAD_DEFAULT_RC=false
export FZF_DEFAULT_COMMAND="fd --type f"
export GREP_COLORS="mt=37;31"
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'

export ANDROID_HOME='/opt/homebrew/share/android-commandlinetools'
export CAPACITOR_ANDROID_STUDIO_PATH=$ANDROID_HOME
export JAVA_HOME=`/usr/libexec/java_home -v 21`
#export PNPM_HOME="$HOME/Library/pnpm"
export VOLTA_HOME="$HOME/.volta"

export PATH="$PNPM_HOME:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$ANDROID_HOME/build-tools/36.0.0:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/Library/Application Support/waveterm/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.platformio/penv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
