/*
Question: What are the top skills based on salary?
- Look at the avearge salary associated with each skill for Data Analyst positions.
- Focus on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
helps identify the most financially rewarding skills to acquire or improve.
*/


SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM 
    job_postings_fact jp
JOIN skills_job_dim sj ON jp.job_id = sj.job_id
JOIN skills_dim sd ON sj.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
AND job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY 
    average_salary DESC
LIMIT 25;


/*
Here's the breakdown of the top 25 highest-paying skills for data analysts in 2023. A few quick insights:

- PySpark dominates the list with the highest average salary, suggesting strong demand for big data and distributed processing expertise.

- Tools related to cloud platforms, DevOps (e.g., Bitbucket, GitLab, Jenkins), and
machine learning (e.g., DataRobot, scikit-learn, Airflow) command premium pay.

- Notebook environments (Jupyter) and foundational libraries like Pandas and NumPy are also well-compensated,
reinforcing their relevance in data workflows.
*/