#!/bin/bash

echo "Who's phone are you backing up?"
read PHONE_OWNER

TODAYS_DATE=$(date +%Y-%m-%d)
DIR=$(dirname "${BASH_SOURCE[0]}")
MP_FOLDER=iphone_mount_point
MP_PATH=$DIR/$MP_FOLDER
DEST_FOLDER="${TODAYS_DATE}_${PHONE_OWNER}_iPhone_Backup"
DEST_PATH=$DIR/$DEST_FOLDER


echo "Installing ifuse and libimobiledevice-utils..." 
sudo apt-get install libimobiledevice-utils ifuse -y

sleep 3

echo "Creating a folder to mount iPhone to..."
mkdir $MP_FOLDER

sleep 3

echo "Connect your iphone to this computer."
sleep 1
echo "When you verify it is connected to your computer, press enter to allow this script to continue."
read waitforusertohitenter

echo "Mounting iPhone to ${MP_PATH}"
ifuse $MP_PATH

sleep 3

echo "Creating local destination folder for copied media..."
mkdir $DEST_PATH

echo "Copying all media to ${DEST_PATH}"
rsync -ah --progress $MP_PATH/DCIM/. $DEST_PATH

echo "Copy complete."

sleep 3

echo "Unounting iPhone from ${MP_PATH}"
fusermount -u ${MP_PATH}
echo "iPhone unmounted, you may disconnect your phone..."

sleep 3

echo "Zipping up local media folder..."
zip -r "${DEST_FOLDER}.zip" $DEST_PATH

sleep 3

echo "Script complete..."

