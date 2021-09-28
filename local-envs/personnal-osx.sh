#!/usr/bin/env bash
# Enable usage :
# source ./personnal-stack.sh
#
# Usage :
# p-<action> : ex p-code-ui Install all code interfaces
# p-all install all on device
#
# WARNING : Recommanded to lauch as sudo
#
# Start exec
# =======
# Install brew if missing
command -v brew &>/dev/null && echo '' ||\
       	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

function android {
	# Android dev env
	brew install --cask temurin;
	brew install --cask android-commandlinetools;
	brew install gradle
	brew install android-sdk
}

function p-brew-apps {
	brew install --cask appcleaner;
	brew install --cask malwarebytes;
	brew install --cask ccleaner;
	brew install --cask omnidisksweeper;
	brew install --cask onyx;
	# Torrent client
	brew install --cask transmission;

}

function p-appstore-apps {
	brew install mas;
	mas lucky Xcode;
	mas lucky Trello;
	mas lucky betternet;
}

function p-excel {
# Excel crack
	brew install --cask microsoft-excel;
	wget https://gist.github.com/zthxxx/9ddc171d00df98cbf8b4b0d8469ce90a/raw/61a60e3a9754fe0b36919bcf14d7ef12a0e386a9/Microsoft_Office_2019_VL_Serializer.pkg -O license_serializer.pkg;
	sudo installer -pkg license_serializer.pkg -target /;
	rm -rf license_serializer.pkg
}

function p-code {
	brew install fish;
	cp -f fish/config.fish ~/.config/fish/config.fish;
	# TODO install node from paas repo
	# TODO install go from paas repo
	brew install yarn --ignore-dependencies;
	brew install --cask miniconda;
	brew install php;
	brew install composer;
	brew install nginx;
	echo 'export PATH="~/.composer/vendor/bin:$PATH"' >> /etc/profile;
	composer global require laravel/valet;
	valet install;
	brew install trash;
}

function p-ops {
	brew install --cask docker;
	brew install --cask iterm2;
	brew install wireshark;
	brew install --cask vnc-viewer;
	brew install --cask virtualbox;
	brew install vagrant;
}

function p-code-ui {
	brew install --cask postman;
	brew install --cask visual-studio-code;
	brew install --cask mongodb-compass;
	brew install --cask sequel-pro;
	# brew install --cask phpstorm;
	brew install --cask intellij-idea;
}

# Recommanded
function p-all {
	p-brew-apps;
	p-appstore-apps;
	p-excel;
	android;
	p-code;
	p-ops;
	p-code-ui;
}

if [ "${1}" == "all" ];then
	p-all
fi	