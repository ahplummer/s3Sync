#!/bin/bash
if [ -z $1 ]; then echo "You need to pass in a directory."; exit; fi
fullpath=$(readlink -f $1)
echo Will build directory structure in s3 based on $fullpath
aws s3 sync $1 s3://$S3_BUCKET/$fullpath \
            --exclude '*/.git/*' \
            --exclude '*/.terraform/*' \
            --exclude '*/.idea/*' \
            --exclude '*/.vagrant/*' \
            --exclude '*.box' \
            --exclude '*.env' 