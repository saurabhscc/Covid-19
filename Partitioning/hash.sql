/*Alter the table to perform hash partition*/
ALTER TABLE StateZone
PARTITION BY HASH(State_id)
PARTITIONS 2;

/*Check partition created by table by select statement and where clause*/
SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH  
FROM INFORMATION_SCHEMA.PARTITIONS  
WHERE TABLE_SCHEMA =  'covid_19' AND TABLE_NAME = 'StateZone'; 