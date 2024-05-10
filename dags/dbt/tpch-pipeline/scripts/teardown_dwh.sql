-- tear down resources
use role accountadmin;
use snowflake;
drop warehouse if exists dbt_wh;
drop database if exists dbt_db;
drop role if exists dbt_role;
drop schema if exists dbt_schema;
