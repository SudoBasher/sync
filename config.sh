#!/bin/bash

## modify these settings as needed

	## linux options
	LinuxWorkstationHomeDirectory="/home/user/"

	## mac options
	MacWorkstationHomeDirectory="/Users/LOCALUSERNAMEHERE/"

	## global settings
	LocalExcludeFileDirectory="development/github/sudobasher/sync/"
	LocalDocumentsDirectory="documents/"
	LocalDevelopmentUploadDirectory="development/"
	LocalStorageUploadDirectory="storage/"
	LocalStorageDownloadDirectory="storage/"
	SecureDirectory="secure/"

	LocalStorageHostsFile="software/configuration files/workstation_hosts.txt"
	LocalSystemHostsFile="/etc/hosts"
	LocalStorageSSHConfigFile="software/configuration files/workstation_ssh_config.txt"
	LocalSystemSSHConfigFile=".ssh/config"
	LocalSystemDBeaverDataDirectory=".local/share/DBeaverData/workspace6/General/.dbeaver/"
	LocalEncryptedVolumeDBeaverDataDirectory="/media/veracrypt1/pers creds/computing/database guis/DBeaverData/workspace6/General/.dbeaver"

	RemoteServer="storage0"
	RemoteStorageDirectory="/home/sudobasher/storage/"
	# RedundantServer="sync3" ## not used yet
	# RedundantStorageDirectory="/media/ssd60/" ## not used yet
	NASServer="airlock"
	NASStorageDirectory="/volume1/Backup\ Data/storage/"
	NASDevelopmentDirectory="/volume1/Backup\ Data/development/"

## keep these system settings as is
## messing with some of these could give you a serious headache

	## app settings
	title="**Sync**"
	## -a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
	  ## -r, --recursive             recurse into directories
	  ## -l, --links                 copy symlinks as symlinks
	  ## -p, --perms                 preserve permissions
	  ## -t, --times                 preserve modification times

    
    
    ## -g, --group                 preserve group
    ## -o, --owner                 preserve owner (super-user only)
    ## -D                          same as --devices --specials
      ## --devices               preserve device files (super-user only)
      ## --specials              preserve special files

  ## -v, --verbose               increase verbosity
  ## -W, --whole-file
	LinuxRsyncOptions="-avWs"
	MacRsyncOptions="-avs"
	LocalLogPrefix="rsynclog_sync_"
	LocalLogPostfix=".txt"
	ExcludeFileName="excludefile.txt"

	## sync settings
	EnableDeleteDelayOption="false"
	ExtraRsyncOptions=""
