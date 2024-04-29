#!/bin/bash

TODAYS_DATE=$(date +%Y-%m-%d_%H-%M-%S)
DIR=$(dirname "${BASH_SOURCE[0]}")
MP_FOLDER=iphone_mount_point
MP_PATH=$DIR/$MP_FOLDER
DEST_FOLDER="${TODAYS_DATE}_local_copy"
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

echo "Mounting iphone to ${MP_PATH}"
ifuse $MP_PATH

sleep 3

echo "Creating local destination folder for copied media..."
mkdir $DEST_PATH

echo "Copying all media to ${DEST_PATH}"
rsync -ah --progress $MP_PATH/DCIM/. $DEST_PATH

echo "Copy complete."

sleep 3

echo "You may eject the connected iphone using your file explorer window."
