#!/bin/bash

## environment settings
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

if [ -f runfile ]
  then
    rm runfile.sh
fi
