import os
import subprocess

home = os.path.expanduser("~")

def mailpasswd(account):
    path = "%s/.config/mutt/creds/%s.gpg" % (home, account)

    try:
        return subprocess.check_output(["gpg", "--quiet", "--batch", "-d", path]).strip()
    except subprocess.CalledProcessError:
        return ""
