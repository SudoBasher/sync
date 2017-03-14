#!/bin/bash

###########################################################
## Sync
## https://github.com/sudobasher/sync
###########################################################

## import global settings
. ./config.sh

## import functions
. ./functions.sh

## starting message and option dialogue
title="**Sync**"
echo
echo "$title"
echo

## delete prompt
read -p "Enabled deleting of target folder/files? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]];
then
  ## sync settings
  EnableDeleteDelayOption="true"
  ExtraRsyncOptions="--delete-delay"
  echo "Deleting enabled!"
else
  echo "Deleting disabled."
fi
echo

## script prompt
options=("Linux - Download from Cloud"
         "Linux - Upload to Cloud"
         "Linux - Upload to NAS"
         "Linux - Upload Everywhere")
prompt="Pick an option:"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 
    case "$REPLY" in

      1 ) . ./linux_download_cloud.sh;;
      2 ) . ./linux_upload_cloud.sh;;
      3 ) ;;
      4 ) ;;

      $(( ${#options[@]}+1 )) ) echo "Quitting..."; break;;
      *) echo "Invalid option. Try another one.";continue;;
    esac
done

exit