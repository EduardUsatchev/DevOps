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


#################
Git Exercise:
git init
 3745  touch 1.txt
 3746  git status
 3747  git add .
 3748  git commit -m "fix bu"
 3749  git log
 3750  git log --graph --oneline --all
 3751  echo 1 > 1.txt
 3752  git add .
 3753  git commit -m "second"
 3754  git log
 3755  git log --graph --oneline --all
 3756  git checkout -b purple
 3757  ls -la
 3758  echo 11 > 1.txt
 3759  git add .
 3760  git commit -m "third"
 3761  echo 111 > 1.txt
 3762  git add .
 3763  git commit -m "four"
 3764  git checkout main
 3765  git log --graph --oneline --all
 3766  echo 111222 > 1.txt
 3767  git add .
 3768  git commit -m "fifth"
 3769  git log --graph --oneline --all
 3770  echo 11fghjg1222 > 1.txt
 3771  git add .
 3772  git commit -m "sixth"
 3773  git log --graph --oneline --all
 3774  git checkout -b green
 3775  echo 1fghfgh1fghjg1222 > 1.txt
 3776  git add .
 3777  git commit -m "seven"
 3778  echo 1fhfghfghfgh1fghjg1222 > 1.txt
 3779  git add .
 3780  git commit -m "eight"
 3781  git checkout main
 3782  echo 1fhfghfghfgh1fghjg122dfgfdg2 > 1.txt
 3783  git add .
 3784  git commit -m "nine"
 3785  git log --graph --oneline --all
 3786  git log --graph --all
 3787  git log --graph --oneline --all
 #########################################

 Git Conflict:
 merge-conflice:
 #######
  mkdir merge-issue
cd merge-issue
git init
echo “hello” > a.txt
git add .
git commit -am "init commit"
git branch new-branch


git checkout new-branch
echo “world” > a.txt
Git add .
git commit -am "I want to conflict"
git checkout master
echo “newer change in master” > a.txt
Git add .
Git commit -am “34rd commit” 
git merge new-branch
Cat a.txt

#############################
Additional:
Full git explanation and introduction - https://wyag.thb.lt
Oh shit git - https://ohshitgit.com/
Commit messages guide - https://github.com/RomuloOliveira/commit-messages-guide
https://git-rebase.io
More productive git - https://increment.com/open-source/more-productive-git/


