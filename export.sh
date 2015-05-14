#!/bin/bash

# Script to extract the learner materials from rr lessons and package together in one zip file

DEST=/Users/dcl9/Code/r/rr-handouts/
REPO_TEMP=repos

# Clear out repo temp
rm -rf $REPO_TEMP
mkdir -p intro
mkdir -p organizing
mkdir -p automating
mkdir -p publishing

TREEISH=master
INTRO_REPO=git@github.com:Reproducible-Science-Curriculum/rr-intro.git
ORG1_REPO=git@github.com:Reproducible-Science-Curriculum/rr-organization1.git
AUTOMATION_REPO=git@github.com:Reproducible-Science-Curriculum/rr-automation.git
PUBLISHING_REPO=git@github.com:Reproducible-Science-Curriculum/rr-publication.git

# intro

git clone $INTRO_REPO $REPO_TEMP
git archive --remote=$REPO_TEMP $TREEISH intro-01-template.Rmd | tar -x -C intro
git archive --remote=$REPO_TEMP $TREEISH intro-02-template.Rmd | tar -x -C intro
git archive --remote=$REPO_TEMP $TREEISH data | tar -x -C intro
find . -name ".DS_Store" -delete
zip -r intro.zip intro
mv intro.zip $DEST
rm -rf $REPO_TEMP intro

# org1

git clone $ORG1_REPO $REPO_TEMP
git archive --remote=$REPO_TEMP $TREEISH gapminderDataFiveYear.tsv | tar -x -C organizing
git archive --remote=$REPO_TEMP $TREEISH files | tar -x -C organizing --strip-components=1
find . -name ".DS_Store" -delete
zip -r organizing.zip organizing
rm -rf $REPO_TEMP organizing
mv organizing.zip $DEST

# automation
# publishing

