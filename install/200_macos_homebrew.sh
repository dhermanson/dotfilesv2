# Install Homebrew
if [[ ! "$(type -P brew)" ]]; then
  echo "Installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Exit if, for some reason, Homebrew is not installed.
if [[ ! "$(type -P brew)" ]]; then
  echo "Error installing Homebrew"
  exit 1
fi

echo "Updating Homebrew"
brew doctor
brew update

echo "Tapping Homebrew/bundle"
brew tap Homebrew/bundle
