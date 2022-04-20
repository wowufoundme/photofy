:: Syncs AWS bucket with the current content of the folder including this scripts
:: Deployment to Github is user dependant based on Github branches

@echo off
cls
set BUCKETNAME=photofy-app
echo ======================================================
tar.exe -c -a -f .\artifacts\index_photos.zip index_photos.py
tar.exe -c -a -f .\artifacts\search_photos.zip search_photos.py
echo Syncing Lambda Function - Index Photos...
aws lambda update-function-code --function-name index-photos --zip-file fileb://artifacts/index_photos.zip > .\dump\log_lf1_output.json
echo Syncing Lambda Function - Search Photos...
aws lambda update-function-code --function-name LF2-search-photos --zip-file fileb://artifacts/search_photos.zip > .\dump\log_lf2_output.json
echo Lambda Sync Complete
echo ======================================================
echo Syncing AWS Bucket with resources
aws s3 sync . s3://%BUCKETNAME% > .\dump\aws_sync_dump.txt
echo ======================================================
echo Sync complete with S3 bucket %BUCKETNAME%
echo ======================================================
pause
cls