#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Install Minetest

VERSION="master"

tmp_archive="$(mktemp)"
curl -fsSL "https://github.com/minetest/minetest/archive/$VERSION.tar.gz" \
    -o "$tmp_archive"
tmp_dir="$(mktemp -d)"
tar xf "$tmp_archive" --strip-components=1 --one-top-level="$tmp_dir/"
rm "$tmp_archive"

cd "$tmp_dir/"
tmp_archive="$(mktemp)"
curl -fsSL "https://github.com/minetest/minetest_game/archive/$VERSION.tar.gz" \
    -o "$tmp_archive"
tar xf "$tmp_archive" --strip-components=1 --one-top-level="games/minetest_game/"
rm "$tmp_archive"

cmake -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Release
cmake --build build
sudo cmake --build build -- install
rm -rf "${tmp_dir:?}/"
