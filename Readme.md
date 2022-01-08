# What is this?

A series of commands to configure S3 to sync your local system(s) directory recursively.

## Usage
* You need to get the AWS cli installed.
* Create a set of credentials, and log in with `aws configure`.
* Get a globally unique string:
```
openssl rand -hex 10
```
* Save this in an .env file, substituting your computer name and randomstring:
```
#!/bin/bash
export S3_BUCKET="<computer>-backup-<random>"
```
* Source this: `source .env`
* Create S3 bucket per system:
```
aws s3api create-bucket --bucket $S3_BUCKET --region us-east-1
```
* Use the script to sync your source folder, for example:
```
./s3Sync.sh ~/source
```
* You can now put this on a cron, if you like.