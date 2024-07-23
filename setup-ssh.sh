#!/bin/sh

# Ensure the script exits on any errors
set -e

# Start the ssh-agent
eval "$(ssh-agent -s)"

# Add the SSH private key to the ssh-agent
echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - <<< "$SSH_PASSPHRASE"

# Add GitHub.com keys to known hosts
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
