#!/bin/bash
set -e -x

/home/ec2-user/00-tags-10-env.sh
/home/ec2-user/01-sync.sh
/home/ec2-user/02-build.sh
