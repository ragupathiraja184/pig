select year,job_title,count(job_title) as count from h1b_final where year==2011 and case_status=='CERTIFIED' group by year,job_title order by count desc limit 10;
