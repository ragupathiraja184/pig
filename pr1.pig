project1 = LOAD '/home/hduser/Downloads/project' USING PigStorage('\t') AS (s_no:INT, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_timeposition:chararray, prevailing_wage:INT,year:INT, worksite:chararray, longitude:DOUBLE, latitude:DOUBLE);

1.a) {p1 = FOREACH project1 GENERATE job_title,year; where EqualsIgnoreCase(job_title,'DATAENGINEER')=='true';

     p2 = FILTER p1 BY year==2016 AND job_title=='DATA ENGINEER';

      p3 = GROUP p2 BY year,worksite,job_title;

      p4 = FOREACH p3 GENERATE $0,COUNT($1.job_title) AS total,$1.job_title;
(2012,32,{(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER)})
}
(2011,18,{(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER)})

(2013,41,{(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER)})

(2014,89,{(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER),(DATA ENGINEER)})

2015-160
2016-251
the data engineer job positions are increased yearly;
1.b)


