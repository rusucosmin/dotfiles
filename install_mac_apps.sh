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

echo "Installing kubectl"
brew install kubectl

echo "Installing Postgres"
brew install postgres
echo "Creating postgres user"
brew services start postgres
createuser -s postgres

echo "Installing Redis"
brew install redis
brew services start redis
