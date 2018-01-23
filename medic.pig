--medic = LOAD '/home/hduser/Downloads/medical' USING PigStorage('	') AS ( name, department, salary:double);

medic = LOAD '/home/hduser/Downloads/medical' USING PigStorage('\t') AS ( name:chararray, department:chararray, salary:double);

medic1 = GROUP medic by name;

medic2 = FOREACH medic1 GENERATE $0,AVG($1.salary);

dump medic2;
