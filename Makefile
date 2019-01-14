LATEX_IMAGE ?=blang/latex:ctanfull
PIPENV_IMAGE=kennethreitz/pipenv
HOST ?= $(shell pwd)
DROPBOX_TOKEN ?= $(shell echo $${DROPBOX_TOKEN})
MOUNT_USER ?= --user="$(shell id -u):$(shell id -g)"


build-pdf:
	docker run --rm -i  --net=none -v "$(HOST)/Resume":/data "$(LATEST_IMAGE)" pdflatex Resume.tex

upload-dropbox:
	docker run --rm  -e DROPBOX_TOKEN=$(DROPBOX_TOKEN) -v "$(HOST):/app" "$(PIPENV_IMAGE)" sh -c "pipenv install && pipenv run python upload_dropbox.py --source=Resume/Resume.pdf --target=/career/Resume.pdf"
