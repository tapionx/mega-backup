from mega import Mega
import sys
import os

"""
This tool uploads a file to MEGA.CO.NZ
"""

if (len(sys.argv) != 4):
    print "usage: mega-upload.py <email> <password> <filepath>"
    sys.exit()

EMAIL = sys.argv[1]
PASSWORD = sys.argv[2]
FILEPATH = sys.argv[3]
FILENAME = os.path.basename(FILEPATH)

mega = Mega({'verbose': False}) 

# login
print 'login as '+EMAIL+'...'
m = mega.login(EMAIL, PASSWORD)

print 'uploading file to Mega...'
# upload file
m.upload(FILEPATH, dest_filename=FILENAME)
print 'upload OK'

