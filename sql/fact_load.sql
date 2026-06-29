SELECT COUNT(*)
FROM dw.stg_cpi
WHERE TRIM(cpi) = '';

SELECT COUNT(*)
FROM dw.stg_cpi
WHERE TRIM(inflation_rate) = '';

SELECT * 
FROM dw.fact_cpi;

SELECT *
FROM dw.stg_cpi
WHERE cpi = 'NULL'
LIMIT 10;

INSERT INTO dw.fact_cpi (
    date_key,
    state_key,
    commodity_key,
    cpi_sector_key,
    cpi,
    inflation_rate
)
SELECT
    d.date_key,
    s.state_key,
    c.commodity_key,
    cs.cpi_sector_key,

    NULLIF(NULLIF(TRIM(sc.cpi),''),'NULL')::NUMERIC,
    NULLIF(NULLIF(TRIM(sc.inflation_rate),''),'NULL')::NUMERIC

FROM dw.stg_cpi sc

JOIN dw.dim_date d
    ON sc.date = d.full_date

JOIN dw.dim_state s
    ON sc.state_code::INT = s.state_code

JOIN dw.dim_cpi_commodity c
    ON sc.commodity_group = c.commodity_group

JOIN dw.dim_cpi_sector cs
    ON sc.sector = cs.sector_name;


SELECT COUNT(*) FROM dw.stg_cpi;
SELECT COUNT(*) FROM dw.fact_cpi;


SELECT DISTINCT state_name
FROM dw.stg_railways
ORDER BY state_name;



SELECT DISTINCT sr.state_name
FROM dw.stg_railways sr
LEFT JOIN dw.dim_state ds
    ON LOWER(TRIM(sr.state_name))
       = LOWER(TRIM(ds.state_name))
WHERE ds.state_key IS NULL;

UPDATE dw.stg_railways
SET state_name = 'Chhattisgarh'
WHERE state_name = 'Chhatisgarh';

SELECT *
FROM dw.fact_railway;

INSERT INTO dw.fact_railway (
    state_key,
    fy_key,
    route_length,
    total_track
)
SELECT
    ds.state_key,
    fy.fy_key,

    sr.route_length::NUMERIC,
    sr.total_track::NUMERIC

FROM dw.stg_railways sr

JOIN dw.dim_state ds
    ON LOWER(TRIM(sr.state_name))
       = LOWER(TRIM(ds.state_name))

JOIN dw.dim_financial_year fy
    ON sr.year = fy.financial_year;


SELECT COUNT(*) FROM dw.stg_railways;
SELECT COUNT(*) FROM dw.fact_railway;


INSERT INTO dw.fact_power
(
    date_key,
    state_key,
    power_sector_key,

    coal_cap,
    gas_cap,
    diesel_cap,
    lignite_cap,
    nuclear_cap,
    hydro_cap,
    res_cap,
    total_cap
)

SELECT

    d.date_key,
    s.state_key,
    ps.power_sector_key,

    sp.coal_cap,
    sp.gas_cap,
    sp.diesel_cap,
    sp.lignite_cap,
    sp.nuclear_cap,
    sp.hydro_cap,
    sp.res_cap,
    sp.total_cap

FROM dw.stg_power sp

JOIN dw.dim_date d
    ON sp.date = d.full_date

JOIN dw.dim_state s
    ON sp.state_code = s.state_code

JOIN dw.dim_power_sector ps
    ON sp.sector = ps.sector_name;