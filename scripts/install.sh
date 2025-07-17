#!/bin/bash
# rmtrix installer script

set -e

echo "Installing rmtrix..."

# Download and install
INSTALL_DIR="/usr/local/bin"
VERSION="0.1"
DOWNLOAD_URL="https://github.com/meettak/rmtrix/releases/download/v${VERSION}/rmtrix-shadow-${VERSION}.zip"

# Create temporary directory
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

# Download
echo "Downloading rmtrix v${VERSION}..."
curl -L -o rmtrix.zip "$DOWNLOAD_URL"

# Extract
unzip rmtrix.zip
cd "rmtrix-shadow-${VERSION}"

# Install
echo "Installing to ${INSTALL_DIR}..."
sudo cp bin/rmtrix "$INSTALL_DIR/"
sudo mkdir -p /usr/local/lib
sudo cp lib/rmtrix-${VERSION}-all.jar /usr/local/lib/

# Clean up
rm -rf "$TMP_DIR"

echo "✅ rmtrix installed successfully!"
echo "Usage: rmtrix Search -s <search_term>"
echo "       rmtrix Remove -r <remove_term>"
