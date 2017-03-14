# Sync

Sync your workstations to SSH servers and NAS servers. Sync those servers to other servers for redundant backup.

## How to get it

```
$ git clone git@github.com:sudobasher/sync ~/Development/Github/sudobasher/sync
$ sudo chmod +x ~/Development/Github/sudobasher/sync/*.sh
```

## How to use it

```
$ ./sync.sh
```

Pick an option to upload or download your files.

Delete delay will modify the remote server for uploads or local server for downloads to match the source of the files, so be very careful when using this option. As a safety measure, start by using the "Storage Download" folder for downloads (so that you don't accidentally delete anything on your local workstation while you get the hang of things), then rename that folder to "Storage" after downloading.

Hosts files and .ssh configuration files will be downloaded as .sync files in the target system directions, which you can then rename.

## Storage

### General files

While you use your workstations, maintain all of your general, day-to-day storage into these local folders:

* Linux: **/home/LOCALUSERNAMEHERE/Storage/**
* Mac: **/Users/LOCALUSERNAMEHERE/Storage/**

Some workstation configurations are pulled from your system folders and pushed here automatically, then pulled back into your workstations as .sync files (safety feature) when performing a download sync job:

* Hosts configuration: ~/Storage/Software/Configuration Files/workstation_hosts.txt
* SSH configuration: ~/Storage/Software/Configuration Files/workstation_ssh_config.txt

### Encrypted Containers

Put your encrypted container files here:

* **~/Storage/Secure/**

## Local Configurations

Setup your hosts file:

```
# ~/etc/hosts

# example cloud SSH server
[IP]	sync2
[IP]	sync3

# example local NAS server
[IP]	airlock
```

## Remote Configurations

Setup this target partition scheme on your SSH Servers, which will hold your backups:

* **/media/ssd60/**

Setup this target folder scheme on your NAS server, which will hold your backups:

* **/volume1/Backup\ Data/Storage/**

Add this cronjob on your sync2 server for daily SSH server to SSH server redundant backup:

```
# sync from SSH server sync2 to sync3
0 0 * * * /media/ssd60/Sync/sync2_upload_sync3.sh
```

## Recommendations

* On Linux, use full encryption on your workstation hard drives, or at least your home folders.
* On Macs, use FileVault full encryption on your workstation hard drives.
* Remove password authentication from all of your SSH servers
* Use default deny-all-incoming firewalls on your SSH servers. Open only port 22.
* If you have configuration management available on your SSH servers, establish a specific block/list of allowed incoming IPs.
* Use default deny-all-incoming firewalls on your local workstations.
* Setup a firewall/routing box to filter you from your internet connection (ISP) on all your local networks.
* Trust no one, and triple check all security configurations.
