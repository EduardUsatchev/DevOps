rm -rf git-ex-detached && mkdir git-ex-detached && cd git-ex-detached
git init
echo "1" > a.txt && git add . && git commit -m "init"
echo "2" >> a.txt && git commit -am "2nd"
echo "3" >> a.txt && git commit -am "3rd"
echo "4" >> a.txt && git commit -am "4th"

git log --oneline

# Checkout by commit SHA -> detached HEAD
git checkout <sha-of-2nd>
git status

# Go back to the main line (main or master)
git checkout -  # or: git checkout main
