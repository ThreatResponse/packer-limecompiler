# packer-limecompiler

Packer file used to build a workstation the runs LimeCompiler from ThreatResponse


## Running Packer

`packer build packer.json`

## Role provided

The role provided in `lime-compiler-policy.json` is the minimum instance profile needed to the gem to push and pull from s3.

## CloudFormation

A file is included that is a sample cloudformation stack template.  Ensure you update the tags to represent your environment.

## Scripts

`01-sync` and `03-sync` in the files directory will also require modification to match your kernel module bucket.

## Required Environment Variables these are taken from AWS Tags in the UserData script of the Stack Template
export CONFIG_PATH='conf/config.yml'
export GPG_HOME='build_gpg_home'
export GPG_FINGERPRINT='80DA92CB09161F241C8F9BC918BA980367172B17'
export KMS_REGION='us-west-2'
export AES_KEY_EXPORT_PATH='s3://threatresponse.limecompiler.configs/aes_export.aes'
export GPG_KEY_EXPORT_PATH='s3://threatresponse.limecompiler.configs/gpg_export.aes'
export OPTIONAL_ARGS="--gpg-sign --gpg-id ${GPG_FINGERPRINT} --gpg-home ${GPG_HOME} --kms-region ${KMS_REGION} --aes-key-export ${AES_KEY_EXPORT_PATH} --gpg-key-export ${GPG_KEY_EXPORT_PATH}"
