#!/bin/bash

# Script to extract the learner materials from rr lessons and package together in one zip file

DEST=repsci-data
REPO_TEMP=repos

# Clear out repo temp
rm -rf $REPO_TEMP
rm -r $DEST
mkdir -p $DEST/intro
mkdir -p $DEST/organizing
mkdir -p $DEST/automating
mkdir -p $DEST/publishing

TREEISH=master
INTRO=git@github.com:Reproducible-Science-Curriculum/rr-intro.git
ORG1=git@github.com:Reproducible-Science-Curriculum/rr-organization1.git
AUTOMATION=git@github.com:Reproducible-Science-Curriculum/rr-automation.git
PUBLISHING=git@github.com:Reproducible-Science-Curriculum/rr-publication.git

# what about presentations/slides?

# intro

git clone $INTRO $REPO_TEMP
git archive --remote=$REPO_TEMP $TREEISH intro-01-template.Rmd | tar -x -C $DEST/intro
git archive --remote=$REPO_TEMP $TREEISH intro-02-template.Rmd | tar -x -C $DEST/intro
git archive --remote=$REPO_TEMP $TREEISH data | tar -x -C $DEST/intro
rm -rf $REPO_TEMP

# org1

git clone $ORG1 $REPO_TEMP
git archive --remote=$REPO_TEMP $TREEISH gapminderDataFiveYear.tsv | tar -x -C $DEST/organizing
git archive --remote=$REPO_TEMP $TREEISH files | tar -x -C $DEST/organizing --strip-components=1

rm -rf $REPO_TEMP

# automation
# publishing

# Now data is in DEST
zip -r $DEST.zip $DEST
