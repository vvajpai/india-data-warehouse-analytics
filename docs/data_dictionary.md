# Data Warehouse Schema

## Dimensions

| Table | Description |
| :--- | :--- |
| **dim_state** | Stores state and region information |
| **dim_date** | Calendar dimension |
| **dim_power_sector** | Power ownership sector |
| **dim_cpi_sector** | CPI sector classification |
| **dim_cpi_commodity** | Commodity groups |

## Facts

| Table | Description |
| :--- | :--- |
| **fact_power** | Installed generation capacity |
| **fact_cpi** | CPI and inflation observations |
| **fact_railway** | Railway infrastructure metrics |
