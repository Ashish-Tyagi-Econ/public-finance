# PLFS Determinants

**Objective:** To model the impact of core demographic factors (age, gender, education) on employment probability in India.

**Data:** Periodic Labour Force Survey (PLFS) microdata, restricted to the working-age cohort (15–59 years).

**Methodology:** Cross-sectional econometric analysis in **Stata** using logistic regression, with **Average Marginal Effects (AME)** reported for intuitive policy interpretation. The model specification is:

logit employed age female graduate  
margins, dydx(*)

The final sample contains **2,419 observations**, with strong overall model significance (LR χ² = 1191.38, p < 0.001) and a **Pseudo R² of 0.356**, indicating substantial explanatory power for a binary-choice model.

**Outputs:** Automated publication-ready regression tables exported using the `outreg2` package in Stata. A screenshot of the regression output is included below for reference.

**Key Findings:**

- **The Gender Gap:** Gender is the strongest predictor of employment status. Controlling for age and education, being female decreases the probability of employment by **47.9 percentage points** (p < 0.001) relative to males, highlighting a substantial gender disparity in labour market participation.

- **The Education Premium:** Higher education yields a strong positive return. Holding a graduate-level education or higher increases employment probability by **10.6 percentage points** (p < 0.001), suggesting that human capital accumulation significantly improves labour market outcomes.

- **Age Dynamics:** Employment probability demonstrates a positive relationship with age within the working-age cohort, increasing by approximately **1.3 percentage points per additional year**, likely reflecting experience accumulation and labour market attachment.

**Policy Interpretation:** The results highlight persistent structural challenges in India's labour market. The large gender employment gap suggests barriers to female labour force participation, while the strong education premium indicates the continued importance of higher education and skill development for improving employment prospects.

![PLFS Logit Results](results/logit_output.png)
