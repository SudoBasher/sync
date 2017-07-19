#!/bin/bash

## script settings
ScriptTitle=$WorkstationType" - Upload to Cloud"
ScriptFilename="upload_cloud"
StartingTimestamp=$(date +%Y-%m-%d@%H:%M:%S:%N)

## configure environment
. ./environment.sh

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

## push workstation storage to cloud storage

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
    -e '"ssh"' $RemoteServer:"$RemoteStorageDirectory" > ./runfile.sh
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
    -e '"ssh"' $RemoteServer:"$RemoteStorageDirectory$SecureDirectory" > ./runfile.sh
  ExecuteRunfile
  echo

EndingTimestamp=$(date +%Y-%m-%d@%H:%M:%S:%N)

## write log

  TransactionLogFile=$WorkstationHomeDirectory$LocalDocumentsDirectory$TransactionLogFile
  echo "LogFile: "$TransactionLogFile
  echo "## Transaction Log:" > $TransactionLogFile
  echo >> $TransactionLogFile
  echo "Hostname: "$HOSTNAME >> $TransactionLogFile
  echo "Workstation Type: "$WorkstationType >> $TransactionLogFile
  echo "Transaction Type: "$TransactionType >> $TransactionLogFile
  echo "Target Type: "$TargetType >> $TransactionLogFile
  echo "Remote Server: "$RemoteServer >> $TransactionLogFile
  echo >> $TransactionLogFile
  echo "Started at: "$StartingTimestamp >> $TransactionLogFile
  echo "Ended at:   "$EndingTimestamp >> $TransactionLogFile
  echo "Log file written."

## ending message
echo
echo "// Ending job timestamp: $EndingTimestamp"
echo "// Sync job completed."
echo

exit
