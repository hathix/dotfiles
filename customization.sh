# source this from your .bash_profile

# re-sources functions from this file
function resource {
	source ~/bin/customization.sh
}

function greet {
	echo Yo, `whoami`!
}

# Gives the current user ownership of the current file
# gimme file.txt
function gimme {
	chown `whoami` $1
}

# Clears the screen and adds a blank buffer on top to help you visualize.
function cleanse {
	clear && clear
}

# Standard Git add/commit/push workflow
# revolt "My commit message"
function revolt {
	git add -A
	git commit -m "$1"
	git push
}

# Pushes an already-initialized git repository to a GitHub repo
# github https://github.com/path/to/repo.git
function github {
	git add -A
	git commit -m "Initial commit"
	git remote add origin $1
	git push -u origin master
}

# Creates and switches to a new branch
function bough {
	git checkout -b $1
	git push --set-upstream origin $1
	revolt "Added new branch $1"
}

# Gets a branch with the given name from GitHub and sets up tracking.
# Make the branch on GitHub then paste its name here.
# hubbranch my-cool-branch
function hubbranch {
    git fetch origin
    git checkout -b $1 origin/$1
}

# lists all the people who have contributed to a git repo
alias contributors="git log --format='%aN' | sort -u"

# Prints out random stuff
function busywork {
	cat /dev/urandom | hexdump -C | grep "ca fe"
}

# Prints out your most-used commands
function halloffame {
	history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head -15
}

# opens http://localhost:{port}
function localhost {
	open http://localhost:$1
}

# Sends a packet to the given website and traces its route
# journey www.harvard.edu
function journey {
	traceroute -q 1 $1
}

# open10 http://harvard.edu — opens the given link 10 times
function open10 {
	open $1?asdf={,,,,,,,,,}
}

# Moves the specified file to trash
function trash {
	mv $1 ~/.Trash
}

# Batch renames all files with a given extension in a directory
# to have random filenames.
# randomize "JPG"
function randomize {
	for i in *.$1; do mv "$i" $RANDOM.$1; done
}

# moves all the files contained in subfolders of the current folder into the base level of this folder,
# emptying all subdirectories.
function flatten {
	find ./ -mindepth 2 -type f -exec mv -n '{}' ./ ';'
}

# searches for files with the given string in their names
# fname "controller"
function fname {
	find . -regex ".*$1.*"
}

# recursively changes the permissions of every file in
# the current directory to 0644 and every directory to
# 0755.
function fixperms {
	find ./ -type d -exec chmod 755 {} \;
	find ./ -type f -exec chmod 644 {} \;
}

# fills your terminal with a row of apples
function mac {
	echo "🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 🍏 🍎 "
}

# turns on/off the drop shadow on screenshots
# `dropshadow true` or `dropshadow false`
function dropshadow {
	defaults write com.apple.screencapture disable-shadow -bool $1
	killall SystemUIServer
}

## imagemagick

# crops `infile` to a `size`x`size` square and puts it in `outfile`.
# cropsquare infile size outfile
# cropsquare in.jpg 1024 out.jpg
function cropsquare {
	convert -gravity Center -crop $2x$2+0+0 +repage $1 $3
}

### aliases

# Runs resty
alias openresty=". ~/bin/resty"

alias ll="ls -alF $*"
alias a="atom ."
# alias j='autojump'
alias g='git'
alias ..='cd ..'
alias wifion='networksetup -setairportpower en0  On'
alias wifioff='networksetup -setairportpower en0  Off'

# git hub
eval "$(hub alias -s)"


# set up thefuck
eval $(thefuck --alias)

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="usr/local/bin:$PATH"

# use z (autojump fails
[[ -z $PS1 ]] || . ~/bin/z/z.sh


# customize terminal string

# coloring
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset


# export PS1="🍎  $bldred\h$txtrst:$txtcyn\W$txtrst $txtgrn\u$txtrst 💰  "
export PS1="🍎  \[$bldred\]\h\[$txtrst\]:\[$txtcyn\]\W\[$txtrst\] \[$txtgrn\]\u\[$txtrst\]💰  "
# export PS1="\h:\W \[$txtgrn\]\u$\[$txtrst\] "
