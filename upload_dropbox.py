import os
import dropbox

import click
from dropbox.files import WriteMode

TOKEN = os.getenv("DROPBOX_TOKEN")

@click.command()
@click.option("--source", help="Source file")
@click.option("--target", help="Target path to upload to dropbox")
def upload(source, target):
    """Simple uploader"""
    dbx = dropbox.Dropbox(TOKEN)
    with open(source, "rb") as f:
        dbx.files_upload(f.read(), target, mode=WriteMode("overwrite"))


if __name__ == "__main__":
    upload()
