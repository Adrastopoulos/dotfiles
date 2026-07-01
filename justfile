default:
    @just --list

# Apply the configuration to this machine
switch:
    sudo darwin-rebuild switch --flake .

# Build without activating (validate a change)
build:
    nix build ".#darwinConfigurations.$(scutil --get LocalHostName).system"

# Update all flake inputs
update:
    nix flake update
