--Load input data from HDFS
inputFile = LOAD 'hdfs:///user/root/file01.txt' AS (line);

--TOkenize each word in the file
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) AS word;

--Combine the words that we got
groupedWords = GROUP words BY word;

--Count the occurence of each word
countedWords = FOREACH groupedWords GENERATE group, COUNT(words);

--Store the result on the HDFS
STORE countedWords INTO 'hdfs:///user/root/results';

