# config.nu
#
# Installed by:
# version = "0.109.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
# Nushell Config File

# History configuration
$env.config = {
    show_banner: true
    
    history: {
        max_size: 1000000
        sync_on_enter: true
        file_format: "sqlite"
    }
    
    completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: "fuzzy"
    }
    
    color_config: {
        separator: white
        leading_trailing_space_bg: { attr: n }
        header: green_bold
        empty: blue
        bool: white
        int: white
        filesize: cyan
        duration: white
        date: purple
        range: white
        float: white
        string: white
        nothing: white
        binary: white
        cellpath: white
        row_index: green_bold
        record: white
        list: white
        block: white
        hints: dark_gray
    }
    
    float_precision: 2
    use_ansi_coloring: true
    buffer_editor: "nvim"
}

# Aliases
alias cat = bat -n --paging=never
alias dig = doggo
alias grep = rg
alias l = ls -al
#alias l = eza -la
#alias ls = eza
alias pnx = pnpm nx
alias bnx = bunx nx
alias ps = procs
alias vim = nvim
alias tailscale = /Applications/Tailscale.app/Contents/MacOS/Tailscale

# GPG reset function
def gpgreset [] {
    gpg-connect-agent killagent /bye
    gpg-connect-agent updatestartuptty /bye
    gpg-connect-agent /bye
}

# Load integrations (files were generated in env.nu)
source ~/.cache/starship/init.nu
source ~/.zoxide.nu
source ~/.cache/carapace/init.nu
use ($nu.default-config-dir | path join mise.nu)
