# 🌙 dotfiles, btw

My daily driver desktop config running **Niri** + **Noctalia Shell** on **CachyOS**.

![Tokyo Night](https://img.shields.io/badge/theme-Tokyo%20Night-7aa2f7?style=flat-square)
![Niri](https://img.shields.io/badge/compositor-Niri-7dcfff?style=flat-square)
![CachyOS](https://img.shields.io/badge/distro-CachyOS-9ece6a?style=flat-square)
![Wayland](https://img.shields.io/badge/display-Wayland-bb9af7?style=flat-square)

## 🖥️ Setup

| Component | Choice |
|---|---|
| **Distro** | CachyOS (Arch-based) |
| **Compositor** | Niri |
| **Shell/Bar** | Noctalia (Quickshell) |
| **Terminal** | Ghostty |
| **Shell** | ZSH + Oh My ZSH + Powerlevel10k |
| **Launcher** | Rofi |
| **Lock Screen** | Hyprlock |
| **File Manager** | Nautilus |
| **Theme** | Tokyo Night |
| **Font** | JetBrains Mono |

## 📁 Structure

```
.
├── ghostty/          → ~/.config/ghostty
│   └── config
├── hypr/             → ~/.config/hypr
│   └── hyprlock.conf
├── niri/             → ~/.config/niri
│   └── config.kdl
├── noctalia/         → ~/.config/noctalia
│   └── settings.json
├── rofi/             → ~/.config/rofi
│   ├── config.rasi
│   └── tokyonight.rasi
└── install.sh
```

## 🚀 Installation

```bash
git clone https://github.com/daniel-phage/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

The install script symlinks config directories to `~/.config/`. Existing configs are backed up with a timestamp before being replaced.

## 📦 Dependencies

```bash
pacman -S niri ghostty rofi-wayland nautilus
```

```bash
# AUR / manual install
yay -S hyprlock noctalia-git quickshell-git
```

> **Note:** Adjust AUR package names as needed — check CachyOS repos first as some may be available there.

## 🔒 Lock Screen

Hyprlock with Tokyo Night colors, blurred screenshot background, and a dynamic time-based greeting.

## ⚙️ Niri Highlights

- Scrolling tiling window manager (Wayland-native)
- `focus-follows-mouse` enabled
- 3440x1440 @ 175Hz ultrawide config
- Window corner radius with shadows
- Polkit agent: `polkit-gnome-authentication-agent-1`

## 📝 Notes

- Make sure to add the polkit agent to your Niri startup if apps like BTRFS Assistant need privilege escalation
- Rofi uses the `tokyonight.rasi` theme — adjust the path in `config.rasi` if your dotfiles location differs

## 📄 License

This repo is under a permissive MIT License that you can read about [here](LICENSE.MD).
