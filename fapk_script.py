# brief     fetch tool to extract and fetch the APK files from custom artifact list builds
# author    Joshua Gomez

import subprocess # for executing commands
import pathlib # for searching files
import os
import sys
from shutil import copyfile # for copying files
from shutil import SameFileError # for copying files
import shutil
import time

# get tar file from agument
tarFile = sys.argv[1]

# get file name from 
tarFileName = tarFile.split('.')[0]

# define command syntax for extracting tar file
cmd = ['tar', 'xzvf', tarFile]
# execute extract command. subprocess.call will execute command and wait till its complete before moving down
subprocess.call(cmd, stderr=subprocess.STDOUT, stdout=subprocess.PIPE)

# get the buildNumber to create new folder for the files
tarFileSplit = tarFile.split('-')
buildNumber = [s for s in tarFileSplit if s.isdigit()][0]

# create folder
try:
    os.mkdir(buildNumber)
except OSError:
    # folder exists
    print

# search files
fileDir = r"."
fileExt = r"**\*.apk"
apkList = list(pathlib.Path(fileDir).glob(fileExt))

# iterate list
for apk in apkList:
    src = apk
    # split patch to get fileName
    path, fileName = os.path.split(apk)
    # create 
    dest = os.path.join(buildNumber, fileName)
    # copy apk to new folder
    try:
        copyfile(src, dest)
    except SameFileError:
        # file already exists
        print
    else:
        # copied succesfully
        print(dest)

# delete initial extracted folder
shutil.rmtree(tarFileName) 
        