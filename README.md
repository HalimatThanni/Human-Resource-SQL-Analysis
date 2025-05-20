# Human-Resource-SQL-Analysis


## Project Background
Elvo-Express Company requested a data-driven HR dashboard capturing key performance indicators (KPIs) from 2010 to 2015 and beyond, focusing on hiring, terminations, retention, churn, workforce diversity, and location-based metrics.

Using a SQL Server database table [Human Resources], I developed queries to extract, group, and analyze data aligned with business needs.

## Analytical Approach & SQL Query Breakdown
**PART A** — Key Operational Metrics (2010-2015)

1. Total Number of Staff Hired (2010-2015)
**Approach:**
Used a WHERE clause with BETWEEN on the hire_date column to filter relevant records, and COUNT(emp_id) for total staff hired.

I am using the BETWEEN clause to simplify date range selection, and the COUNT on emp_id ensures null-safe counting of hires.

<img width="800" height="300" alt="SQL1" src="https://github.com/user-attachments/assets/6b4fef6d-228c-4517-82d8-8f43119cb06f" />

