CREATE TABLE IF NOT EXISTS dw.dim_state
(
    state_key INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    state_name VARCHAR(100),
    state_code INT,
    region VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS dw.dim_financial_year
(
    fy_key INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    financial_year VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS dw.dim_power_sector
(
    power_sector_key INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sector_name VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS dw.dim_cpi_sector
(
    cpi_sector_key INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sector_name VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS dw.dim_cpi_commodity
(
    commodity_key INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    commodity_group VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS dw.dim_date
(
    date_key INT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    quarter INT,
    year INT,
    financial_year VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS dw.fact_power
(
    power_fact_key BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    date_key INT,
    state_key INT,
    power_sector_key INT,

    coal_cap NUMERIC,
    gas_cap NUMERIC,
    diesel_cap NUMERIC,
    lignite_cap NUMERIC,
    nuclear_cap NUMERIC,
    hydro_cap NUMERIC,
    res_cap NUMERIC,
    total_cap NUMERIC,

    CONSTRAINT fk_power_date
        FOREIGN KEY (date_key)
        REFERENCES dw.dim_date(date_key),

    CONSTRAINT fk_power_state
        FOREIGN KEY (state_key)
        REFERENCES dw.dim_state(state_key),

    CONSTRAINT fk_power_sector
        FOREIGN KEY (power_sector_key)
        REFERENCES dw.dim_power_sector(power_sector_key)
);

CREATE TABLE IF NOT EXISTS dw.fact_cpi
(
    cpi_fact_key BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    date_key INT,
    state_key INT,
    commodity_key INT,
    cpi_sector_key INT,

    cpi NUMERIC,
    inflation_rate NUMERIC,

    FOREIGN KEY (date_key)
        REFERENCES dw.dim_date(date_key),

    FOREIGN KEY (state_key)
        REFERENCES dw.dim_state(state_key),

    FOREIGN KEY (commodity_key)
        REFERENCES dw.dim_cpi_commodity(commodity_key),

    FOREIGN KEY (cpi_sector_key)
        REFERENCES dw.dim_cpi_sector(cpi_sector_key)
);

CREATE TABLE IF NOT EXISTS dw.fact_railway
(
    railway_fact_key BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    state_key INT,
    fy_key INT,

    route_length NUMERIC,
    total_track NUMERIC,

    FOREIGN KEY (state_key)
        REFERENCES dw.dim_state(state_key),

    FOREIGN KEY (fy_key)
        REFERENCES dw.dim_financial_year(fy_key)
);


