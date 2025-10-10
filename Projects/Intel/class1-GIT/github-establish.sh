# 1) Create repo on github.com in the UI (empty repo, no README)
# 2) Then:

rm -rf git-ex-github && mkdir git-ex-github && cd git-ex-github
git init
echo "# Demo" > README.md
git add README.md
git commit -m "initial"
git branch -M main

# Replace with your repo URL
git remote add origin https://github.com/<your-user>/<your-repo>.git
git push -u origin main
