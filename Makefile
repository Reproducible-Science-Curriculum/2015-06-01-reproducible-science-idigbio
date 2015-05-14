all: intro.zip organization.zip

# Repo addresses
INTRO_REPO=git@github.com:Reproducible-Science-Curriculum/rr-intro.git
INTRO_TREEISH="master"
ORG1_REPO=git@github.com:Reproducible-Science-Curriculum/rr-organization1.git
ORG1_TREEISH="data-v0.2"

AUTOMATION_REPO=git@github.com:Reproducible-Science-Curriculum/rr-automation.git
PUBLISHING_REPO=git@github.com:Reproducible-Science-Curriculum/rr-publication.git

intro.zip:
	mkdir $(basename $@)
	rm -rf tempdir
	git clone $(INTRO_REPO) tempdir
	git archive --remote=tempdir $(INTRO_TREEISH) intro-01-template.Rmd | tar -x -C $(basename $@)
	git archive --remote=tempdir $(INTRO_TREEISH) intro-02-template.Rmd | tar -x -C $(basename $@)
	git archive --remote=tempdir $(INTRO_TREEISH) data | tar -x -C $(basename $@)
	rm -rf tempdir
	find $(basename $@) -name ".DS_Store" -delete
	zip -r $@ $(basename $@)
	rm -rf $(basename $@)

organization.zip:
	mkdir $(basename $@)
	rm -rf tempdir
	git clone $(ORG1_REPO) tempdir
	git archive --remote=tempdir $(ORG1_TREEISH) | tar -x -C $(basename $@)
	rm -rf tempdir
	find $(basename $@) -name ".DS_Store" -delete
	find $(basename $@) -name ".gitignore" -delete
	zip -r $@ $(basename $@)
	rm -rf $(basename $@)

clean:
	rm -rf *.zip
	rm -rf tempdir
	rm -rf intro
	rm -rf organization
	rm -rf automation
	rm -rf publication
