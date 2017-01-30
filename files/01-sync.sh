#!/bin/bash

#Bring the system in sync with the public repo
aws s3 sync s3://threatresponse-lime-modules/modules/ /opt/limecompiler/build/modules/
aws s3 sync s3://threatresponse-lime-modules/repodata/ /opt/limecompiler/build/modules/
