inputFile = LOAD 'hdfs:///user/root/episodeV_dialouges.txt' USING PigStorage('\t') AS (name:chararray,line:chararray);
groupByName = GROUP inputFile By name;
names = FOREACH groupByName GENERATE $0 as name, COUNT($1) as no_Of_Lines;
nameOrdered = ORDER names BY no_Of_Lines DESC;
STORE nameOrdered INTO 'hdfs:///user/root/outputs/episodeVoutput' USING PigStorage('\t');