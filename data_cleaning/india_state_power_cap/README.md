# India — State-wise Installed Power Capacity (Data Cleaning)

Cleaning and validation of India's monthly **state-wise installed power capacity**
dataset. The main deliverable is a documented Jupyter notebook that turns the raw
extract into a validated, analysis-ready CSV.

## Dataset

- **Grain:** one row per *state × sector × month*
- **Coverage:** Nov-2017 → Mar-2025 (monthly), 36 states/UTs, 3 sectors (Central / State / Private)
- **Fuels (MW):** coal, gas, diesel, lignite, nuclear, hydro, res (renewables)

## Project structure

```
india_state_power_cap/
├── data/
│   ├── raw/        installed-capacity-statewise.csv          # source extract
│   └── processed/  installed-capacity-statewise-cleaned.csv  # cleaned output
├── notebook/
│   └── power.ipynb                                           # cleaning + analysis
└── README.md
```

## What the notebook does

1. **Load & inspect** – shape, dtypes, first rows.
2. **Integrity checks** – no missing values, no duplicates, unique `(state, sector, date)` grain.
3. **Reference consistency** – `state_code` ↔ `state_name` is a stable 1-to-1 mapping.
4. **Exploration** – plot each fuel over time, which surfaces an anomaly.
5. **Root cause** – the `nuclear` / `hydro` / `res` columns were cyclically **mislabeled
   before Dec-2021** (confirmed by an impossible "non-Central nuclear" and a sharp step at
   the Nov→Dec-2021 boundary).
6. **Fix** – reverse the column rotation for the affected rows only.
7. **Validate** – re-check the nuclear rule, confirm the series is now continuous, sweep
   for residual discontinuities.
8. **Feature engineering** – merge `coal` + `lignite` into `coal_lignite_cap`.
9. **Final gates** – assertions for nulls, negatives, grain uniqueness, discontinuities.
10. **Export** – write the cleaned CSV (and an optional profiling report).

## Key result

The raw data hid a column-rotation bug behind perfectly reasonable summary statistics.
It was diagnosed from two independent symptoms, fixed exactly (no rows dropped), and the
output is guarded by assertion gates that must all pass before export.

## Run it

```bash
pip install pandas numpy matplotlib
# optional, for the profiling report:
pip install ydata-profiling

jupyter notebook notebook/power.ipynb
```

## Output

`data/processed/installed-capacity-statewise-cleaned.csv` — a validated monthly panel of
installed capacity by state, sector and fuel.
