rm -rf git-ex-cherry && mkdir git-ex-cherry && cd git-ex-cherry
git init
echo "base" > app.txt
git add . && git commit -m "base on main"
git branch -M main

# Make a feature branch and a few commits
git checkout -b feature1
echo "fix A" >> app.txt && git commit -am "feature1: fix A"
echo "feature1 extra" >> app.txt && git commit -am "feature1: extra"

# Note the SHA of "feature1: fix A"
git log --oneline

# Switch to main and cherry-pick just the fix A
git checkout main
git cherry-pick <sha-of-fix-A>

# If conflicts happen:
#   resolve files, then:
#   git add <files>
#   git cherry-pick --continue
