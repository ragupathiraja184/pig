h1b_final = load '/user/hive/warehouse/project.db/h1b_final/*' using PigStorage('\t') as (sno:int, case_status:chararray, emp_name:chararray, soc_name:chararray, job_title:chararray, full_timeposition:chararray, prevailing_wage:long, year:chararray, worksite:chararray, longitude:double, lattitude:double);
b1 = FOREACH h1b_final GENERATE prevailing_wage,year,case_status,job_title,full_timeposition;
year1 = FILTER b1 by $1.year==2011;
certified1 = FILTER year1 by case_status=='CERTIFIED' and full_timeposition=='Y';
group1 = GROUP certified1 by job_title;
avgcertified = FOREACH group1 GENERATE group,(double)AVG($1.prevailing_wage);

certified2 = FILTER b1 by case_status=='CERTIFIED' and full_timeposition=='N';
ngroup = GROUP certified2 by job_title;
avgcertified = FOREACH ngroup GENERATE group,(double)AVG($1.prevailing_wage);

uncertified1 = FILTER b1 by case_status=='CERTIFIED-WITHDRAWN' and full_timeposition=='Y';
ungroup = GROUP uncertified1 by job_title;
avguncertified = FOREACH ungroup GENERATE group,(double)AVG($1.prevailing_wage);
uncertified2 = FILTER b1 by case_status=='CERTIFIED-WITHDRAWN' and full_timeposition=='N';
ygroup2 = GROUP uncertified2 by (job_title);
c1 = FOREACH ygroup2 GENERATE AVG($1) as total;
d1 = order c1 by $0 desc;


year2 = FILTER b1 by $1.year==2012;
certified1 = FILTER year2 by case_status=='CERTIFIED' and full_timeposition=='Y';
group1 = GROUP certified1 by job_title;
avgcertified = FOREACH group1 GENERATE group,(double)AVG($1.prevailing_wage);

certified2 = FILTER b1 by case_status=='CERTIFIED' and full_timeposition=='N';
ngroup = GROUP certified2 by job_title;
avgcertified = FOREACH ngroup GENERATE group,(double)AVG($1.prevailing_wage);

uncertified1 = FILTER b1 by case_status=='CERTIFIED-WITHDRAWN' and full_timeposition=='Y';
ungroup = GROUP uncertified1 by job_title;
avguncertified = FOREACH ungroup GENERATE group,(double)AVG($1.prevailing_wage);
uncertified2 = FILTER b1 by case_status=='CERTIFIED-WITHDRAWN' and full_timeposition=='N';
ygroup2 = GROUP uncertified2 by (job_title);
c1 = FOREACH ygroup2 GENERATE (double)AVG($1) as total;
d1 = order c1 by $0 desc;

year3 = FILTER b1 by $1.year==2013;
certified1 = FILTER year1 by case_status=='CERTIFIED' and full_timeposition=='Y';
group1 = GROUP certified1 by job_title;
avgcertified = FOREACH group1 GENERATE group,(double)AVG($1.prevailing_wage);

certified2 = FILTER b1 by case_status=='CERTIFIED' and full_timeposition=='N';
ngroup = GROUP certified2 by job_title;
avgcertified = FOREACH ngroup GENERATE group,(double)AVG($1.prevailing_wage);

uncertified1 = FILTER b1 by case_status=='CERTIFIED-WITHDRAWN' and full_timeposition=='Y';
ungroup = GROUP uncertified1 by job_title;
avguncertified = FOREACH ungroup GENERATE group,(double)AVG($1.prevailing_wage);
uncertified2 = FILTER b1 by case_status=='CERTIFIED-WITHDRAWN' and full_timeposition=='N';
ygroup2 = GROUP uncertified2 by (job_title);
c1 = FOREACH ygroup2 GENERATE (double)AVG($1) as total;
d1 = order c1 by $0 desc;
year4 = FILTER b1 by $1.year==2014;
certified1 = FILTER year1 by case_status=='CERTIFIED' and full_timeposition=='Y';
group1 = GROUP certified1 by job_title;
avgcertified = FOREACH group1 GENERATE group,(double)AVG($1.prevailing_wage);

certified2 = FILTER b1 by case_status=='CERTIFIED' and full_timeposition=='N';
ngroup = GROUP certified2 by job_title;
avgcertified = FOREACH ngroup GENERATE group,(double)AVG($1.prevailing_wage);

uncertified1 = FILTER b1 by case_status=='CERTIFIED-WITHDRAWN' and full_timeposition=='Y';
ungroup = GROUP uncertified1 by job_title;
avguncertified = FOREACH ungroup GENERATE group,(double)AVG($1.prevailing_wage);
uncertified2 = FILTER b1 by case_status=='CERTIFIED-WITHDRAWN' and full_timeposition=='N';
ygroup2 = GROUP uncertified2 by (job_title);
c1 = FOREACH ygroup2 GENERATE (double)AVG($1) as total;
d1 = order c1 by $0 desc;
year5 = FILTER b1 by $1.year==2015;
certified1 = FILTER year1 by case_status=='CERTIFIED' and full_timeposition=='Y';
group1 = GROUP certified1 by job_title;
avgcertified = FOREACH group1 GENERATE group,(double)AVG($1.prevailing_wage);

certified2 = FILTER b1 by case_status=='CERTIFIED' and full_timeposition=='N';
ngroup = GROUP certified2 by job_title;
avgcertified = FOREACH ngroup GENERATE group,(double)AVG($1.prevailing_wage);

uncertified1 = FILTER b1 by case_status=='CERTIFIED-WITHDRAWN' and full_timeposition=='Y';
ungroup = GROUP uncertified1 by job_title;
avguncertified = FOREACH ungroup GENERATE group,(double)AVG($1.prevailing_wage);
uncertified2 = FILTER b1 by case_status=='CERTIFIED-WITHDRAWN' and full_timeposition=='N';
ygroup2 = GROUP uncertified2 by (job_title);
c1 = FOREACH ygroup2 GENERATE AVG($1) as total;
d1 = order c1 by $0 desc;
year6 = FILTER b1 by year==2016;
certified1 = FILTER year1 by case_status=='CERTIFIED' and full_timeposition=='Y';
group1 = GROUP certified1 by job_title;
avgcertified = FOREACH group1 GENERATE group,(double)AVG($1.prevailing_wage);

certified2 = FILTER b1 by case_status=='CERTIFIED' and full_timeposition=='N';
ngroup = GROUP certified2 by job_title;
avgcertified = FOREACH ngroup GENERATE group,(double)AVG($1.prevailing_wage);

uncertified1 = FILTER b1 by case_status=='CERTIFIED-WITHDRAWN' and full_timeposition=='Y';
ungroup = GROUP uncertified1 by job_title;
avguncertified = FOREACH ungroup GENERATE group,(double)AVG($1.prevailing_wage);
uncertified2 = FILTER b1 by case_status=='CERTIFIED-WITHDRAWN' and full_timeposition=='N';
ygroup2 = GROUP uncertified2 by (job_title);
c1 = FOREACH ygroup2 GENERATE (double)AVG($1) as total;
d1 = order c1 by $0 desc;
dump c1;
