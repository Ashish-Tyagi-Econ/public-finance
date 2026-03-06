use "PLFS.dta", clear
lookfor age sex gedu_lvl pas
describe age sex gedu_lvl pas
summarize age
drop if age < 15 | age > 59
tabulate sex
generate female = 0
replace female = 1 if sex == 2
tabulate gedu_lvl
generate graduate = 0
replace graduate = 1 if gedu_lvl >= 11
tabulate pas
generate employed = 0
replace employed = 1 if pas >= 11 & pas <= 51
logit employed age female graduate
margins, dydx(*)
outreg2 using PLFS_Results.doc, replace ctitle(Logit Coef)
