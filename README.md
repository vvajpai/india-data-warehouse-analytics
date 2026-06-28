# 🇮🇳 India Data Warehouse Analytics

An end-to-end **Data Warehousing and Business Intelligence** project built using **PostgreSQL** and **Tableau** to analyze India's **Power Generation**, **Consumer Price Index (CPI)**, and **Railway Infrastructure** datasets.

This project demonstrates the complete analytics workflow—from raw CSV datasets to a Star Schema data warehouse and interactive Tableau dashboards.

---

# Project Overview

The objective of this project is to build a centralized analytical data warehouse capable of integrating multiple public datasets and transforming them into business-ready dashboards.

The project includes:

* Data modeling using Star Schema
* SQL-based ETL and data transformation
* PostgreSQL Data Warehouse
* Interactive Tableau dashboards
* Business insight generation

---

# Technology Stack

| Technology   | Purpose                   |
| ------------ | ------------------------- |
| PostgreSQL   | Data Warehouse            |
| SQL          | ETL & Data Transformation |
| Tableau      | Dashboard Development     |
| Draw.io      | Architecture Diagram      |
| dbdiagram.io | Star Schema Design        |
| Git & GitHub | Version Control           |

---

# Project Architecture

The project follows a modern Business Intelligence pipeline.

```
Raw CSV Files
        │
        ▼
PostgreSQL Staging Tables
        │
        ▼
SQL ETL Pipeline
        │
        ▼
Star Schema Data Warehouse
        │
        ▼
Interactive Tableau Dashboards
```

The detailed architecture diagram is available in:

```
docs/architecture.png
```

---

# Data Warehouse Design

The PostgreSQL warehouse follows a **Star Schema** consisting of:

### Fact Tables

* fact_power
* fact_cpi
* fact_railway

### Dimension Tables

* dim_state
* dim_date
* dim_financial_year
* dim_power_sector
* dim_cpi_sector
* dim_cpi_commodity

The complete schema is available in:

```
docs/star_schema.pdf
```

---

# Dashboards

## 1. Power Generation Dashboard

**Business Questions Answered**

* Current installed generation capacity
* Renewable vs conventional energy mix
* Top power-producing states
* Capacity contribution by ownership sector
* Capacity growth over time

---

## 2. Consumer Price Index Dashboard

**Business Questions Answered**

* Latest inflation rate
* Current CPI value
* Highest inflation commodity
* Highest inflation state
* Inflation trend over time
* Inflation by sector
* Top states by inflation
* Top commodities by inflation

---

## 3. Railway Infrastructure Dashboard

**Business Questions Answered**

* Total route length
* Total track length
* Largest railway state
* Largest railway region
* Track growth over time
* Top railway states
* Track density by region

---

# Repository Structure

```
india-data-warehouse-analytics/

├── datasets/
│   ├── power_generation.csv
│   ├── consumer_price_index.csv
│   └── railway_network.csv
│
├── tableau/
│   └── India_Data_Warehouse_Analytics.twbx
│
├── dashboard_images/
│   ├── power_dashboard.png
│   ├── cpi_dashboard.png
│   └── railway_dashboard.png
│
├── docs/
│   ├── architecture.png
│   ├── star_schema.pdf
│   └── data_dictionary.md
│
├── sql/
│
└── README.md
```

---

# Key Features

* End-to-end BI solution
* PostgreSQL Star Schema implementation
* SQL-based ETL pipeline
* Shared dimension tables
* Interactive Tableau dashboards
* Business-oriented KPI development
* Clean and scalable warehouse design

---

# Dashboard Preview

Dashboard screenshots are available in the `dashboard_images/` folder.

## CPI Dashboard

![CPI Dashboard](dashboard_images/cpi_dashboard.png)

---

