# HR Employee Attrition Analysis

## Introduction

Employee attrition is a costly, recurring problem for organizations — every departure carries recruitment, onboarding, and lost-productivity costs. This project analyzes the IBM HR Analytics Employee Attrition dataset to identify which employee attributes are statistically associated with attrition, moving beyond surface-level observation into formally tested, defensible findings, and presenting them through an interactive dashboard built for a non-technical audience (e.g., an HR manager).

## Background

The dataset contains 1,470 employee records across 35 variables — demographic details (age, marital status), compensation (monthly income, salary hike percentage), and job-related factors (department, job role, overtime status, years at company). The target variable, `Attrition`, indicates whether each employee left the company (Yes) or stayed (No). The dataset was gotten from https://www.kaggle.com/code/faressayah/ibm-hr-analytics-employee-attrition-performance

The analysis was guided by a set of research questions:
- Does average monthly income differ significantly between employees who left and stayed, and does that hold consistently across job roles?
- Is OverTime status associated with attrition?
- Is Department associated with attrition, and which department is driving it?

## Tools Used

| Tool | Role in the project |
|---|---|
| **Python** (pandas, seaborn, matplotlib, Jupyter) | Data cleaning, exploratory data analysis, and visualization |
| **Stata** | Formal hypothesis testing (t-tests, chi-square tests) to confirm whether observed patterns are statistically significant |
| **Excel** | Interactive dashboard (PivotTables, PivotCharts, slicers) for presenting findings to a non-technical audience |

## Analysis

The workflow followed three stages, each building on the last:

1. **Exploration (Python):** Used `groupby` and `crosstab` to compare numeric and categorical variables against Attrition, then visualized the strongest candidates with seaborn (boxplots, countplots, a correlation heatmap) to identify which patterns were worth testing formally.
2. **Formal testing (Stata):** Ran independent-samples t-tests on income and age, and chi-square tests on OverTime and Department, against Attrition. Checked variance equality (`sdtest`) before finalizing the income t-test, applying Welch's correction where variances were unequal.
3. **Presentation (Excel):** Built a dashboard combining KPI summary cards, four connected PivotCharts, and slicers (Department, JobRole, Attrition) so a reader can filter the entire dashboard interactively.

## What I Learned

This project opened my understanding that exploratory visualization and formal statistical testing serve different, complementary purposes — a chart can suggest a pattern, but only a hypothesis test can confirm whether that pattern is real or attributable to random variation. I also learned to check test assumptions (like equal variance) rather than accepting default settings, and that a single overall test can obscure meaningful differences that only appear when a variable is examined within subgroups (e.g., job role).

## Insights

- **Overall attrition rate: 16.12%**
- **OverTime is significantly associated with attrition** (χ² = 89.04, p < 0.001) — employees working overtime attrite at a disproportionately higher rate than those who don't
- **Department is significantly associated with attrition**, with **Sales** showing the highest attrition rate (~20.6%), ahead of Human Resources (~19.0%) and Research & Development (~13.8%)
- **Average monthly income differs significantly** between leavers and stayers (Welch's t-test, p < 0.001) — employees who left earned less on average (₦4,787 vs. ₦6,833)
- The income–attrition relationship is **not uniform across job roles**: in most roles, lower-paid employees left more often, as expected — but in a few roles (Healthcare Representative, Research Director, Sales Executive), the *highest*-paid employees were the ones leaving, suggesting non-compensation factors drive attrition in those roles specifically

## Challenges I Faced
During the course of this Project I did not encounter any challenges, I have done this type of analysis over and over again, the algorithms are used to me

## Conclusion

Overtime status and department are the two strongest, statistically confirmed predictors of attrition risk in this dataset, while income's relationship with attrition is more nuanced than a single company-wide comparison suggests. For an HR team, this points to two actionable priorities: reviewing overtime policy and workload distribution, and investigating retention specifically within Sales and among high-earning employees in roles where pay isn't the retention lever it appears to be elsewhere.

## Repository Structure

```
├── data/          # Raw and cleaned CSV
├── notebooks/     # Jupyter notebooks (data cleaning, EDA, visualization)
├── stata/         # .do script and .log output
├── dashboard/     # Excel dashboard (.xlsx)
├── images/        # Exported chart images
└── README.md
```



