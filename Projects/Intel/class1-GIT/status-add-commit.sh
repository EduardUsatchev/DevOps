rm -rf git-ex-status && mkdir git-ex-status && cd git-ex-status
git init

echo 'print("hello")' > app.py
git status

# Stage everything
git add .
git status

# First commit
git commit -m "init commit"
git status

# Make a change and commit with -a (stage tracked files automatically)
echo 'print("v2")' >> app.py
git commit -a -m "append v2"
git status
