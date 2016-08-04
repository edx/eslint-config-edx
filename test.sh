#!/bin/bash

set -e

pushd test

# Install node environment isolation tool nodeenv
if command -v nodeenv 2>/dev/null 1>/dev/null; then
  echo "nodeenv already installed"
else
  # Travis won't let you write to /usr/local/bin, but ~/.local/lib/python is in Travis' PATH
  pip install nodeenv || pip install --user nodeenv
fi

# Destroy (if necessary), create and activate nodeenv
rm -rf node_modules
rm -rf nodeenv
nodeenv --node=system nodeenv
. nodeenv/bin/activate

# Get the right version of NPM active in the nodeenv
# If no NPMV is set, we're testing locally - just use whatever's available already
NPMV=${NPMV:-`npm --version`}
npm install -g npm@$NPMV

deactivate_node
. nodeenv/bin/activate

echo "Node version in nodeenv: `node --version`"
echo "NPM version in nodeenv: `npm --version`"

# Install eslint-config-edx
npm install

# Make sure eslint can run with our config
npm test

rm -rf nodeenv

popd test
