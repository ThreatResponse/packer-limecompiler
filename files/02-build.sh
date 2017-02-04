#!/bin/bash

/home/fedora/00-tags-to-env.sh

cd /opt/limecompiler
bundle
gem build lime-compiler.gemspec
gem install lime-compiler-*.gem
#Actually build the modules

if [ `echo $GPG_SIGN` == 1 ]; then
    echo "Spinning up with GPG Signing"
    /opt/limecompiler/bin/lime-compiler -c /opt/limecompiler/conf/config.yml -m /opt/limecompiler/build/ -a /opt/limecompiler/archive/ --gpg-sign --gpg-id $GPG_FINGERPRINT --gpg-home $GPG_HOME --kms-region $KMS_REGION --aes-key-export $AES_KEY_EXPORT_PATH --gpg-key-export $GPG_KEY_EXPORT_PATH
    exit 0
fi

if [ `echo $GPG_SIGN` == 0 ]; then
    echo "Spinning up with without GPG Signing"
    /opt/limecompiler/bin/lime-compiler -c /opt/limecompiler/conf/config.yml -m /opt/limecompiler/build/ -a /opt/limecompiler/archive/ --gpg-no-verify
    exit 0
fi
