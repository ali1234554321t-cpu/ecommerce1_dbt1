# 🛒 E-Commerce Data Warehouse & Analytics Pipeline

A complete **Modern Data Warehouse pipeline** for an E-Commerce dataset using **Snowflake, dbt, and Apache Airflow**.

The project demonstrates how raw E-Commerce data can be loaded into a cloud data warehouse, transformed using dbt, tested, and orchestrated using Airflow.

---

## 🏗️ Project Architecture

```text
                 ┌─────────────────────┐
                 │     Source Data     │
                 │   CSV / Raw Data    │
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │      Snowflake      │
                 │     RAW Schema      │
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │        dbt          │
                 │  Data Transformation│
                 └──────────┬──────────┘
                            │
                 ┌──────────┴──────────┐
                 ▼                     ▼
        ┌─────────────────┐   ┌─────────────────┐
        │    Staging      │   │      Marts      │
        │      Views      │   │     Tables      │
        └────────┬────────┘   └────────┬────────┘
                 │                     │
                 └──────────┬──────────┘
                            ▼
                 ┌─────────────────────┐
                 │   Apache Airflow    │
                 │ Pipeline Orchestration│
                 └──────────┬──────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │ Analytics / BI      │
                 │ Ready Data          │
                 └─────────────────────┘
```

---

## 🔄 Data Pipeline

### 1. Data Source

The project starts with raw E-Commerce data containing information about:

* Customers
* Products
* Orders
* Order Items

The raw data is prepared and loaded into Snowflake.

### 2. Snowflake

Snowflake is used as the cloud data warehouse.

The database contains two main schemas:

```text
ECOMMERCE_DB
│
├── RAW
│   ├── CUSTOMERS
│   ├── PRODUCTS
│   ├── ORDERS
│   └── ORDER_ITEMS
│
└── ANALYTICS
    ├── STG_CUSTOMERS
    ├── STG_PRODUCTS
    ├── STG_ORDERS
    ├── STG_ORDER_ITEMS
    ├── DIM_CUSTOMERS
    ├── DIM_PRODUCTS
    └── FACT_ORDERS
```

### 3. dbt Transformation

dbt is responsible for transforming the raw data into analytics-ready models.

#### Staging Layer

The staging layer cleans and prepares the raw data.

Examples:

* `stg_customers`
* `stg_products`
* `stg_orders`
* `stg_order_items`

These models are materialized as **Views**.

#### Marts Layer

The marts layer creates business-ready models.

Examples:

* `dim_customers`
* `dim_products`
* `fact_orders`

These models are materialized as **Tables**.

### 4. Data Testing

dbt tests are used to validate the transformed data and help ensure data quality.

Examples include:

* Unique values
* Not-null values
* Relationships between tables
* Accepted values

### 5. Apache Airflow

Apache Airflow is used to orchestrate the pipeline.

The DAG executes:

```text
dbt run
    ↓
dbt test
```

Airflow is responsible for **orchestrating and monitoring the workflow**, while dbt performs the actual data transformations.

---

## 🛠️ Technologies Used

| Technology     | Purpose                           |
| -------------- | --------------------------------- |
| Snowflake      | Cloud Data Warehouse              |
| dbt            | Data Transformation & Testing     |
| Apache Airflow | Pipeline Orchestration            |
| SQL            | Data Definition & Analysis        |
| Python         | Supporting Data Engineering Tasks |
| Git & GitHub   | Version Control                   |

---

## 📁 Project Structure

```text
ecommerce1_dbt1/
│
├── analyses/
├── macros/
├── models/
│   ├── marts/
│   │   ├── dim_customers.sql
│   │   ├── dim_products.sql
│   │   └── fact_orders.sql
│   │
│   ├── staging/
│   │   ├── stg_customers.sql
│   │   ├── stg_order_items.sql
│   │   ├── stg_orders.sql
│   │   ├── stg_products.sql
│   │   └── schema.yml
│   │
│   └── source.yml
│
├── seeds/
├── snapshots/
├── tests/
├── sql/
│   └── setup.sql
│
├── dbt_project.yml
├── README.md
└── .gitignore
```

---

## ⚙️ dbt Commands

Install dependencies:

```bash
dbt deps
```

Check the project configuration:

```bash
dbt debug
```

Run all dbt models:

```bash
dbt run
```

Run data quality tests:

```bash
dbt test
```

Run the complete pipeline:

```bash
dbt build
```

---

## 🚀 Pipeline Execution

The complete workflow is:

```text
Raw Data
   ↓
Snowflake RAW
   ↓
dbt Staging
   ↓
dbt Marts
   ↓
dbt Tests
   ↓
Airflow Orchestration
   ↓
Analytics-Ready Data
```

---

## 🔐 Security

Sensitive credentials such as:

* Snowflake passwords
* API keys
* Personal Access Tokens
* dbt `profiles.yml`

are **not included in this repository**.

Credentials should be stored securely using environment variables or local configuration files.

---

## 🎯 Project Goal

The goal of this project is to demonstrate a practical **Data Engineering pipeline** that transforms raw E-Commerce data into structured, tested, and analytics-ready data using modern cloud and orchestration technologies.

---

## 👨‍💻 Author

**Ali Rabea Ahmed**

Data Analyst | Aspiring Data Engineer


