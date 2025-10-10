rm -rf git-ex-branches && mkdir git-ex-branches && cd git-ex-branches
git init
echo "base" > f.txt
git add . && git commit -m "base commit"

# Create two branches and add commits
git checkout -b feature-a
echo "A1" >> f.txt && git commit -am "feature-a: A1"
echo "A2" >> f.txt && git commit -am "feature-a: A2"

git checkout -b feature-b main
echo "B1" >> f.txt && git add . && git commit -m "feature-b: B1"

# List branches & show graph
git branch --all
git log --graph --oneline --all
