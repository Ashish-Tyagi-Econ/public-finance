use "Fiscal_Composition.dta", clear
tsset year

* Core Variables Analysis
dfuller real_gdp, trend lags(1)
dfuller real_rd, trend lags(1)
dfuller real_capex, trend lags(1)

dfuller d.real_gdp, lags(1)
dfuller d.real_rd, lags(1)
dfuller d.real_capex, lags(1)

varsoc real_gdp real_rd real_capex
vecrank real_gdp real_rd real_capex, lags(1)

vec real_gdp real_rd real_capex, rank(1) lags(2)
test [D_real_gdp]LD.real_capex
test [D_real_gdp]LD.real_rd
test [D_real_capex]LD.real_gdp
vecstable, graph

* Ratio Variables Analysis
dfuller real_rd_gdp, trend lags(1)
dfuller real_capex_gdp, trend lags(1)
dfuller real_rd_capex, trend lags(1)

dfuller d.real_rd_gdp, lags(1)
dfuller d.real_capex_gdp, lags(1)
dfuller d.real_rd_capex, lags(1)

varsoc real_rd_gdp real_capex_gdp real_rd_capex
vecrank real_rd_gdp real_capex_gdp real_rd_capex, lags(1)

var d.real_rd_gdp d.real_capex_gdp d.real_rd_capex, lags(1)
vargranger

* Exporting Core Variables
putexcel set "Fiscal_Composition_Stata.xlsx", sheet("ADF_Results") replace
putexcel A1="Variable" B1="Level/Diff" C1="Test Stat" D1="5% Crit Value" E1="p-value" F1="Stationarity"

dfuller real_gdp, trend lags(1)
putexcel A2="Real GDP" B2="Level" C2=(r(Zt)) D2=(r(cv_5)) E2=(r(p)) F2="No"
dfuller d.real_gdp, lags(1)
putexcel A3="Real GDP" B3="First Diff" C3=(r(Zt)) D3=(r(cv_5)) E3=(r(p)) F3="Yes (I(1))"

dfuller real_rd, trend lags(1)
putexcel A4="Real RD" B4="Level" C4=(r(Zt)) D4=(r(cv_5)) E4=(r(p)) F4="No"
dfuller d.real_rd, lags(1)
putexcel A5="Real RD" B5="First Diff" C5=(r(Zt)) D5=(r(cv_5)) E5=(r(p)) F5="Yes (I(1))"

dfuller real_capex, trend lags(1)
putexcel A6="Real CAPEX" B6="Level" C6=(r(Zt)) D6=(r(cv_5)) E6=(r(p)) F6="No"
dfuller d.real_capex, lags(1)
putexcel A7="Real CAPEX" B7="First Diff" C7=(r(Zt)) D7=(r(cv_5)) E7=(r(p)) F7="Yes (I(1))"

putexcel set "Fiscal_Composition_Stata.xlsx", sheet("Lag_Selection") modify
varsoc real_gdp real_rd real_capex, maxlag(4)
putexcel A1=matrix(r(stats)), names
putexcel A1="Lag"

putexcel set "Fiscal_Composition_Stata.xlsx", sheet("Cointegration") modify
vecrank real_gdp real_rd real_capex, lags(1)
matrix T = r(trace)
putexcel A1="Rank" B1="Trace Stat" C1="5% Crit Value" D1="Decision"
putexcel A2=0 B2=(T[1,1]) C2=29.68 D2="Reject Null"
putexcel A3=1 B3=(T[2,1]) C3=15.41 D3="Fail to Reject"

putexcel set "Fiscal_Composition_Stata.xlsx", sheet("VECM_Results") modify
vec real_gdp real_rd real_capex, rank(1) lags(2)
putexcel A1="Causality Path" B1="Chi-Square" C1="p-value" D1="Significance"

test [D_real_gdp]LD.real_capex
putexcel A2="CAPEX -> GDP" B2=(r(chi2)) C2=(r(p)) D2="Significant (p < 0.05)"
test [D_real_capex]LD.real_gdp
putexcel A3="GDP -> CAPEX" B3=(r(chi2)) C3=(r(p)) D3="Significant (p < 0.05)"

* Exporting Ratio Variables
putexcel set "Fiscal_Composition_Stata.xlsx", sheet("ADF_Ratios") modify
putexcel A1="Variable" B1="Level/Diff" C1="Test Stat" D1="5% Crit Value" E1="p-value"

dfuller real_rd_gdp, trend lags(1)
putexcel A2="RD/GDP" B2="Level" C2=(r(Zt)) D2=(r(cv_5)) E2=(r(p))
dfuller d.real_rd_gdp, lags(1)
putexcel A3="RD/GDP" B3="First Diff" C3=(r(Zt)) D3=(r(cv_5)) E3=(r(p))

dfuller real_capex_gdp, trend lags(1)
putexcel A4="CAPEX/GDP" B4="Level" C4=(r(Zt)) D4=(r(cv_5)) E4=(r(p))
dfuller d.real_capex_gdp, lags(1)
putexcel A5="CAPEX/GDP" B5="First Diff" C5=(r(Zt)) D5=(r(cv_5)) E5=(r(p))

dfuller real_rd_capex, trend lags(1)
putexcel A6="RD/CAPEX" B6="Level" C6=(r(Zt)) D6=(r(cv_5)) E6=(r(p))
dfuller d.real_rd_capex, lags(1)
putexcel A7="RD/CAPEX" B7="First Diff" C7=(r(Zt)) D7=(r(cv_5)) E7=(r(p))

putexcel set "Fiscal_Composition_Stata.xlsx", sheet("Lag_Ratios") modify
varsoc real_rd_gdp real_capex_gdp real_rd_capex
putexcel A1=matrix(r(stats)), names
putexcel A1="Lag"

putexcel set "Fiscal_Composition_Stata.xlsx", sheet("Coint_Ratios") modify
vecrank real_rd_gdp real_capex_gdp real_rd_capex, lags(1)
matrix TR = r(trace)
putexcel A1="Rank" B1="Trace Stat" C1="5% Crit Value" D1="Decision"
putexcel A2=0 B2=(TR[1,1]) C2=29.68 D2="Fail to Reject"

putexcel set "Fiscal_Composition_Stata.xlsx", sheet("VAR_Causality") modify
var d.real_rd_gdp d.real_capex_gdp d.real_rd_capex, lags(1)
vargranger
matrix G = r(gstats)

putexcel A1="Causality Path" B1="Chi-Square" C1="p-value" D1="Significance"
putexcel A2="CAPEX/GDP -> RD/GDP" B2=(G[1,1]) C2=(G[1,3]) D2="Not Significant"
putexcel A3="RD/GDP -> CAPEX/GDP" B3=(G[4,1]) C3=(G[4,3]) D3="Not Significant"
