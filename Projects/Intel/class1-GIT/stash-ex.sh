rm -rf git-ex-stash && mkdir git-ex-stash && cd git-ex-stash
git init
echo 'print("Hello World")' > app.py
git add app.py && git commit -m "initial"
git branch -M main

# Feature work
git checkout -b feature/login
echo 'print("Feature login in progress")' >> app.py
git add app.py && git commit -m "feature: login WIP"

# Conflicting change on main
git checkout main
echo 'print("Bug fix applied")' >> app.py
git add app.py && git commit -m "bug fix on main"

# Back to feature, make UNCOMMITTED edits
git checkout feature/login
echo 'print("Still coding the login feature...")' >> app.py

# Attempt to switch -> now it *will* error
git checkout main || echo "Expected checkout error due to conflicting uncommitted changes"

# Use stash to proceed
git stash
git checkout main
# (Do any quick hotfix if desired)
echo 'print("Main branch hotfix")' >> app.py
git commit -am "hotfix on main"

# Restore your work
git checkout feature/login
git stash pop
git status
