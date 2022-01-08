#!/bin/bash
if [ -z $1 ]; then echo "You need to pass in a directory."; exit; fi

aws s3 sync $1 s3://$S3_BUCKET \
            --exclude '*/.git/*' \
            --exclude '*/.terraform/*' \
            --exclude '*/.idea/*' \
            --exclude '*/.vagrant/*' \
            --exclude '*.box' \
            --exclude '*.env' 