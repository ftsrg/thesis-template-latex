#!/usr/bin/env bash
set -e # exit with nonzero exit code if anything fails

# create temporary directory to work in
GITDIR=$(mktemp -d); trap "{rm -rf $GITDIR}" EXIT

# run our compile script, discussed above
cp $OUTDIR/*.pdf $GITDIR

# go to the out directory and create a *new* Git repo
cd $GIDIR
git init

# inside this git repo we'll pretend to be a new user
git config user.name $GIT_USER
git config user.email $GIT_EMAIL

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy to GitHub Pages"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --force --quiet "https://${GH_TOKEN}@github.com/${GH_REPO}.git" $BRANCH:$TGT_BRANCH > /dev/null 2>&1
