##############################################################################################################
### homebrew!

# (if your machine has /usr/local locked down (like google's), you can do this to place everything in ~/.homebrew
mkdir $HOME/.homebrew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C $HOME/.homebrew
export PATH=$HOME/.homebrew/bin:$HOME/.homebrew/sbin:$PATH

# install all the things
./brew.sh
./brew-cask.sh

### end of homebrew
##############################################################################################################




##############################################################################################################
### install of common things
###

# sexy git diffs
npm install -g diff-so-fancy

# change to bash 4 (installed by homebrew)
BASHPATH=$(brew --prefix)/bin/bash
#sudo echo $BASHPATH >> /etc/shells
sudo bash -c 'echo $(brew --prefix)/bin/bash >> /etc/shells'
chsh -s $BASHPATH # will set for current user only.
echo $BASH_VERSION # should be 4.x not the old 3.2.X
# Later, confirm iterm settings aren't conflicting.

# setting up the atom symlink
ln -s /Applications/Atom.app/Contents/Resources/app/atom.sh /usr/local/bin/atom


###
##############################################################################################################



# improve perf of git inside of chromium checkout
# https://chromium.googlesource.com/chromium/src/+/master/docs/mac_build_instructions.md

sudo sysctl kern.maxvnodes=$((512*1024))

echo kern.maxvnodes=$((512*1024)) | sudo tee -a /etc/sysctl.conf

# speed up git status (to run only in chromium repo)
git config status.showuntrackedfiles no
git update-index --untracked-cache

# also this unrelated thing
git config user.email "paulirish@chromium.org"


##############################################################################################################
### remaining configuration
###

# set up osx defaults
#   maybe something else in here https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh
sh .osx

###
##############################################################################################################



##############################################################################################################
### symlinks to link dotfiles into ~/
###

#   move git credentials into ~/.gitconfig.local    	http://stackoverflow.com/a/13615531/89484
#   now .gitconfig can be shared across all machines and only the .local changes

# symlink it up!
./symlink-setup.sh

###
##############################################################################################################
