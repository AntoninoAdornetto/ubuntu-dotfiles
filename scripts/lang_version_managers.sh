#!/bin/bash

OUT_DIR="$HOME/Development/src-builds"

########################################
#          NODE VERSION MANAGER        #
########################################

# Fetch and run the installation script
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install and use the latest long term support version of node
nvm install --lts && nvm use --lts

########################################
#          GO Version Manager          #
########################################

GOENV_DIR="$OUT_DIR/goenv"
GO_VERSION="1.23.1"

if [ -d "$GOENV_DIR" ]; then
    unset GOENV_ROOT GOROOT
    rm -rf "$GOENV_DIR"
fi

# Clone goenv into our src-builds directory
git clone https://github.com/go-nv/goenv.git $GOENV_DIR

# Define env vars to point to the path where goenv repo is cloned
echo "" >> "$HOME/.zshrc"
echo "export GOENV_ROOT=\"$GOENV_DIR\"" >> "$HOME/.zshrc"
echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> "$HOME/.zshrc"
echo 'eval "$(goenv init -)"' >> "$HOME/.zshrc"
echo 'export PATH="$GOROOT/bin:$PATH"' >> "$HOME/.zshrc"
echo 'export PATH="$PATH:$GOPATH/bin"' >> "$HOME/.zshrc"

# exporting in current session so we can install and set global go version
export GOENV_ROOT="$GOENV_DIR"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# Install go
goenv install $GO_VERSION
goenv global $GO_VERSION


########################################
#               Rust up                #
########################################

rustup default stable
