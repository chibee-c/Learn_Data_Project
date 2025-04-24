/*
Question: What are the top_paying Data Analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focus on job postings with specified salaries (remove nulls)
- Include company names.
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into 
employment opportunities.
*/


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
AND salary_year_avg IS NOT NULL;


-- Highlight the top 10 from the above result set using a sub-query.

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
