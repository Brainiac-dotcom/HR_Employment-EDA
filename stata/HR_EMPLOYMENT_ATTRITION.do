import delimited "C:/Users/DELL/Downloads/WA_Fn-UseC_-HR-Employee-Attrition.csv", clear

describe
encode attrition, gen(attrition_cat)
encode overtime, gen(overtime_cat)
encode department, gen(department_cat)
encode jobrole, gen(jobrole_cat)
describe

save "hr_attrition_encoded.dta", replace
ttest monthlyincome, by(attrition_cat)
tabulate overtime_cat attrition_cat, chi2
tabulate department_cat attrition_cat, chi2

ttest monthlyincome, by(attrition_cat) unequal
sdtest monthlyincome, by(attrition_cat)
