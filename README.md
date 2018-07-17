MDE (mac-dev-env)
===========

Self executing script v.1. Please read through script.

	$ sh ./init.sh

---

### General Notes
Assumes this is on a fresh install of OSX High Sierra. If you already have an environment setup, dont run the init.sh script, rather comb through this and cherry pick. Hopefully you're not using mamp or the like. =P


Mac Dev Env Setup consists of:

	homebrew
	update mac unix tools
	correct paths
	git
	ruby
	mysql/mariadb
	node
	nginx
	composer
	bundler
	cask - pretty much all your apps
	SublimeText3 / Chrome extensions
	iTerm settings
	And more..

# If cherry picking, follow the order below.

1. system pref
	* change name of computer
	* mouse/trackpad settings
	* hotspots

2. software updates
	* make sure youve updated everything.

3. xcode dev tools:
	* `$ xcode-select --install`
		* get xcode
		* install dev tools

## homebrew
	$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	$ echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
	$ brew doctor
	$ brew update
	$ brew upgrade
	$ brew install imagemagick


## Update the unix tools you already have on your mac.
1. Install GNU core utilities (those that come with OS X are outdated)
	* `$ brew install coreutils`

2. Install GNU "find", "locate", "updatedb", and "xargs", g-prefixed
	* `$ brew install findutils`

### Install more recent versions of some OS X tools
`$ brew install grep`

#### You'll need to update PATH in your ~/.bash_profile to use these over their Mac counterparts:

	$ echo export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH" >> ~/.bash_profile
	$ brew cleanup


### mysql
	$ brew install mysql
	$ mysql.server restart
	# Run the Database Installer
	$ mysql_secure_installation

### MariaDB
	$ brew unlink mysql
	$ brew info mariadb # Verify MariaDB Version in Homebrew Repo
	$ brew install mariadb # Install MariaDB
	$ brew services start mariadb # Start MariaDB

### SequelPro
SequelPro is installed via apps.sh if you're running the init.sh script with a few other apps. To use with MariaDB/MySql, add new Favorite in SequelPro sidebar, and set the host to 127.0.0.1 with the username 'root' and whatever password you set above in the MariaDB setup. Test connection, and save it. Now you can easily connect to all your local databases!

### Git
	$ brew install git

	# Write settings to ~/.gitconfig
	$ git config --global user.name '{YOUR NAME}'
	$ git config --global user.email {YOUR EMAIL}

	# a global git ignore file:
	$ git config --global core.excludesfile '~/.gitignore'
	$ echo '.DS_Store' >> ~/.gitignore

	# use keychain for storing passwords
	$ git config --global credential.helper osxkeychain

	# you might not see colors without this
	$ git config --global color.ui true

	# more useful settings: https://github.com/glebm/dotfiles/blob/master/.gitconfig

	# ssh keys - probably can skip this since github app auto adds it for you which is nice
	$ ls -al ~/.ssh # Lists the files in your .ssh directory, if they exist
	$ ssh-keygen -t rsa -C "your_email@example.com" # Creates a new ssh key, using the provided email as a label
	$ eval "$(ssh-agent -s)" # start the ssh-agent in the background
	$ ssh-add ~/.ssh/id_rsa
	$ pbcopy < ~/.ssh/id_rsa.pub # Copies the contents of the id_rsa.pub file to your clipboard to paste in github or w/e

### RVM
	$ curl -L https://get.rvm.io | bash -s stable --ruby
	$ brew update && brew upgrade
	$ rvm reinstall 2.4.1 --disable-binary

### Node
	$ brew update
	$ brew install node

### Composer
	$ brew update
	$ brew install composer
	
### Yarn (alternative to node)
	$ brew install yarn
	
### Bundler
	$ gem install bundler
	# now you can use guard within projects

### Cask
	$ brew cask
		// If you want to install beta versions of things like Chrome Canary or Sublime Text 3,
	$ brew cask install google-chrome # per app
	$ brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup # when done

	// fonts
	$ brew tap caskroom/fonts

	// apps
	# bash script to install apps -> apps.sh
	$ sh apps.sh # run it

### iterm
	$ cd ~
	$ curl -O https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.bash_profile
	$ curl -O https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.bash_prompt
	$ curl -O https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.aliases

### chrome extenstions
* page speed insights
* yslow
* sway keys
* jsonview/jsonviewer
* postman
* Restlet Client
* Web Developer Checklist
* ublock origin
* snatcher2
* css peeper
* eye dropper
* panda
* onetab

### Sublime Text 3
#### install package installer
1. `ctrl+` tilda opens console in sublime, paste below into console.
2. `import urllib.request,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)`

#### ST3 Packages
1. material
1. sidebar-enhnacemnets
1. emmet
1. sass/scss


### Local OSX LEMP/LAMP Environment

More on this later...for now use docker.


## Notes

1. The init.sh script also installs a few other things such as: adobe-creative-cloud, MongoDB, Reddis, PostgreSQL - and you can setup your git global creds from the script as well.

2. Use [Ghosts](https://github.com/kiriaze/ghost) when creating new projects in conjuncture with this setup, and have a beer cuz you just became a fly ass mother fucker. A one liner to reference below: 
	```
	bash <(curl -s https://raw.githubusercontent.com/kiriaze/ghosts/master/ghosts.sh)
	```

## Todos

Include usage of MongoDB, Reddis, PostgreSQL.

Consider dot files or a workaround for symlinking ( although osx deletes it on upgrade ) the httpd.conf file and others for local setup to prevent overwriting on OS upgrade.
