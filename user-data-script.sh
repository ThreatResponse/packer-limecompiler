#!/bin/bash
set -e -x

/home/fedora/00-tags-10-env.sh
/home/fedora/01-sync.sh
/home/fedora/02-build.sh
