--2.a)
project1 = LOAD '/home/hduser/Downloads/project' USING PigStorage('\t') AS (s_no:INT, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_timeposition:chararray, prevailing_wage:INT,year:INT, worksite:chararray, longitude:DOUBLE, latitude:DOUBLE);

a = FOREACH project1 GENERATE year,worksite,job_title;

b = FILTER a BY job_title=='DATA ENGINEER';

c = GROUP b BY (year,worksite);

d = FOREACH c GENERATE flatten((group), COUNT($1.job_title));
dump d;

--select count(job_title) as total,year,worksite from h1b_final where job_title=='DATA ENGINEER' group by year,job_title,worksite order by otal --DESC;
--select count(case_status) as total,worksite from h1b_final where case_status=='CERTIFIED' and year==2011 group by year,case_status order by total limit 10;

--p1 = LOAD '/home/hduser/total_count.txt/part-r-00000' USING PigStorage() AS (case_status:chararray,count:INT);

--total = group p1 all;
