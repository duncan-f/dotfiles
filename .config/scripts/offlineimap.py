import subprocess

def mailpasswd():
    path = "/home/duncan/.gnupg/workoff.gpg"
    return subprocess.check_output(["gpg", "--quiet", "--batch", "-d", path]).strip()
