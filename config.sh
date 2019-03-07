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

	RemoteServer="storage1"
	RemoteStorageDirectory="/home/sudobasher/storage/"
	RedundantServer="sync3"
	RedundantStorageDirectory="/media/ssd60/"
	NASServer="airlock"
	NASStorageDirectory="/volume1/Backup\ Data/storage/"
	NASDevelopmentDirectory="/volume1/Backup\ Data/development/"

## keep these system settings as is
## messing with some of these could give you a serious headache

	## app settings
	title="**Sync**"
	LinuxRsyncOptions="-avzs"
	MacRsyncOptions="-avs"
	LocalLogPrefix="rsynclog_sync_"
	LocalLogPostfix=".txt"
	ExcludeFileName="excludefile.txt"

	## sync settings
	EnableDeleteDelayOption="false"
	ExtraRsyncOptions=""
