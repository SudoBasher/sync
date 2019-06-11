#! /usr/bin/python3

## file imports
import config
import functions

## python imports
import datetime
import sys
import time

## starting timestamp
job_start_timestamp = str(time.time())
job_start_datetime = str(datetime.datetime.now())

## title
print ()
print ("**Sync**")
print ()


## source os distro
source = functions.env_from_sourcing("/etc/os-release")
print (source)
print ()

## delete target folder/files?
delete_target_files = input("Enabled deleting of target folder/files? <y/n> ")
if ( ( delete_target_files == "y" ) or
     ( delete_target_files == "yes" ) or
     ( delete_target_files == "Y" ) or
     ( delete_target_files == "Yes" )
   ):
  enable_delete_delay_option = "true"
  extra_rsync_options = "--delete-delay"
  print ("Target folder/file deleting enabled!")
else:
  print ("Deleting disabled.")


## ending timestamp
job_end_timestamp = str(time.time())
job_end_datetime = str(datetime.datetime.now())

## debugging
print ()
print ("** Debugging Info: **")
print ()
print ("// This is the name of the script: ", sys.argv[0])
print ("// Number of arguments: ", len(sys.argv))
print ("// The arguments are: " , str(sys.argv))
print ()
print ("// Starting job timestamp: "+job_start_timestamp)
print ("// Starting job date time: "+job_start_datetime)
print ()
print ("// Ending job timestamp: "+job_end_timestamp)
print ("// Ending job date time: "+job_end_datetime)
print ("// Sync job completed.")
print ()
