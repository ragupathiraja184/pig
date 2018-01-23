--pig -x local -p inp=/home/hduser/input.txt -f param.pig

w1 = LOAD '$inp' USING TextLoader() AS (words:chararray);
--dump w1;


w2 = FOREACH w1 GENERATE FLATTEN(TOKENIZE(words));
--dump w2;
w3 = GROUP w2 by $0;
--dump w3;
c1 = FOREACH w3 GENERATE $0, COUNT($1);

dump c1;
