#!/bin/bash

## script settings
ScriptTitle="Linux - Download from Cloud"
ScriptFilename="linux_download_cloud"
StartingTimestamp=$(date +%Y-%m-%d@%H:%M:%S:%N)

echo
echo "Starting Job: $ScriptTitle"
echo "Starting job timestamp: $StartingTimestamp"
echo

## pull cloud storage to workstation storage

  ## storage
  echo "Downloading general files..."
  echo
  echo rsync \
    $LinuxRsyncOptions \
    $ExtraRsyncOptions \
    --log-file $LinuxWorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    --exclude-from='"'$LinuxWorkstationHomeDirectory$LocalExcludeFileDirectory$ExcludeFileName'"'\
    -e '"ssh"' $RemoteServer:"$RemoteStorageDirectory" \
    $LinuxWorkstationHomeDirectory$LocalStorageDownloadDirectory > ./runfile.sh
  ExecuteRunfile
  echo

  ## encrypted volumes
  echo "Downloading secure files..."
  echo
  echo rsync \
    $LinuxRsyncOptions \
    $ExtraRsyncOptions \
    --log-file $LinuxWorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    -e '"ssh"' $RemoteServer:"$RemoteStorageDirectory$SecureDirectory" \
    $LinuxWorkstationHomeDirectory$LocalStorageDownloadDirectory$SecureDirectory > ./runfile.sh
  ExecuteRunfile
  echo

## copy workstation storage to workstation configs

  echo "Syncing workstation configurations..."
  echo

  ## hosts file
  echo rsync \
    $LinuxRsyncOptions \
    $ExtraRsyncOptions \
    --log-file $LinuxWorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    '"'$LinuxWorkstationHomeDirectory$LocalStorageDownloadDirectory$LocalStorageHostsFile'"' \
    '"'$LocalSystemHostsFile'.sync"' > ./runfile.sh
  ExecuteRunfile
  echo

  ## ssh config file 
  echo rsync \
    $LinuxRsyncOptions \
    $ExtraRsyncOptions \
    --log-file $LinuxWorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    '"'$LinuxWorkstationHomeDirectory$LocalStorageDownloadDirectory$LocalStorageSSHConfigFile'"' \
    '"'$LocalSystemSSHConfigFile'.sync"' > ./runfile.sh
  ExecuteRunfile
  echo

EndingTimestamp=$(date +%Y-%m-%d@%H:%M:%S:%N)

## ending message
echo
echo "Ending job timestamp: $EndingTimestamp"
echo Sync job completed.
echo

exit