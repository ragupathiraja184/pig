h1b_final = load '/home/hduser/Downloads/project' using PigStorage('\t') as (sno:int, case_status:chararray, emp_name:chararray, soc_name:chararray, job_title:chararray, full_time_pos:chararray, wage:long, year:chararray, worksite:chararray, longitude:double, lattitude:double);

filterjob = filter h1b_final by year=='2011';
--dump filjob;

groupjoints = group filterjob by $4;
  
groupc1 = foreach groupjoints generate group, COUNT(filterjob.$1) as t1;
dump groupc1;
 
filterjob = filter h1b_final by year=='2012';
--dump filjob;

groupjoints = group filterjob by $4;
  
groupc2 = foreach groupjoints generate group, COUNT(filterjob.$1) as t2;

filterjob = filter h1b_final by year=='2013';
--dump filjob;

groupjoints = group filterjob by $4;
  
groupc3 = foreach groupjoints generate group, COUNT(filterjob.$1) as t3;

filterjob = filter h1b_final by year=='2014';
--dump filjob;

groupjoints = group filterjob by $4;
  
groupc4 = foreach groupjoints generate group, COUNT(filterjob.$1) as t4;

filterjob = filter h1b_final by year=='2015';
--dump filjob;

groupjoints = group filterjob by $4;
  
groupc5 = foreach groupjoints generate group, COUNT(filterjob.$1) as t5;

filterjob = filter h1b_final by year=='2016';
--dump filjob;

groupjoints = group filterjob by $4;
  
groupc6 = foreach groupjoints generate group, COUNT(filterjob.$1) as t6;


joinallb = join groupc1 by $0 ,groupc2 by $0 ,groupc3 by $0 ,groupc4 by $0 ,groupc5 by $0 ,groupc6 by $0;
--dump jngr;

calc = foreach joinallb generate $0 , $1 , $3 ,$5 ,$7 ,$9 ,$11;

growth = foreach calc generate $0 , (float)(($2-$1)*100/$1) as a1, (float)(($3-$2)*100/$2) as a2,(float)(($4-$3)*100/$3) as a3, (float)(($5-$4)*100/$4) as a4, (float)(($6-$5)*100/$5) as a5;

avggrowth = foreach growth generate $0 , ($1+$2+$3+$4+$5)/5 as a6;

top5 = limit (order avggrowth by $1 desc) 5;
dump top5;
store top5 into '/niit2/1boutput.txt';








