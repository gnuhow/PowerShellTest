# clone the branch
git clone https://github.com/gnuhow/PowerShellTest.git

# make a new branch and push it
git checkout -b mybranch
git push -u origin mybranch

# add files to the commit, make the commit and push changes
git add .
git commit -m "Initial commit"
git push

# rebase a feature-branch from main
git add .
git commit -m "my commit"
git push

git checkout main
git pull
git checkout feature-branch
git push

# do a git merge into main from  feature-branch
git add .
git commit -m "my new feature"
git push

git checkout main
git pull
git diff feature-branch
git merge feature branch
