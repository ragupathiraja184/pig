project1 = LOAD '/user/hive/warehouse/project.db/h1b_final/*' USING PigStorage('\t') AS (s_no:INT, case_status:chararray, employer_name:chararray, soc_name:chararray, job_title:chararray, full_timeposition:chararray, prevailing_wage:INT,year:INT, worksite:chararray, longitude:DOUBLE, latitude:DOUBLE);
t1 = group project1 by $4;
total1 = FOREACH t1 GENERATE group,COUNT($1.job_title);
s1 = FOREACH project1 GENERATE job_title,case_status;
s2 = FILTER s1 by case_status=='CERTIFIED';
groups2 = GROUP s2 by $0;
certified_count = FOREACH groups2 GENERATE group,COUNT($1.job_title) as total;
s3 = FILTER s1 by case_status=='CERTIFIED-WITHDRAWN';

groupby2 = GROUP s3 by $0;


uncertified_count = FOREACH groupby2 GENERATE group,COUNT($1.job_title) as total1;

join1 = join certified_count by $0,uncertified_count by $0,total1 by $0;
--dump join1;
--av1 = join join1 by $0,total1 by $0;
--dump av1;
avg1 = FOREACH join1 GENERATE FLATTEN ($0),FLATTEN ((float)($1+$3)/($5)*100), FLATTEN ($5);
--dump avg1;
avg2 = FILTER avg1 by $1>70 and $2>1000;
dump avg2;
STORE avg2 INTO '/home/hduser/out11' using PigStorage('\t');
