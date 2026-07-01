# dotfiles

macOS configuration as a self-contained nix-darwin flake. One
`darwin-rebuild switch` provisions the whole machine: system defaults, Homebrew
casks, shell, git, and CLI tools.

## Layout

```
flake.nix          hosts, inputs, and lib.mkHost
modules/darwin/    system.nix · homebrew.nix · defaults.nix
modules/home/      shell.nix · git.nix · tools.nix
```

## Apply

```bash
darwin-rebuild switch --flake ~/Projects/dotfiles#Gabriels-MacBook-Pro
```

First run, before nix-darwin is installed:

```bash
nix run nix-darwin -- switch --flake ~/Projects/dotfiles#Gabriels-MacBook-Pro
```

## Hosts

Each machine is one `mkHost` in `flake.nix`:

```nix
darwinConfigurations."<hostname>" = mkHost {
  hostname = "<hostname>";
  username = "<user>";
};
```

## Extending

`mkHost` takes optional `darwinModules` and `homeModules`, so another flake can
layer extra configuration on top without this repo depending on it:

```nix
inputs.dotfiles.url = "github:Adrastopoulos/dotfiles";

# ...
dotfiles.lib.mkHost {
  hostname = "<hostname>";
  username = "<user>";
  homeModules = [ ./extra.nix ];
};
```

## Per-project toolchains

Language runtimes are per-project via a flake and `direnv` (`nix-direnv` is
enabled), not global:

```bash
echo 'use flake' > .envrc && direnv allow
```
