#!/bin/bash

## functions

function ExecuteRunfile () {
  chmod +x ./runfile.sh
  ./runfile.sh
  rm runfile.sh
}