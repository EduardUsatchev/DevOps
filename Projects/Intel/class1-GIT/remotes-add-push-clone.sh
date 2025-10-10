# Start fresh
rm -rf git-ex-remote && mkdir git-ex-remote && cd git-ex-remote
git init
echo hi > a.txt
git add a.txt && git commit -m "first"

# Add a remote (replace URL with your repo URL)
git remote add origin https://github.com/<your-user>/<your-repo>.git

# Push current branch (main) and set upstream
git branch -M main
git push -u origin main

# (Optional) Demonstrate cloning into a new folder
cd ..
git clone https://github.com/<your-user>/<your-repo>.git cloned-repo
