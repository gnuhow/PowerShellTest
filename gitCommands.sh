# clone the branch
    git clone https://github.com/gnuhow/PowerShellTest.git


# make a new branch and push it
    git branch -a      # verify branch doesn't exist first

    git checkout -b mybranch
    git push -u origin mybranch


# add files to the commit, make the commit and push changes
    git add .
    git commit -m "Initial commit"
    git push


# update a feature branch from main
    git add .
    git commit -m "my commit"
    git push

    git checkout main
    git pull
    git merge feature-branch
    git push


# compare two branches before merging
    git checkout main
    git pull
    git checkout feature-branch
    git diff main


# do a git merge into main from  feature-branch
    git add .
    git commit -m "my new feature"
    git push

    git checkout main
    git pull
    git diff feature-branch
    git merge feature-branch

    git push origin --delete feature    # cleanup
    git branch --delete feature             


# git rebase with a remote origin isn't a very clean process
    git add .
    git commit -m "my new feature"
    git push

    git rebase origin/main

    # handle merge conflicts
    git add .
    git commit -m "rebase from origin/main"
    git rebase --continue

    # force push because my feature branch will show it is behind the origin feature branch
    git push --force origin feature-branch


