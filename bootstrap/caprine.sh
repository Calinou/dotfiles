#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Caprine

VERSION="2.31.2"

tmp_appimage="$(mktemp)"
tmp_dir="$(mktemp -d)"
curl -fsSL "https://github.com/sindresorhus/caprine/releases/download/v$VERSION/caprine-$VERSION-x86_64.AppImage" \
    -o "$tmp_appimage"
chmod +x "$tmp_appimage"
(cd "$tmp_dir" && "$tmp_appimage" --appimage-extract)
rm -rf "$HOME"/.local/{bin,opt}/caprine
mv "$tmp_dir/squashfs-root" "$HOME/.local/opt/caprine/"
rm -rf "$tmp_appimage" "$tmp_dir"

ln -s "$HOME/.local/opt/caprine/caprine" "$HOME/.local/bin/caprine"
convert -resize 256x256 \
    "$HOME/.local/opt/caprine/usr/share/icons/hicolor/0x0/apps/caprine.png" \
    "$HOME/.local/share/icons/hicolor/256x256/apps/caprine.png"

cat > "$HOME/.local/share/applications/caprine.desktop" << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Caprine
Comment=Facebook Messenger desktop app
Exec=$HOME/.local/bin/caprine
Icon=caprine
Categories=Internet;
EOF
