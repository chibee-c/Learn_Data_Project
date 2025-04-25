# Introduction
Dive into the data job market. Focusing on data analyst roles. 
This project explores top-paying jobs, in-demand skills, and where
high demand meets high salary in data analytics.

Check out the SQL queries here: [project_sql folder](/project_sql/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, 
this project was born from a desire to pinpoint top-paid and in-demand skills,
streamlining others work to find optimal jobs.

The questions answered through the queries were:
1. What are the top_paying Data Analyst jobs?
2. What are the skills required for those top-paying roles?
3. What are the most in-demand skills for the data analyst role?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several
key tools:
- **SQL:** The backbone of my analysis, allowing me to
query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system,
ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management
and executing SQL queries.
- **Git & GitHub:** Essential for version control and
sharing my SQL scripts and analysis, ensuring
collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects 
of the data analyst job market. Here's how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by 
average yearly salary and location, focusing on remote jobs. this query highlights
the high paying opportunities in the field.

```sql
SELECT
     *
FROM
    (
    SELECT
    jp.job_id,
    job_title,
    cd.name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    RANK() OVER(ORDER BY salary_year_avg DESC) as rank
FROM
    job_postings_fact jp
JOIN company_dim cd
    ON jp.company_id = cd.company_id
WHERE
    job_title_short = 'Data Analyst'
AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
    )x
WHERE x.rank <= 10;
```
Here's the breakdown of the top data analyst jobs in 2023:
- **Wide Salary Range:** Top 10 paying data analyst roles span from $184,000 to $650,000,
indicating significant salary potential in the field.
- **Diverse Employers:** Companies like SmartAsset, Meta, and AT&T are among those offering high salaries,
showing a broad interest across different industries.
- **Job Title Variety:** There's a high diversity in job titles, from Data Analyst to Director of Analytics,
reflecting varied roles and specializations within data analytics.

# What I Learned

- Conclusions
