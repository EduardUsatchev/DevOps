# ==============================================================
# FULL EXAMPLE: git fetch + rebase vs merge demonstration
# ==============================================================

# 🧱 1️⃣ SETUP: Create a local repo and simulate a remote
rm -rf fetch-demo && mkdir fetch-demo && cd fetch-demo
git init
echo "base" > app.txt
git add app.txt
git commit -m "base commit"

# Simulate a remote (fake origin)
git remote add origin https://example.com/eduard/fetch-demo.git

# (We’ll mimic teammate commits locally instead of a real server)
# So let's make a second "bare remote" repository for realism:
cd ..
git clone --bare fetch-demo fetch-remote.git
cd fetch-demo
git remote set-url origin ../fetch-remote.git
git push -u origin main

# ==============================================================
# 🧩 2️⃣ PROBLEM: Teammate updates origin/main while you are behind
# ==============================================================

# Simulate teammate adding new commits to the remote
cd ../fetch-remote.git
git clone . ../teammate
cd ../teammate
git checkout main
echo "teammate line 1" >> app.txt
git add . && git commit -m "teammate: update line 1"
git push origin main
cd ../fetch-demo   # back to your local repo

# Your local main is now outdated
echo "my local change" >> local.txt
git add local.txt && git commit -m "local: work before fetch"

echo
echo "===================== BEFORE FETCH ====================="
git log --oneline --decorate --graph --all
echo "========================================================"

# ==============================================================
# ⚙️ 3️⃣ SOLUTION: Use git fetch to sync remote refs
# ==============================================================

git fetch origin

# Check what changed remotely
echo
echo "------- Changes available on remote (not merged yet) -------"
git log main..origin/main --oneline
echo "-----------------------------------------------------------"

# ==============================================================
# 🧭 4️⃣ OPTION A: Rebase your local work on top of the new remote
# ==============================================================

echo
echo "------- Rebase local work onto latest origin/main -------"
git rebase origin/main

# If there’s no conflict, Git replays your local commit after teammate’s.
# If conflicts occur, fix them, `git add <file>`, then `git rebase --continue`.

echo
echo "===================== AFTER REBASE ======================"
git log --oneline --decorate --graph --all
echo "========================================================"

# ==============================================================
# 🧭 5️⃣ OPTION B (alternative): merge instead of rebase
# ==============================================================

# Reset to simulate again
git reset --hard HEAD~1
git fetch origin
git merge origin/main -m "merge: sync with remote main"

echo
echo "===================== AFTER MERGE ======================="
git log --oneline --decorate --graph --all
echo "========================================================"

# ==============================================================
# 🧾 6️⃣ NOTES
# ==============================================================

# 🟢 git fetch → only updates origin refs (safe)
# 🟠 git rebase origin/main → replays local commits on top of remote (linear)
# 🔵 git merge origin/main → combines both histories with a merge commit
# 🧨 Never edit or force-push main if it’s shared with others.
