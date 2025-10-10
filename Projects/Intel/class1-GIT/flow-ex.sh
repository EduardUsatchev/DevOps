rm -rf git-ex-flow && mkdir git-ex-flow && cd git-ex-flow
git init
echo "base" > app.txt
git add . && git commit -m "base on main"
git branch -M main

# Create develop from main
git checkout -b develop
echo "develop change 1" >> app.txt
git commit -am "develop: change 1"

# Merge develop -> main
git checkout main
git merge develop -m "merge develop into main"

# Feature from develop
git checkout develop
git checkout -b feature1
echo "feature1 work" >> app.txt
git commit -am "feature1: work"

# Merge feature1 -> develop, then develop -> main
git checkout develop
git merge feature1 -m "merge feature1 into develop"
git checkout main
git merge develop -m "merge develop into main"

# Hotfix from main
git checkout -b hotfix1 main
echo "critical hotfix" >> app.txt
git commit -am "hotfix1: critical fix"

# Merge hotfix -> main, then backport main -> develop
git checkout main
git merge hotfix1 -m "merge hotfix1 into main"
git checkout develop
git merge main -m "sync develop with main (hotfix backport)"

# Visualize
git log --graph --oneline --all
