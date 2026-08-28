# ~/Library/Application Support/nushell/login.nu
#
# Run mise once for editor/login-shell environment capture.
# Interactive shells still use mise's normal hooks from config.nu.

def "parse mise vars" [] {
  $in | from csv --noheaders --no-infer | rename op name value
}

def --env "apply mise vars" [] {
  for var in $in {
    if $var.op == "set" {
      if ($var.name | str uppercase) == "PATH" {
        $env.PATH = (
          $var.value
          | split row (char esep)
          | uniq
        )
      } else {
        load-env { ($var.name): $var.value }
      }
    } else if $var.op == "hide" and $var.name in $env {
      hide-env $var.name
    }
  }
}

let mise_bin = "/opt/homebrew/bin/mise"

if ($mise_bin | path exists) {
  ^$mise_bin hook-env -s nu
    | parse mise vars
    | apply mise vars
}

if "PATH" in $env {
  $env.PATH = ($env.PATH | uniq)
}
