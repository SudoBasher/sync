#!/bin/bash

## script settings
ScriptTitle="Linux - Upload to Cloud"
ScriptFilename="linux_upload_cloud"
StartingTimestamp=$(date +%Y-%m-%d@%H:%M:%S:%N)

echo
echo "Starting Job: $ScriptTitle"
echo "Starting job timestamp: $StartingTimestamp"
echo

## copy workstation storage to workstation configs

  echo "Syncing workstation config files..."
  echo

  ## hosts file
  echo rsync \
    $LinuxRsyncOptions \
    $ExtraRsyncOptions \
    --log-file $LinuxWorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    '"'$LocalSystemHostsFile'"' \
    '"'$LinuxWorkstationHomeDirectory$LocalStorageUploadDirectory$LocalStorageHostsFile'"' > ./runfile.sh
  ExecuteRunfile
  echo

  ## ssh config file 
  echo rsync \
    $LinuxRsyncOptions \
    $ExtraRsyncOptions \
    --log-file $LinuxWorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    '"'$LocalSystemSSHConfigFile'"' \
    '"'$LinuxWorkstationHomeDirectory$LocalStorageUploadDirectory$LocalStorageSSHConfigFile'"' > ./runfile.sh
  ExecuteRunfile
  echo

## push workstation storage to cloud storage

  ## storage
  echo "Uploading general files..."
  echo
  echo rsync \
    $LinuxRsyncOptions \
    $ExtraRsyncOptions \
    --log-file $LinuxWorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    --exclude-from='"'$LinuxWorkstationHomeDirectory$LocalExcludeFileDirectory$ExcludeFileName'"' \
    $LinuxWorkstationHomeDirectory$LocalStorageUploadDirectory \
    -e '"ssh"' $RemoteServer:"$RemoteStorageDirectory" > ./runfile.sh
  ExecuteRunfile
  echo

  ## encrypted volumes
  echo "Uploading secure files..."
  echo
  echo rsync \
    $LinuxRsyncOptions \
    $ExtraRsyncOptions \
    --log-file $LinuxWorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    $LinuxWorkstationHomeDirectory$LocalStorageUploadDirectory$SecureDirectory \
    -e '"ssh"' $RemoteServer:"$RemoteStorageDirectory$SecureDirectory" > ./runfile.sh
  ExecuteRunfile
  echo

EndingTimestamp=$(date +%Y-%m-%d@%H:%M:%S:%N)

## ending message
echo
echo "Ending job timestamp: $EndingTimestamp"
echo Sync job completed.
echo

exit