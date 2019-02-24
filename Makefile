LATEX_IMAGE ?=blang/latex:ctanfull
DROPBOX_UPLOADER_IMAGE=jtmiclat/dropbox-uploader
HOST ?= $(shell pwd)
DROPBOX_TOKEN ?= $(shell echo $${DROPBOX_TOKEN})
MOUNT_USER ?= --user="$(shell id -u):$(shell id -g)"


build-pdf:
	docker run --rm -i  --net=none -v "$(HOST)/Resume":/data "$(LATEX_IMAGE)" pdflatex Resume.tex

upload-pdf:
	docker run --rm -v "$(HOST):/mount" "$(DROPBOX_UPLOADER_IMAGE)" --token=$(DROPBOX_TOKEN) --source=Resume/Resume.pdf --target=/career/Resume.pdf
