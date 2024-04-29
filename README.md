# iphone_media_backup_script
This repository is a bash script that copies the photo's and videos from your iphone into your local debian based linux computer.

Requirements:
- iPhone
- Debian-based Linux Operating System (i.e. Ubuntu)

This script performs the following:
1. Asks you who's phone you are backing up to properly label the destination folder
2. Installs ifuse and its dependencies
3. Creates a folder to mount your iphone to
4. Asks you to connect your iphone to the computer using a USB cable (hit ENTER once you've connected it)
5. Mounts your iPhone to the mount folder it created
6. Uses rsync to copy your photo's and videos from your phone to the destination folder
7. When complete, it unmounts your phone for you (you can unplug your phone after this runs)
8. Zips the destination folder for you so you can transfer it elsewhere later
