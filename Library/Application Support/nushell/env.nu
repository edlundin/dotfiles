# env.nu
#
# Installed by:
# version = "0.109.1"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

# Nushell Environment Config File
# This file is loaded before config.nu

# Environment variables
$env.HOMEBREW_PREFIX = "/opt/homebrew"
$env.HOMEBREW_NO_ENV_HINTS = "1"

$env.VISUAL = "nvim"
$env.EDITOR = "nvim"
$env.RANGER_LOAD_DEFAULT_RC = "false"
$env.FZF_DEFAULT_COMMAND = "fd --type f"
$env.GREP_COLORS = "mt=37;31"
$env.CARAPACE_BRIDGES = "zsh,fish,bash,inshellisense"
$env.KUBECONFIG = $"($env.HOME)/.kube/k3s-config"

$env.ANDROID_HOME = "/opt/homebrew/share/android-commandlinetools"
$env.JAVA_HOME = (^/usr/libexec/java_home -v 21 | str trim)
$env.PNPM_HOME = $"($env.HOME)/Library/pnpm"

# PATH configuration
$env.PATH = (
    $env.PATH
    | split row (char esep)
    | prepend [
        "/opt/homebrew/bin"
        "/opt/homebrew/opt/gnu-sed/libexec/gnubin"
        $env.PNPM_HOME
        $"($env.HOME)/bin"
        $"($env.ANDROID_HOME)/build-tools/37.0.0"
        $"($env.ANDROID_HOME)/platform-tools"
        $"($env.HOME)/.bun/bin"
        $"($env.HOME)/.platformio/penv/bin"
        $"(/opt/homebrew/bin/brew --prefix python | str trim)/libexec/bin"
        $"($env.HOME)/go/bin"
        $"($env.HOME)/.local/bin"
        $"($env.HOME)/.cargo/bin"
    ]
)

# Homebrew environment setup
^/opt/homebrew/bin/brew shellenv 
    | lines 
    | each { |line|
        if ($line | str starts-with "export ") {
            let parts = ($line | str replace "export " "" | parse "{key}=\"{value}\"")
            if ($parts | length) > 0 {
                let key = ($parts | first | get key)
                let value = ($parts | first | get value)
                load-env {($key): $value}
            }
        }
    }
    | ignore

# Initialize integration files (generate if they don't exist)
# This runs in env.nu so files are ready when config.nu loads

# Starship
let starship_cache = ($env.HOME | path join '.cache' 'starship' 'init.nu')
let starship_dir = ($env.HOME | path join '.cache' 'starship')
if not ($starship_dir | path exists) {
    mkdir $starship_dir
}
if not ($starship_cache | path exists) {
    starship init nu | save -f $starship_cache
}

# Zoxide
let zoxide_cache = ($env.HOME | path join '.zoxide.nu')
if not ($zoxide_cache | path exists) {
    zoxide init nushell --cmd=cd | save -f $zoxide_cache
}

# Carapace
let carapace_dir = ($env.HOME | path join '.cache' 'carapace')
let carapace_cache = ($env.HOME | path join '.cache' 'carapace' 'init.nu')
if not ($carapace_dir | path exists) {
    mkdir $carapace_dir
}
if not ($carapace_cache | path exists) {
    carapace _carapace nushell | save --force $carapace_cache
}

# Mise
let mise_path = $nu.default-config-dir | path join mise.nu
^mise activate nu | save $mise_path --force
