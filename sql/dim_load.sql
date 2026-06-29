INSERT INTO dw.dim_state (
state_name, 
state_code, 
region
)
SELECT DISTINCT 
state_name, state_code, region
FROM dw.stg_power
ORDER BY state_code;

INSERT INTO dw.dim_state (
state_name, 
state_code, 
region
) 
VALUES
('All India',0,NULL),
('Daman And Diu',25,NULL),
('Dadra And Nagar Haveli',26,NULL);

SELECT *
FROM dw.dim_state
ORDER BY state_code;

SELECT COUNT(*)
FROM dw.dim_state;

SELECT * 
FROM dw.dim_power_sector;

SELECT DISTINCT sector 
FROM dw.stg_power;

INSERT INTO dw.dim_power_sector(
sector_name
)
SELECT DISTINCT 
sector 
FROM dw.stg_power
ORDER BY sector;

SELECT DISTINCT sector
FROM dw.stg_cpi;

INSERT INTO dw.dim_cpi_sector (
    sector_name
)
SELECT DISTINCT
    sector
FROM dw.stg_cpi
ORDER BY sector;

SELECT * 
FROM dw.dim_cpi_sector; 

SELECT COUNT(DISTINCT commodity_group)
FROM dw.stg_cpi;

INSERT INTO dw.dim_cpi_commodity (
    commodity_group
)
SELECT DISTINCT
    commodity_group
FROM dw.stg_cpi
ORDER BY commodity_group;


SELECT COUNT(*)
FROM dw.dim_cpi_commodity;

SELECT DISTINCT year
FROM dw.stg_railways
ORDER BY year;

INSERT INTO dw.dim_financial_year (
    financial_year
)
SELECT DISTINCT
    year
FROM dw.stg_railways
ORDER BY year;

SELECT MIN(date), MAX(date)
FROM dw.stg_cpi;

SELECT MIN(date), MAX(date)
FROM dw.stg_power;

SELECT *
FROM dw.dim_date;


INSERT INTO dw.dim_date (
date_key,
full_date,
day,
month,
quarter,
year,
financial_year
)

SELECT 
TO_CHAR(d,'YYYYMMDD')::INT AS date_key,
d AS full_date,
EXTRACT(DAY FROM d):: INT, 
EXTRACT(MONTH FROM d):: INT,
EXTRACT(QUARTER FROM d)::INT,
EXTRACT(YEAR FROM d)::INT,

CASE
        WHEN EXTRACT(MONTH FROM d) >= 4
        THEN EXTRACT(YEAR FROM d)::TEXT || '-' ||
             (EXTRACT(YEAR FROM d)+1)::TEXT
        ELSE (EXTRACT(YEAR FROM d)-1)::TEXT || '-' ||
             EXTRACT(YEAR FROM d)::TEXT
    END AS financial_year

FROM generate_series(
    '2014-01-01'::DATE,
    '2025-08-01'::DATE,
    INTERVAL '1 day'
) AS d;


SELECT COUNT(*)
FROM dw.dim_date;

SELECT *
FROM dw.dim_date
ORDER BY full_date
LIMIT 5;



