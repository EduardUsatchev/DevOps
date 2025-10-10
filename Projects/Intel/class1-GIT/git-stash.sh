# 🧱 1. Create a new repo from scratch
mkdir demo-project
cd demo-project
git init
# Initialized empty Git repository in ./demo-project/.git/

# 🪜 2. Create a file and make the first commit
echo "print('Hello World')" > app.py
git add app.py
git commit -m "initial commit"

# 🌿 3. Create a new feature branch and change the file
git checkout -b feature/login
echo "print('Feature login in progress')" >> app.py
git add app.py
git commit -m "working on login feature"

# 🐞 4. Switch to main branch and make a conflicting change
git checkout main
echo "print('Bug fix applied')" >> app.py
git add app.py
git commit -m "bug fix on main"

# 🧩 5. Go back to feature branch and make UNCOMMITTED changes
git checkout feature/login
echo "print('Still coding the login feature...')" >> app.py
# Notice: you did NOT commit this last change

# 🚨 6. Try switching to main — you'll get an error now!
git checkout main
# ❌ ERROR:
# error: Your local changes to the following files would be overwritten by checkout:
#   app.py
# Please commit your changes or stash them before you switch branches.

# 💡 7. Solution: use git stash to temporarily save uncommitted work
git stash
# Saved working directory and index state WIP on feature/login: <commit-id> working on login feature

# 🧾 Check your stash
git stash list
# stash@{0}: WIP on feature/login: <commit-id> working on login feature

# ✅ 8. Now you can switch to main safely
git checkout main

# (Simulate a quick fix or test)
echo "print('Main branch hotfix')" >> app.py
git add app.py
git commit -m "hotfix on main branch"

# 🔄 9. Go back to your feature branch
git checkout feature/login

# 🧰 10. Re-apply your stashed work
git stash pop
# Restores your uncommitted changes and removes them from the stash list

# 🔍 11. Verify your file contains all updates
cat app.py
# Output should include:
# print('Hello World')
# print('Bug fix applied')
# print('Feature login in progress')
# print('Still coding the login feature...')
# print('Main branch hotfix')

# 🎉 12. Continue coding, your changes are back safely!
