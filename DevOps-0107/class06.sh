git init 
git rm --cached 1.txt
git config user.name "Your Name"
git config user.email "your_email@example.com"

git remote add origin https://github.com/EduardUsatchev/class6-git.git
git branch -M main
git push -u origin main
touch 1.txt
git status
touch 2.txt
touch 2.tx
git status
git add 1.txt
git status
git add .
git status
git rm --cached 1.txt
git status
git commit -m "initial commit"
git add .
git commit -m "change image version"
git status
git log
ls -la
ls -la .git
git log
https://github.com/EduardUsatchev/class6-git
git checkout -b new-branch
git checkout main
git status
git pull
git log
git checkout -b new-branch
git status
git checkout main
ls -la
git checkout new-branch
ls -la
touch 5.txt
git add .
git commit -m "feature 5"
ls -la
git checkout main
ls -la
git checkout new-branch
ls -la
git push
git push --set-upstream origin new-branch
git checkout -b clone-branch
ll
echo 1 > 5.txt
git add .
git commit -m "fix bug"
git push
git push --set-upstream origin clone-branch
git log --graph --oneline --all
