#!/bin/sh

role=$1

puppet apply --modulepath="/vagrant/modules:/vagrant/roles" \
  -e "include $1"
