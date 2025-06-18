--!jinja

/*-----------------------------------------------------------------------------
Hands-On Lab: Intro to Data Engineering with Notebooks
Script:       deploy_notebooks.sql
Author:       Jeremiah Hansen
Last Updated: 6/11/2024
-----------------------------------------------------------------------------*/

-- See https://docs.snowflake.com/en/LIMITEDACCESS/execute-immediate-from-template

-- Create the Notebooks
--USE SCHEMA {{env}}_SCHEMA;

CREATE OR REPLACE NOTEBOOK IDENTIFIER('"SNOWFLAKE_TUTORIALS"."{{env}}_SCHEMA"."{{env}}_06_load_excel_files"')
    FROM '@"SNOWFLAKE_TUTORIALS"."INTEGRATIONS"."GIT_REPO"/branches/"{{branch}}"/notebooks/06_load_excel_files/'
    QUERY_WAREHOUSE = 'MHN'
    MAIN_FILE = '06_load_excel_files.ipynb';

ALTER NOTEBOOK "SNOWFLAKE_TUTORIALS"."{{env}}_SCHEMA"."{{env}}_06_load_excel_files" ADD LIVE VERSION FROM LAST;

CREATE OR REPLACE NOTEBOOK IDENTIFIER('"SNOWFLAKE_TUTORIALS"."{{env}}_SCHEMA"."{{env}}_07_load_daily_city_metrics"')
    FROM '@"SNOWFLAKE_TUTORIALS"."INTEGRATIONS"."GIT_REPO"/branches/"{{branch}}"/notebooks/07_load_daily_city_metrics/'
    QUERY_WAREHOUSE = 'MHN'
    MAIN_FILE = '07_load_daily_city_metrics.ipynb';

ALTER NOTEBOOK "SNOWFLAKE_TUTORIALS"."{{env}}_SCHEMA"."{{env}}_07_load_daily_city_metrics" ADD LIVE VERSION FROM LAST;
