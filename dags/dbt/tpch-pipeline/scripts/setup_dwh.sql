-- setup wh, db and role
use role accountadmin;
create warehouse if not exists dbt_wh with warehouse_size='x-small';
create database if not exists dbt_db;
create role if not exists dbt_role;
create schema if not exists dbt_db.dbt_schema;

-- extend grants to user
grant usage on warehouse dbt_wh to role dbt_role;
grant all on database dbt_db to role dbt_role;
grant all on schema dbt_db.dbt_schema to role dbt_role;
grant role dbt_role to user csanry;
