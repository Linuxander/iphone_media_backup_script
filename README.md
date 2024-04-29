This repository is a bash script that copies the photo's and videos from your iPhone into your local debian based linux computer.

# Requirements:
- iPhone
- Debian-based Linux Operating System (i.e. Ubuntu)

# Instructions:
1. Clone this repository to your computer
2. cd into this cloned repostiory
3. run the command: `./start_iphone_media_backup.sh`
4. Enter phone owner's name when prompted
5. When you are prompted to connect your iPhone to your computer, press ENTER after you confirmed you connected it

# What the script is doing:
1. Asks you who's phone you are backing up to properly label the destination folder
2. Installs ifuse and its dependencies
3. Creates a folder to mount your iphone to
4. Asks you to connect your iphone to the computer using a USB cable (hit ENTER once you've connected it)
5. Mounts your iPhone to the mount folder it created
6. Uses `rsync` to copy your photo's and videos from your phone to the destination folder
7. When complete, it unmounts your phone for you (you can unplug your phone after this runs)
8. Zips the destination folder for you so you can transfer it elsewhere later
