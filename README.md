# 🐧 My NixOS Configuration

Welcome to my personal NixOS setup! This repository holds all the configuration files I use to run a minimal, efficient, and highly customizable Linux desktop. It leverages:

- **Nix Flakes** for reproducible, modular system and user configuration  
- **Home Manager** for declarative management of user environments  
- **Hyprland** as a modern, Wayland-based tiling window manager  

Feel free to browse, fork, or adapt this setup for your own system—just be sure to update host‑ and user‑specific details!

---

## 📦 What’s Included

| Component                      | Description                                                                                     |
|--------------------------------|-------------------------------------------------------------------------------------------------|
| **Nix Flakes**                 | Reproducible, versioned system and Home Manager configs.                                        |
| **Home Manager**               | Declarative user environment (dotfiles, shells, editors, services).                             |
| **Hyprland**                   | Dynamic tiling Wayland compositor with smooth animations.                                       |
| **Ghostty**                    | GPU‑accelerated terminal emulator with a minimal UI.                                            |
| **GRUB 2**                     | Bootloader with UEFI support, configured in `configuration.nix`.                                |
| **Zsh + Powerlevel10k**        | Fast shell with a highly customizable prompt.                                                   |
| **Neovim**                     | Fully featured editor (LSP, Tree‑sitter, plugins), with per‑environment configs.                |
| **Waybar**                     | Status bar for Wayland, showing workspaces, system stats, battery, network, and more.           |
| **Nixpkgs‑unstable overlay**   | Access to bleeding‑edge packages when needed.                                                   |

---

## 🚀 Quick Start

1. **Clone** the repo:  
   ```bash
   git clone https://github.com/<your‑username>/<repo>.git
   cd <repo>
   ```

2. **Rebuild** your system (replace placeholders):  
   ```bash
   sudo nixos-rebuild switch --flake .#<hostname>
   home-manager switch --flake .#<username>@<hostname>
   ```

3. **Enjoy** a fully declarative, lightning‑fast environment!

---

## 🔧 Environments & Editor Configs

I maintain three distinct “profiles” (environments) each with its own Neovim setup:

| Profile     | Use Case                           | Neovim Config          |
|-------------|------------------------------------|------------------------|
| **default** | General daily use                  | `/apps/neovim/default` |
| **python**  | Python development (venvs, linting)| `/apps/neovim/python`  |
| **cpp**     | C/C++ projects (clangd, cmake)     | `/apps/neovim/cpp`     |

Switch environments by selecting your dotfiles in `home/<username>.nix`, or by exporting:
```zsh
dev-ENV_PROFILE
# the dev-ENV_PROFILE has be defined in the home.nix file.
```

---

## 🔄 `status.sh`: Prompt & Status Helper

The `scripts/status.sh` script integrates with **Powerlevel10k** (via `.p10k.zsh`) to toggle your shell prompt and status bar between profiles:

1. **Reads** the `ENV_PROFILE` environment variable  
2. **Outputs** a simple icon or label (e.g. `🐍 python >`, `⚙️ default >`, `💠 cpp >`)  
3. **Powerlevel10k** picks it up via a custom prompt segment  

Example snippet in your `~/.p10k.zsh`:
```zsh
# ~/.p10k.zsh
POWERLEVEL9K_PROMPT_CHAT_{OK,ERROR}_VIINS_CONTENT_EXPANTION='$Status >'
```
---

## 📝 License

This repo is MIT‑licensed. Use, adapt, and share—just don’t forget to give credit if you find it useful!

---
