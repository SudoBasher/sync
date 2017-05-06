#!/bin/bash

## script settings
case $WorkstationType in
  Linux )
    WorkstationHomeDirectory=$LinuxWorkstationHomeDirectory
    RsyncOptions=$LinuxRsyncOptions
    ;;
  Mac )
    WorkstationHomeDirectory=$MacWorkstationHomeDirectory
    RsyncOptions=$MacRsyncOptions
    ;;
  * )
    echo
    echo "/ Error! Invalid workstation type."
    echo
    exit
    ;;
esac
ScriptTitle=$WorkstationType" - Upload to NAS"
ScriptFilename="upload_nas"
StartingTimestamp=$(date +%Y-%m-%d@%H:%M:%S:%N)

## title
echo
echo "/ Starting Job: $ScriptTitle"
echo "// Starting job timestamp: $StartingTimestamp"
echo

## copy workstation storage to workstation configs

  echo "// Syncing workstation config files..."
  echo

  ## hosts file
  echo rsync \
    $RsyncOptions \
    $ExtraRsyncOptions \
    --log-file $WorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    '"'$LocalSystemHostsFile'"' \
    '"'$WorkstationHomeDirectory$LocalStorageUploadDirectory$LocalStorageHostsFile'"' > ./runfile.sh
  ExecuteRunfile
  echo

  ## ssh config file 
  echo rsync \
    $RsyncOptions \
    $ExtraRsyncOptions \
    --log-file $WorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    '"'$WorkstationHomeDirectory$LocalSystemSSHConfigFile'"' \
    '"'$WorkstationHomeDirectory$LocalStorageUploadDirectory$LocalStorageSSHConfigFile'"' > ./runfile.sh
  ExecuteRunfile
  echo

## push workstation storage to nas storage

  ## storage
  echo "// Uploading general files..."
  echo
  echo rsync \
    $RsyncOptions \
    $ExtraRsyncOptions \
    --log-file $WorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    --exclude-from='"'$WorkstationHomeDirectory$LocalExcludeFileDirectory$ExcludeFileName'"' \
    $WorkstationHomeDirectory$LocalStorageUploadDirectory \
    -e '"ssh"' $NASServer:"$NASStorageDirectory" > ./runfile.sh
  ExecuteRunfile
  echo
  echo rsync \
    $RsyncOptions \
    --log-file $WorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    --exclude-from='"'$WorkstationHomeDirectory$LocalExcludeFileDirectory$ExcludeFileName'"' \
    $WorkstationHomeDirectory$LocalDevelopmentUploadDirectory \
    -e '"ssh"' $NASServer:"$NASDevelopmentDirectory" > ./runfile.sh
  ExecuteRunfile
  echo

  ## encrypted volumes
  echo "// Uploading secure files..."
  echo
  echo rsync \
    $RsyncOptions \
    $ExtraRsyncOptions \
    --log-file $WorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    $WorkstationHomeDirectory$LocalStorageUploadDirectory$SecureDirectory \
    -e '"ssh"' $NASServer:"$NASStorageDirectory$SecureDirectory" > ./runfile.sh
  ExecuteRunfile
  echo

EndingTimestamp=$(date +%Y-%m-%d@%H:%M:%S:%N)

## ending message
echo
echo "// Ending job timestamp: $EndingTimestamp"
echo "// Sync job completed."
echo

exit
