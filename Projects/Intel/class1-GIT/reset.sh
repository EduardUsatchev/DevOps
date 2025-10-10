rm -rf git-ex-reset && mkdir git-ex-reset && cd git-ex-reset
git init
echo "1" > a.txt && git add . && git commit -m "init"
echo "2" >> a.txt && git commit -am "2nd"
echo "3" >> a.txt && git commit -am "3rd"
echo "4" >> a.txt && git commit -am "4th"

git log --oneline

# Pick the SHA you want to reset *to* (e.g., the "2nd" commit)
# HARD = resets working tree + index to that commit
git reset --hard <sha-of-2nd>

git log --oneline
cat a.txt
