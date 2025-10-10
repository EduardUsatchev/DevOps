rm -rf git-ex-conflict && mkdir git-ex-conflict && cd git-ex-conflict
git init
echo "hello" > file.txt
git add . && git commit -m "base hello on main"
git branch -M main

# Change on main
echo "MAIN change" >> file.txt
git commit -am "edit on main"

# Create branch and make conflicting change
git checkout -b new-branch
# Overwrite the line to cause conflict later
echo "world" > file.txt
git commit -am "replace with world on new-branch"

# Merge new-branch back to main (expect conflict)
git checkout main
git merge new-branch || true   # will stop with conflict

# Inspect conflict markers in file.txt, then resolve manually:
# Example resolution:
echo -e "hello\nMAIN change\nworld (merged)" > file.txt
git add file.txt
git commit -m "resolve conflict between main and new-branch"
