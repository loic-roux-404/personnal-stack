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


function p-essentials {
	brew install --cask messenger
	brew install --cask google-drive
	brew install --cask macfuse
	brew install bar-magnet
	brew install --cask staruml
	brew install --cask the-unarchiver
	brew install --cask firefox
	brew install --cask chrome
	brew install wget
    brew install --cask notion
    brew install --cask deepl
}

function p-brew-apps {
	brew install --cask appcleaner;
	brew install --cask malwarebytes;
	brew install --cask ccleaner;
	brew install --cask omnidisksweeper;
	brew install --cask onyx;
	# Torrent client
	brew install --cask transmission;
	brew install --cask dolphin;
	brew install --cask openemu;
	brew install --cask calibre;
	brew install --cask telegram;
	brew install --cask discord;
	brew install --cask spotify;
	brew install --cask figma
	brew install --cask microsoft-teams
	brew install --cask openemu;
}

function p-crypto {
	brew install --cask  ledger-live
	wget https://github.com/greymass/anchor/releases/download/v1.3.2/mac-anchor-wallet-1.3.2-x64.dmg -O anchor.dmg
	hdiutil mount anchor.dmg
	sudo cp -R "/Volumes/Anchor\ Wallet/Anchor\ Wallet.app" /Applications
	rm -rf anchor.dmg
	hdiutil unmount "/Volumes/Anchor\ Wallet"
}

function p-appstore-apps {
	brew install mas;
	mas lucky Xcode;
	mas lucky Trello;
	mas lucky betternet;
	mas lucky Linguee;
}

function p-office {
# Excel crack
	brew install --cask microsoft-excel;
	# brew install --cask microsoft-word;
	# brew install --cask microsoft-powerpoint;
	wget https://gist.github.com/zthxxx/9ddc171d00df98cbf8b4b0d8469ce90a/raw/61a60e3a9754fe0b36919bcf14d7ef12a0e386a9/Microsoft_Office_2019_VL_Serializer.pkg -O license_serializer.pkg;
	sudo installer -pkg license_serializer.pkg -target /;
	rm -rf license_serializer.pkg
}

function p-code {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	echo "set PATH $HOME/.cargo/bin $PATH" >> ~/.config/fish/config.fish 

	echo 'export LC_ALL=en_US.UTF-8\nexport LANG=en_US.UTF-8' >> ~/.zshrc
	echo 'fish' >> ~/.zshrc
	brew install svn
	brew tap homebrew/cask-fonts
	brew install --cask font-fira-mono-for-powerline
	brew install fish;
	sudo ln -sf $(which fish) /usr/local/bin;
	echo $(which fish) | sudo tee -a /etc/shells
	chsh -s $(which fish)

	curl -fsSL https://git.io/g-install | sudo sh -s -- -y fish zsh
	sudo chown -R loic:staff $GOPATH $GOROOT

	brew install shellcheck
	brew install fzf;
	curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
	omf install agnoster

	curl -fls https://raw.githubusercontent.com/loic-roux-404/personnal-stack/master/local-envs/fish/config.fish -o ~/.config/fish/config.fish;

	sudo curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o /usr/local/bin/n && sudo chmod 755 /usr/local/bin/n
	brew install yarn --ignore-dependencies;

	brew install php;
	brew install composer;
	brew install nginx;
	echo 'export PATH="~/.composer/vendor/bin:$PATH"' >> /etc/profile;
	export PATH="~/.composer/vendor/bin:$PATH"
	composer global require laravel/valet;
	valet install;
	brew install trash;

	# rust vim
	git clone --depth=1 https://github.com/rust-lang/rust.vim.git ~/.vim/bundle/rust.vim
	echo "let g:rustfmt_autosave = 1" >> ~/.vimrc

	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh

	brew instal gh;
	brew instal glab;
	brew tap heroku/brew && brew install heroku;
	brew install netlify-cli;

	brew install flutter;

	curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh
	bash Mambaforge-$(uname)-$(uname -m).sh
	rm -rf Mambaforge-$(uname)-$(uname -m).sh
	conda init fish

	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source \
		&& fisher install jorgebucaran/fisher
}

function p-ops {
	brew install --cask docker;
	brew install --cask iterm2;
	brew install wireshark;
	brew install --cask vnc-viewer;
	sudo softwareupdate --install-rosetta
	# brew install --cask virtualbox;
	# On mac M1 replace it with https://customerconnect.vmware.com/downloads/get-download?downloadGroup=FUS-PUBTP-2021H1&download=false&fileId=b3cda4e0639c68f4374c553688ced75f
	# could try : brew install --cask vmware-fusion
	brew install vmware-fusion
	brew install vagrant;
	brew install packer;
	brew install shellcheck;
}

function p-code-ui {
	brew install --cask postman;
	brew install --cask visual-studio-code;
	brew install --cask mongodb-compass;
	brew install --cask sequel-pro;
	brew install --cask beekeeper-studio;
	# brew install --cask phpstorm;
	brew install --cask intellij-idea;
	brew install --cask staruml;
}

function pcode-ruby {
	brew install gpg
	curl -sSL https://rvm.io/mpapis.asc | gpg --import -
 	curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

	# Install RVM
	echo 409B6B1796C275462A1703113804BB82D39DC0E3:6: | gpg --import-ownertrust
 	echo 7D2BAF1CF37B13E2069D6956105BD0E739499BDB:6: | gpg --import-ownertrust
	curl -sSL https://get.rvm.io | bash -s -- --ignore-dotfiles
	echo 'source $HOME/.rvm/scripts/rvm' >> ~/.zshrc
	# For fish
	curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
	echo "rvm default" >> ~/.config/fish/config.fish
}

function adobe {
	# Only PS and In for now
	echo '[ Please select ~/Downloads as destination to make it works ]'
	"$(pwd)"/local-envs/adobe/packager.command
	echo '[ Please Disable WIFI when opening .app in ~/Downloads, press ENTER when ok ]'
	read wifi
	open ~/Downloads/Install\ PHSP_23.1-en_US-macuniversal.app
    open ~/Downloads/Install\ Install IDSN_17.0.1-en_US-macuniversal.app
	echo -n "[ Apps installed ? press ENTER to finish patch IN and PS ]"
	read name
	sudo cp ./local-envs/adobe/InDesign_2022_17.0.1/* /Applications/Adobe\ InDesign\ 2022/Adobe\ InDesign\ 2022.app/Contents/MacOS
	sudo cp ./local-envs/adobe/Photoshop_2022_v23.1.0/* /Applications/Adobe\ Photoshop\ 2022/Adobe\ Photoshop\ 2022.app/Contents/MacOS
}

# Recommanded
function p-all {
	p-essentials;
	p-brew-apps;
	p-crypto;
	p-appstore-apps;
	p-office;
	p-code;
	p-ops;
	p-code-ui;
}
if [ "$0" = "${BASH_SOURCE[0]}" ];then
	p-all
	brew cleanup
fi
