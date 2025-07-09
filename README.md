# Nix macOS Starter

A beginner-friendly Nix configuration for macOS using flakes, nix-darwin, Home Manager, and Mise.

## About

A clean, well-documented starting point for managing your macOS system declaratively with Nix. Includes sensible defaults for development tools, shell configuration, and system settings.

**Author:** Ben Gubler

## Prerequisites

1. **Install Nix** using the [Determinate Systems installer](https://docs.determinate.systems/#products) (download the graphical installer for macOS). After installation, restart your terminal.

2. **Install Homebrew** from [brew.sh](https://brew.sh) if you want to use the GUI applications included in this configuration.

## Quick Start

### 1. Clone and Configure

```bash
# Clone the repository
git clone https://github.com/nebrelbug/nix-macos-starter ~/.config/nix
cd ~/.config/nix
```

### 2. Customize Your Configuration

**For Intel Mac Users:** Change the system architecture in `flake.nix` from `"aarch64-darwin"` to `"x86_64-darwin"` on line 28.

**Replace all placeholders:**

- `modules/git.nix`: `YOUR_NAME`, `YOUR_EMAIL`, `YOUR_USERNAME`
- `modules/home-manager.nix`: `YOUR_USERNAME`
- `platforms/darwin.nix`: `YOUR_USERNAME` (appears 3 times)
- `hosts/my-macbook/configuration.nix`: `YOUR_USERNAME`

### 3. Apply the Configuration

```bash
# Build and switch to the configuration
darwin-rebuild switch --flake .#my-macbook

# Or use the alias after initial setup
nix-switch
```

## What's Included

**Development Tools**: [mise](https://mise.jdx.dev/) for Node.js/Python/Rust/etc., Zsh with Starship prompt, essential CLI tools (curl, vim, tmux, htop, tree, ripgrep, gh, zoxide), code quality tools (nil, biome, nixfmt-rfc-style)

**GUI Applications**: Cursor, Ghostty, VS Code, Zed, Raycast, CleanShot, Discord, Slack, 1Password, Brave Browser, Obsidian, Spotify

**System Configuration**: Git setup, macOS optimizations (Finder, Touch ID sudo), Nix settings (flakes, garbage collection)

## Project Structure

```
nix-macos-starter/
├── flake.nix                    # Main flake configuration and inputs
├── hosts/
│   └── my-macbook/
│       ├── configuration.nix    # Host-specific packages and settings
│       └── custom-scripts.sh    # Custom shell scripts
├── modules/
│   ├── git.nix                  # Git configuration
│   ├── home-manager.nix         # User packages and home directory setup
│   ├── homebrew-common.nix      # GUI applications via Homebrew
│   ├── mise.nix                 # Development runtime management
│   └── zsh.nix                  # Shell configuration
└── platforms/
    ├── darwin.nix               # macOS-specific system settings
    └── shared.nix               # Cross-platform Nix settings
```

## Customization

**Add CLI Tools**: Edit `modules/home-manager.nix` packages array  
**Add GUI Apps**: Edit `modules/homebrew-common.nix` casks array  
**Add Development Tools**: Add `${pkgs.mise}/bin/mise use --global tool@version` to `modules/home-manager.nix` activation script  
**Host-Specific Config**: Use `hosts/my-macbook/configuration.nix` and `custom-scripts.sh`

## Troubleshooting

**"Command not found"**: Restart terminal  
**Permission denied**: Use `sudo darwin-rebuild switch --flake .#my-macbook`  
**Homebrew apps not installing**: Install Homebrew first, ensure `/opt/homebrew/bin` in PATH  
**Git config not applying**: Replace all `YOUR_*` placeholders, re-run darwin-rebuild

**Need help?** Check [Nix manual](https://nixos.org/manual/nix/stable/), [nix-darwin docs](https://github.com/LnL7/nix-darwin), [Home Manager options](https://nix-community.github.io/home-manager/options.html)

## Credits

- [Ethan Niser](https://github.com/ethanniser) for his [config repo](https://github.com/ethanniser/config) which I used as a reference for this project.
- David Haupt's excellent [tutorial series](https://davi.sh/blog/2024/01/nix-darwin/) which (although slightly outdated) helped me understand the basics of Nix.
