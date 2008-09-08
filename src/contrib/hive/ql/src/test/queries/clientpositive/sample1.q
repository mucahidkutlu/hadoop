CREATE TABLE dest1(key INT, value STRING, dt STRING, hr STRING);

-- no input pruning, no sample filter
INSERT OVERWRITE TABLE dest1 SELECT s.*
FROM srcpart TABLESAMPLE (BUCKET 1 OUT OF 1) s
WHERE s.ds='2008-04-08' and s.hr='11';

SELECT dest1.* FROM dest1;