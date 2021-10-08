echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Installing rbenv"
brew install rbenv

echo "Installing Heroku CLI"
brew tap heroku/brew && brew install heroku

echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

echo "Installing Azure CLI"
brew install azure-cli
