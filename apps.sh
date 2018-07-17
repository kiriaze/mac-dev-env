#!/bin/bash
# Apps
apps=(
  adobe-creative-cloud
  anvil
  appcleaner
  atom
  caffeine
  carbon-copy-cloner
  cyberduck
  docker
  dropbox
  droplr
  firefox
  fluid
  flux
  iterm2
  keka
  launchrocket
  macdown
  moom
  namechanger
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlprettypatch
  qlstephen
  quicklook-csv
  quicklook-json
  screenflick
  sequel-pro
  sketch
  skype
  slack
  spotify
  sublime-text
  suspicious-package
  tomighty
  transmission
  transmit
  vagrant
  vlc
  webpquicklook
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}
