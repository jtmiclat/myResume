#!/bin/sh

# Slightly edited version of latexdockercmd from https://github.com/blang/latex-docker
IMAGE=blang/latex:ctanfull
exec docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD/Resume":/data "$IMAGE" "$@"
