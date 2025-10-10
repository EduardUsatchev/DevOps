rm -rf git-ex-revert && mkdir git-ex-revert && cd git-ex-revert
git init
echo "1" > a.txt && git add . && git commit -m "init"
echo "2" >> a.txt && git commit -am "2nd"
echo "3" >> a.txt && git commit -am "3rd"
echo "4" >> a.txt && git commit -am "4th"

git log --graph --pretty=oneline --abbrev-commit

# Copy the short SHA of the commit you want to undo (e.g., "3rd") and revert it:
# Example (replace <sha-of-3rd>):
git revert <sha-of-3rd> --no-edit
git log --graph --pretty=oneline --abbrev-commit
