# Create a clean playground
rm -rf git-ex-setup && mkdir git-ex-setup && cd git-ex-setup

# Initialize a repo
git init

# Configure identity (global = for all repos on this machine)
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# Inspect config at different scopes
git config --list
git config --global --list
git config --local --list
git config --system --list    # may require admin
git config user.name
git config user.email
git config --show-origin --list
