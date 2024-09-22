#!/bin/bash

OUT_DIR="$(pwd)/scripts/downloads"
VERSION="1.30.1"
ARCH="x86_64"
TYPE="linux.AppImage"
OUT="bruno_${VERSION}_${ARCH}_${TYPE}"

if [ -e "$OUT_DIR/bruno*" ]; then
    echo "Removing previous Bruno app image from [$OUT_DIR]"
    rm "$OUT_DIR/bruno*"
fi

if [ -f /usr/bin/bruno ]; then
    echo "Removing previous Bruno app image from [/usr/bin/bruno]"
    sudo rm /usr/bin/bruno
fi


# Fetch the bruno release (AppImage)
curl -Lo "$OUT_DIR/$OUT" "https://github.com/usebruno/bruno/releases/download/v${VERSION}/bruno_${VERSION}_${ARCH}_${TYPE}"

chmod +x "$OUT_DIR/$OUT"

mv "$OUT_DIR/$OUT" "$OUT_DIR/bruno"

# Move to bin dir
sudo mv "$OUT_DIR/bruno" /usr/bin/
