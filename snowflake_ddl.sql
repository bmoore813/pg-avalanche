CREATE STAGE "DEV_BMOORE"."TEST_DATA".teststage URL = 's3://debezium-spike' CREDENTIALS = (AWS_KEY_ID = '*****' AWS_SECRET_KEY = '******');

create external table test 
table_format = iceberg
file_format = parquet
refresh_on_create = false
auto_refresh = false
location = @"DEV_BMOORE"."TEST_DATA"/debeziumevents/debeziumcdc_tutorial_public_new/metadata/v1.metadata.json