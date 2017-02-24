#!/bin/bash

set -e

function testPackage() {
  pushd test

  # Install node environment isolation tool nodeenv
  if command -v nodeenv 2>/dev/null 1>/dev/null; then
    echo "nodeenv already installed"
  else
    # Travis won't let you write to /usr/local/bin, but ~/.local/lib/python is in Travis' PATH
    pip install nodeenv || pip install --user nodeenv
  fi

  # Get the right version of Node and NPM for the test
  # If no NODEV / NPMV is set, just use whatever's available already
  NODEV=${NODEV:-"system"}
  NPMV=${NPMV:-"system"}

  # Destroy (if necessary), create and activate nodeenv
  rm -rf node_modules
  rm -rf nodeenv
  nodeenv --node=$NODEV --npm=$NPMV nodeenv
  . nodeenv/bin/activate

  echo "Node version in nodeenv: `node --version`"
  echo "NPM version in nodeenv: `npm --version`"

  # Install the config
  npm install --scripts-prepend-node-path

  # Make sure eslint can run with our config
  npm test --scripts-prepend-node-path

  rm -rf nodeenv

  popd
}

# Test both packages by default.
defaultpackages=(eslint-config-edx eslint-config-edx-es5)

# If the PACKAGE env var is set (as it will be on Travis), only test that package
packages=${PACKAGE:-${defaultpackages[*]}}

for package in $packages
do
  pushd packages/$package
  testPackage
  popd
done
