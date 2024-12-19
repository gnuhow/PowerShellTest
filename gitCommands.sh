# status
    git status
    git history

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


# compare two branches before merging
    git checkout main
    git pull
    git checkout feature-branch
    git diff main


# merge main into the feature branch first, handle merge conflicts.
    git add .
    git commit -m "my commit"
    git push

    git checkout main
    git pull
    git merge feature-branch
    git push


# do a git merge into main from  feature-branch
    git add .
    git commit -m "my new feature"
    git push

    git checkout main
    git pull
    git diff feature-branch
    git merge feature-branch


# delete feature branch after merge
    git push origin --delete feature
    git branch --delete feature             


# tag a branch to mark it as a release
    git tag                                         # list tags
    git tag -l v2*                                  # list tags starting with v2
    git tag -a v1.0 -m "Release candidate 1.0"      # annotated tags, have more info.
    git push origin v1.0          


# delete a tag
git tag -d v1.0
git push origin :refs/tags/v1.0


# throw away all working files, and reset back to the latest commit.
git reset --hard


# revert back the changes made by a commit
git revert <commit id>


# restore a file back to a certain commit id
git restore --source=<commit id> .              # restore all files in current dir
git restore --source=<commit id> myfile.txt     # restore one file


# git rebase with a remote origin. It's alternative to merging main into dev
# This isn't a very clean process.
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


