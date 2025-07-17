# Homebrew Tap Setup Instructions

## 1. Create a new GitHub repository named "homebrew-rmtrix"
#    Repository URL: https://github.com/meettak/homebrew-rmtrix

## 2. Clone and set up the tap repository
git clone https://github.com/meettak/homebrew-rmtrix.git
cd homebrew-rmtrix
mkdir Formula
cp /Users/meettak/Downloads/rmtrix/Formula/rmtrix.rb Formula/

## 3. Commit and push
git add .
git commit -m "Add rmtrix formula"
git push origin main

## 4. Users install with:
brew tap meettak/rmtrix
brew install rmtrix

## 5. Or in one command:
brew install meettak/rmtrix/rmtrix
