# Indian Fiscal Policy Dynamics (1992–2023)

**Objective:** To analyze the short-run and long-run impacts of India's fiscal composition on macroeconomic performance.

**Data:** Annual time-series data (1992–2023) sourced from the RBI Handbook of Statistics and National Accounts Statistics. Core variables include real GDP, real revenue deficit, and real capital expenditure. Additional robustness checks use fiscal ratios such as Capex/GDP and RD/GDP.

**Methodology:** Time-series econometric analysis in Stata. Augmented Dickey–Fuller (ADF) tests confirm the variables are non-stationary in levels but stationary in first differences (I(1)). Lag length was selected using AIC/HQIC/SBIC criteria before conducting Johansen cointegration tests. A Vector Error Correction Model (VECM) was estimated to capture long-run equilibrium relationships and short-run dynamics. Wald tests and VAR–Granger causality tests were used for short-run causal analysis.

**Outputs:** Key coefficients and results were exported using `putexcel` for structured reporting. Relevant econometric outputs are included in the `results/` directory.

**Key Findings:**

- **Long-Run Relationship:** Johansen cointegration tests confirm a stable long-run equilibrium relationship between real GDP, revenue deficit, and capital expenditure.

- **Capital Expenditure Effects:** VECM and Wald tests show that capital expenditure significantly influences GDP growth in the short run (p ≈ 0.01), while GDP growth also feeds back into higher capital spending (p ≈ 0.007).

- **Revenue Deficit:** No statistically significant short-run growth effects were found for revenue deficit changes.

- **Ratio Neutrality:** VAR and Granger causality tests on fiscal ratios (Capex/GDP and RD/GDP) show no significant short-run causal relationships (p > 0.10), suggesting absolute fiscal magnitudes matter more than compositional ratios.
