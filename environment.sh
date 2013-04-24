#!/bin/bash

# These environement variables are required to configure this package
# Set them to your own sane defaults!
# Users should copy these configurations to thier `bash_profile` or `bash_rc`
#  file, or source this file will to export the variables.

export OPSCODE_USER="jrobertfox"
export OPSCODE_ORGNAME="nsb"
export KNIFE_CLIENT_KEY_FOLDER="$HOME/.chef"
export KNIFE_VALIDATION_KEY_FOLDER="$HOME/.chef"
export KNIFE_CHEF_SERVER="https://api.opscode.com/organizations/$OPSCODE_ORGNAME"
export KNIFE_CACHE_PATH="$HOME/.chef/checksums"
export KNIFE_COOKBOOK_COPYRIGHT="Never Stop Building"
export KNIFE_COOKBOOK_LICENSE="none"
export KNIFE_COOKBOOK_EMAIL="jasonrobertfox@gmail.com"
