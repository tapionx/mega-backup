mega-backup
===========

Backup your server easily on mega.co.nz with symmetric CAST5 encryption

Requirements
============

mega-backup is built on top of mega.py (https://github.com/richardasaurus/mega.py)

> pip install -r requirements.txt

You will also need:

- tar
- python
- gpg

Usage
=====

Choose the directories you want to backup and edit DIRS_TO_BACKUP in mega-backup.sh accordingly (default is: root etc home var)

Launch mega-backup.sh on your shell or in a crontab:

> ./mega-backup.sh <EMAIL> <PASSWORD> <CRYPT_PASSWORD>

Where:

- EMAIL & PASSWORD: your mega.co.nz credentials
- CRYPT_PASSWORD: the symmetric passphrase to encrypt the archive with gpg (CAST5 algorytm is used by default)
