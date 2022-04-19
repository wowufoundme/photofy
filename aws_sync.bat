:: Syncs AWS bucket with the current content of the folder including this scripts
:: Deployment to Github is user dependant based on Github branches

@echo off
cls
set BUCKETNAME=photofy-app
aws s3 sync . s3://%BUCKETNAME%
echo ======================================================
echo Sync complete with S3 bucket %BUCKETNAME%
echo ======================================================
pause