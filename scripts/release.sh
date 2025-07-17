#!/bin/bash

# Script to create a GitHub release with rmtrix distribution

VERSION="0.1"
PROJECT_DIR="/Users/meettak/Downloads/rmtrix"

echo "Building rmtrix v$VERSION..."
cd "$PROJECT_DIR"
./gradlew clean build

echo "Creating release artifacts..."
cd build/distributions

# Calculate SHA256 for the zip file
SHA256=$(shasum -a 256 rmtrix-shadow-$VERSION.zip | cut -d ' ' -f 1)
echo "SHA256: $SHA256"

echo "Release artifacts ready:"
echo "- rmtrix-shadow-$VERSION.zip"
echo "- rmtrix-shadow-$VERSION.tar"
echo ""
echo "Next steps:"
echo "1. Create a GitHub release tagged 'v$VERSION'"
echo "2. Upload rmtrix-shadow-$VERSION.zip to the release"
echo "3. Update the Homebrew formula with SHA256: $SHA256"
echo "4. Submit to Homebrew or create your own tap"
