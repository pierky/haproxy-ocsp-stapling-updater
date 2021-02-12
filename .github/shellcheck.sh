#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install shellcheck

shellcheck -C hapos-upd
