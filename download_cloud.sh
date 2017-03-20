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
ScriptTitle=$WorkstationType" - Download from Cloud"
ScriptFilename="download_cloud"
StartingTimestamp=$(date +%Y-%m-%d@%H:%M:%S:%N)

## title
echo
echo "/ Starting Job: $ScriptTitle"
echo "// Starting job timestamp: $StartingTimestamp"
echo

## pull cloud storage to workstation storage

  ## storage
  echo "// Downloading general files..."
  echo
  echo rsync \
    $RsyncOptions \
    $ExtraRsyncOptions \
    --log-file $WorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    --exclude-from='"'$WorkstationHomeDirectory$LocalExcludeFileDirectory$ExcludeFileName'"'\
    -e '"ssh"' $RemoteServer:"$RemoteStorageDirectory" \
    $WorkstationHomeDirectory$LocalStorageDownloadDirectory
  #ExecuteRunfile
  echo

  ## encrypted volumes
  echo "// Downloading secure files..."
  echo
  echo rsync \
    $RsyncOptions \
    $ExtraRsyncOptions \
    --log-file $WorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    -e '"ssh"' $RemoteServer:"$RemoteStorageDirectory$SecureDirectory" \
    $WorkstationHomeDirectory$LocalStorageDownloadDirectory$SecureDirectory
  #ExecuteRunfile
  echo

## copy workstation storage to workstation configs

  echo "// Syncing workstation configurations..."
  echo

  ## hosts file
  echo rsync \
    $RsyncOptions \
    $ExtraRsyncOptions \
    --log-file $WorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    '"'$WorkstationHomeDirectory$LocalStorageDownloadDirectory$LocalStorageHostsFile'"' \
    '"'$LocalSystemHostsFile'.sync"'
  #ExecuteRunfile
  echo

  ## ssh config file 
  echo rsync \
    $RsyncOptions \
    $ExtraRsyncOptions \
    --log-file $WorkstationHomeDirectory$LocalDocumentsDirectory$LocalLogPrefix$ScriptFilename$LocalLogPostfix \
    --progress \
    '"'$WorkstationHomeDirectory$LocalStorageDownloadDirectory$LocalStorageSSHConfigFile'"' \
    '"'$WorkstationHomeDirectory$LocalSystemSSHConfigFile'.sync"'
  #ExecuteRunfile
  echo

EndingTimestamp=$(date +%Y-%m-%d@%H:%M:%S:%N)

## ending message
echo
echo "// Ending job timestamp: $EndingTimestamp"
echo "// Sync job completed."
echo

exit