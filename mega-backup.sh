#!/bin/bash
 
DIRS_TO_BACKUP='root etc home var'

if [ $# -ne 3 ]
  then
    echo "usage: mega-backup.sh <EMAIL> <PASSWORD> <CRYPT_PASSWORD>"
    exit
fi

MEGA_USERNAME=$1
MEGA_PASSWORD=$2
CRYPT_PASSWORD=$3 

HOSTNAME=`hostname`
DATE=`date +%d-%m-%y`
FILENAME='/tmp/'$HOSTNAME'_'$DATE'_backup.tar.gz.gpg'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo '---- BEGIN TAR: '`date`

cd /

/bin/tar -zcp root etc home var --warning=no-file-ignored | /usr/bin/gpg --symmetric --passphrase $CRYPT_PASSWORD --output $FILENAME

echo '---- BEGIN UPLOAD: '`date`

cd $DIR

/usr/bin/python mega-upload.py $MEGA_USERNAME $MEGA_PASSWORD $FILENAME

echo '---- FINE UPLOAD: '`date`

rm $FILENAME

# use this command to decrypt the file
# gpg --output backup.tar.gz --decrypt backup.tar.gz.gpg
