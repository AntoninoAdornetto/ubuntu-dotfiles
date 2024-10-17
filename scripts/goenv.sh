#!/bin/bash

TARGET_DIR="$HOME/Development/src-builds/goenv"
ZSH_PATH="$HOME/.zshrc"
GO_VERSION="1.23.1"

if [ -d $TARGET_DIR ]; then
	rm -rf $TARGET_DIR
fi

# Clone goenv into our src-builds directory
git clone https://github.com/go-nv/goenv.git $TARGET_DIR

##################################################################
# FOR NOW, I WILL COMMIT THE BELOW GOENV ENVS TO .ZSHRC SO THAT  #
# WE DO NOT NEED TO CONCERN OURSELVES WITH APPENDING THEM AT THE #
# TIME THE SCRIPT IS EXECUTED.                                   #
##################################################################

# Define env vars to point to the path where goenv repo is cloned
# echo "" >> $ZSH_PATH
# echo "export GOENV_ROOT=\"$TARGET_DIR\"" >> "$ZSH_PATH"
# echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> $ZSH_PATH
# echo 'eval "$(goenv init -)"' >> $ZSH_PATH
# echo 'export PATH="$GOROOT/bin:$PATH"' >> $ZSH_PATH
# echo 'export PATH="$PATH:$GOPATH/bin"' >> $ZSH_PATH

# exporting in current session so we can install and set global go version
export GOENV_ROOT="$TARGET_DIR"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# Install go
goenv install $GO_VERSION
goenv global $GO_VERSION

# Turn dat shit off. Google you cuck
go telemetry off
