# Indian Fiscal Policy Dynamics (1992-2023)

**Objective:** To analyze the short-run and long-run impacts of India's fiscal composition on macroeconomic indicators.
**Data:** Time-series data spanning 1992 to 2023 (Source: RBI Handbook of Statistics, National Account Statistics).
**Methodology:** Conducted time-series econometric analysis in Stata using ADF unit root tests, Johansen Cointegration, and VECM modeling. 
**Outputs:** Extracted custom data points and coefficients using `putexcel` for clean reporting.

**Key Findings:**  **Long-Run Dynamics:** Johansen cointegration tests confirm a stable long-run relationship. The VECM estimates indicate a strong positive association, where a 1-unit increase in real capital expenditure corresponds to a 34.75-unit increase in real GDP.
* **Short-Run Causality:** Wald tests reveal bidirectional short-run causality between real GDP and real capital expenditure (p < 0.05). This indicates that targeted capital outlays immediately drive growth, which in turn provides fiscal space for further capital spending.
* **Ratio Neutrality:** VAR and Granger causality tests on fiscal composition ratios (e.g., Capex/GDP, RD/GDP) showed no statistically significant short-term causal relationships (all p > 0.10). This suggests that absolute fiscal levels act as stronger immediate macroeconomic drivers than compositional shifts alone.
