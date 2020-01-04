echo "Installing brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing rbenv"
brew install rbenv

echo "Installing miniconda3"
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh | bash

echo "Installing Heroku CLI"
brew tap heroku/brew && brew install heroku

echo "Installing NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
