#!/bin/sh

# Ensure the script exits on any errors
set -e

# Start the ssh-agent
eval "$(ssh-agent -s)"

# Write the private key to a temporary file
echo "$SSH_PRIVATE_KEY" > /tmp/id_rsa
chmod 600 /tmp/id_rsa

# Write the passphrase to a temporary file
echo "$SSH_PASSPHRASE" > /tmp/passphrase

# Add the SSH private key to the ssh-agent
ssh-add /tmp/id_rsa < /tmp/passphrase

# Add GitHub.com keys to known hosts
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Clean up temporary files
rm /tmp/id_rsa
rm /tmp/passphrase
