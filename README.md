# pipeline
ELT pipeline built with DBT, Snowflake, Airflow

## Prerequisites

Before running this pipeline, make sure you have the following prerequisites installed:

- SnowSQL: Snowflake's command-line client for interacting with Snowflake. You can download it from the [Snowflake website](https://docs.snowflake.com/en/user-guide/snowsql.html).

- python `3.10`

## Setup

### Poetry env

To setup the poetry environment run

```zsh
make setup-env
```

### DBT connections

To setup the DBT dependencies from scratch and check the DBT-snowflake connector, run

```zsh
make dbt-checks
```

### DWH setup

To set up the data warehouse, run the following `snowsql` command

```zsh
snowsql -f $(PWD)/dags/tpch-pipeline/scripts/setup_dwh.sql
```

### Start a local airflow instance via cosmos

Run the following command if using `docker`

```zsh
docker login
astro dev start
```

If using `colima`

```zsh
colima start --cpu 4 --memory 8
astro dev start
```

This spins up an instance of a local Airflow server at `localhost:8080` for development and testing purposes
