# config.nu
#
# Installed by:
# version = "0.101.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

use std "path add"

$env.homebrew_shellenv_output = ^/opt/homebrew/bin/brew shellenv csh 
  | lines 
  | parse --regex 'setenv (\w+) "?(.+)"?;'
  | transpose -r 
  | into record

#$env.editor = "nvim"
#$env.visual = "nvim"
$env.config.buffer_editor = "nvim"
$env.fzf_default_command = "fd --type f"
$env.grep_colors = "mt=37;31"
$env.pnpm_home = "~/Library/pnpm"
$env.volta_home = ($nu.home-path | path join ".volta")
#$env.gem_home = ($nu.home-path | path join ".gem")
$env.android_home = "/opt/homebrew/share/android-commandlinetools/build-tools/36.0.0"

$env.homebrew_prefix = $env.homebrew_shellenv_output.HOMEBREW_PREFIX
$env.homebrew_cellar = $env.homebrew_shellenv_output.HOMEBREW_CELLAR
$env.homebrew_repository = $env.homebrew_shellenv_output.HOMEBREW_REPOSITORY

#$env.path ++= [
  #($env.VOLTA_HOME | path join "bin"),
  #"/opt/homebrew/opt/gnu-sed/libexec/gnubin",
  #"~/Library/Android/sdk/platform-tools",
  #"~/go/bin",
  #"~/.local/bin",
  #"~/.platformio/penv/bin",
  #"~/bin",
  #"~/.cargo/bin",
  #$env.pnpm_home
#] ++ ($env.homebrew_shellenv_output.PATH | split row ":")

path add "/opt/homebrew/opt/gnu-sed/libexec/gnubin"
path add ($nu.home-path | path join "Library/Android/sdk/platform-tools")
path add ($env.volta_home | path join "bin")
path add $env.pnpm_home
path add ($env.homebrew_shellenv_output.PATH | split row ":")
path add ($nu.home-path | path join "Library/Application Support/waveterm/bin")
path add ($nu.home-path | path join "Library/Android/sdk/platform-tools")
path add ($nu.home-path | path join "go/bin")
path add ($nu.home-path | path join ".local/bin")
path add ($nu.home-path | path join ".platformio/penv/bin")
path add ($nu.home-path | path join "bin")
path add ($nu.home-path | path join ".cargo/bin")
path add ($nu.home-path | path join ".bun/bin")
#path add ($env.gem_home | path join "ruby/2.6.0/bin")
#path add "/opt/homebrew/opt/ruby/bin"
path add "/opt/homebrew/share/android-commandlinetools/platform-tools"

alias pnx = pnpm nx
alias vim = nvim
alias dig = doggo
alias ps = procs
alias l = ls -a

def gpgreset [] {
	gpg-connect-agent killagent /bye
	gpg-connect-agent updatestartuptty /bye
	gpg-connect -agent /bye
}

source ~/.nu_scripts/aliases/bat/bat-aliases.nu
source ~/.nu_scripts/aliases/git/git-aliases.nu
source ~/.nu_scripts/aliases/docker/docker-aliases.nu
source ~/.nu_scripts/aliases/eza/eza-aliases.nu

#source ~/.nu_scripts/custom-completions/eza/eza-completions.nu
#source ~/.nu_scripts/custom-completions/docker/docker-completions.nu 
#source ~/.nu_scripts/custom-completions/git/git-completions.nu
#source ~/.nu_scripts/custom-completions/npm/npm-completions.nu
#source ~/.nu_scripts/custom-completions/ssh/ssh-completions.nu
#source ~/.nu_scripts/custom-completions/curl/curl-completions.nu
#source ~/.nu_scripts/custom-completions/pnpm/pnpm-completions.nu

source ~/.cache/carapace/init.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

source ~/.zoxide.nu
source ~/atuin.nu
source ~/.local/share/atuin/init.nu
