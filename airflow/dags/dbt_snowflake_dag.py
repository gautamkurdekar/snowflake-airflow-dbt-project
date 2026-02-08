from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

DBT_PROJECT_DIR = "C:/snowflake-project/sample_dbt"
DBT_EXECUTABLE = "C:/snowflake-project/venv/Scripts/dbt.exe"

default_args = {
    "owner": "data-engineer",
    "start_date": datetime(2025, 1, 1),
    "retries": 1,
}

with DAG(
    dag_id="snowflake_dbt_pipeline",
    default_args=default_args,
    schedule_interval="@daily",
    catchup=False,
) as dag:

    dbt_deps = BashOperator(
        task_id="dbt_deps",
        bash_command=f'cd {DBT_PROJECT_DIR} && "{DBT_EXECUTABLE}" deps',
    )

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command=f'cd {DBT_PROJECT_DIR} && "{DBT_EXECUTABLE}" run',
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command=f'cd {DBT_PROJECT_DIR} && "{DBT_EXECUTABLE}" test',
    )

    dbt_snapshot = BashOperator(
        task_id="dbt_snapshot",
        bash_command=f'cd {DBT_PROJECT_DIR} && "{DBT_EXECUTABLE}" snapshot',
    )

    dbt_deps >> dbt_run >> dbt_test >> dbt_snapshot
