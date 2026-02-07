🚀 Snowflake Data Engineering Project (Airflow + dbt)

This project demonstrates an end-to-end data engineering pipeline built using Snowflake, dbt, and Apache Airflow, following production-grade design patterns.

🔹 Architecture Overview
1. Raw data is stored in AWS S3
2. Data is loaded into Snowflake using external stages and COPY INTO
3. Transformations are handled using dbt
4. Apache Airflow orchestrates ingestion, transformation, testing, and snapshots
5. Development environment uses WSL + VS Code

🔹 Tech Stack
1. Snowflake
2. dbt
3. Apache Airflow
4. AWS S3
5. Python
6. SQL

🔹 Data Modeling
1. Staging layer: Views (stg_*)
2. Fact tables: Incremental models (fct_orders)
3. Dimension tables: Surrogate keys (dim_customers)
4. SCD Type-2: Implemented using dbt snapshots

🔹 Key Features
1. Incremental data ingestion
2. Star schema modeling
3. Surrogate key generation
4. SCD Type-2 history tracking
5. End-to-end orchestration with Airflow

🔹 How to Run (High Level)
1. Upload raw files to S3
2. Trigger Airflow DAG
3. Airflow runs:
   a. Snowflake COPY
   b. dbt run
   c. dbt test
   d. dbt snapshot

🔹 What I Learned
1. Designing scalable warehouse models
2. Managing slowly changing dimensions
3. Orchestrating data pipelines using Airflow
4. Debugging real-world dbt & Snowflake issues
