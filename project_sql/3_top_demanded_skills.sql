/*
Question: What are the most in-demand skills for the data analyst role?
- Find the total number of remote job postings per skill
- Display the top 5 skills by their demand in remote jobs.
- Include skill ID, name and total number of postings requiring the skill.
*/


SELECT 
    sj.skill_id,
    sd.skills,
    count(jp.job_id) AS total_job_postings,
    rank() over(order by count(jp.job_id) desc) as rank
FROM 
    job_postings_fact jp
JOIN skills_job_dim sj ON jp.job_id = sj.job_id
JOIN skills_dim sd ON sj.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY 
    sj.skill_id,
    sd.skills
ORDER BY total_job_postings DESC;


--subquery to limit to top 5

SELECT *
FROM
    (
    SELECT 
        sj.skill_id,
        sd.skills,
        count(jp.job_id) AS total_job_postings,
        rank() over(order by count(jp.job_id) desc) as rank
    FROM 
        job_postings_fact jp
    JOIN skills_job_dim sj ON jp.job_id = sj.job_id
    JOIN skills_dim sd ON sj.skill_id = sd.skill_id
    WHERE
        job_title_short = 'Data Analyst'
    GROUP BY 
        sj.skill_id,
        sd.skills
    --ORDER BY total_job_postings DESC
    )
WHERE rank <= 5;

