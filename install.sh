#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

# Map repo dirs to config dirs
declare -A MAPPINGS=(
    ["ghostty"]="$CONFIG_DIR/ghostty"
    ["hypr"]="$CONFIG_DIR/hypr"
    ["niri"]="$CONFIG_DIR/niri"
    ["noctalia"]="$CONFIG_DIR/noctalia"
    ["rofi"]="$CONFIG_DIR/rofi"
)

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

info()  { echo -e "${GREEN}[✓]${NC} $1"; }
warn()  { echo -e "${YELLOW}[!]${NC} $1"; }
error() { echo -e "${RED}[✗]${NC} $1"; }

echo "╭──────────────────────────────╮"
echo "│     Dotfiles Installer       │"
echo "╰──────────────────────────────╯"
echo ""
echo "Dotfiles dir: $DOTFILES"
echo "Config dir:   $CONFIG_DIR"
echo ""

for dir in "${!MAPPINGS[@]}"; do
    target="${MAPPINGS[$dir]}"
    source="$DOTFILES/$dir"

    if [[ ! -d "$source" ]]; then
        error "Source not found: $source"
        continue
    fi

    # Create parent dir if needed
    mkdir -p "$(dirname "$target")"

    # Handle existing config
    if [[ -L "$target" ]]; then
        existing="$(readlink -f "$target")"
        if [[ "$existing" == "$source" ]]; then
            info "$dir → already linked"
            continue
        fi
        warn "$dir → removing old symlink ($existing)"
        rm "$target"
    elif [[ -d "$target" ]]; then
        backup="$target.bak.$(date +%Y%m%d%H%M%S)"
        warn "$dir → backing up existing config to $backup"
        mv "$target" "$backup"
    fi

    ln -s "$source" "$target"
    info "$dir → $target"
done

echo ""
info "Done! You may need to reload Niri config (Mod+Shift+E or niri msg action reload-config)"
