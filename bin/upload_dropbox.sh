IMAGE=kennethreitz/pipenv
exec docker run --rm  -it -e DROPBOX_TOKEN=$DROPBOX_TOKEN -v "$PWD:/app" "$IMAGE" sh -c "pipenv install && pipenv run python upload_dropbox.py --source=Resume/Resume.pdf --target=/Resume.pdf"

