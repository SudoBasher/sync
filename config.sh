#!/bin/bash

## modify these settings as needed

	## linux options
	LinuxWorkstationHomeDirectory="/home/LOCALUSERNAMEHERE/"

	## mac options
	MacWorkstationHomeDirectory="/Users/LOCALUSERNAMEHERE/"

	## global settings
	LocalExcludeFileDirectory="Development/Github/sudobasher/sync/"
	LocalDocumentsDirectory="Documents/"
	LocalStorageUploadDirectory="Storage/"
	LocalStorageDownloadDirectory="Storage-Download/"
	SecureDirectory="Secure/"

	LocalStorageHostsFile="Software/Configuration Files/workstation_hosts.txt"
	LocalSystemHostsFile="/etc/hosts"
	LocalStorageSSHConfigFile="Software/Configuration Files/workstation_ssh_config.txt"
	LocalSystemSSHConfigFile="/home/user/.ssh/config"

	RemoteServer="sync2"
	RemoteStorageDirectory="/media/ssd60/"

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