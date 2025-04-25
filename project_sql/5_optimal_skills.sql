/*
Question: What are the most optimal skills to learn? (skills that are BOTH in high demand and is high paying)
- Identify skills in high demand and associated with high average salaries for Data Analyst roles.
- Concentrate on remote positions with specified salaries.
- Why? To target skills that offer job security (high demand) and financial benefits (high salaries),
offering strategic insights for career development in data analysis.
*/


WITH high_demand_skills AS
        (
        SELECT 
            sj.skill_id,
            sd.skills,
            COUNT(sj.job_id) AS total_skills
        FROM 
            job_postings_fact jp
        JOIN skills_job_dim sj ON jp.job_id = sj.job_id
        JOIN skills_dim sd ON sj.skill_id = sd.skill_id
        WHERE
            job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
        GROUP BY 
            sj.skill_id,
            sd.skills
        ),
     high_paying_skills AS
    (
    SELECT 
    sj.skill_id,
    sd.skills,
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
        sj.skill_id,
        sd.skills)

SELECT 
    hd.skill_id,
    hd.skills,
    total_skills,
    average_salary
FROM
    high_demand_skills hd
 JOIN high_paying_skills hp ON hd.skill_id = hp.skill_id
 ORDER BY
    total_skills DESC,
    average_salary DESC
LIMIT 25;