/*Create Table*/
CREATE TABLE Covid_Vaccine (   
State_id VARCHAR(55),  
statename VARCHAR(40),   
vaccine_name VARCHAR(10)) 
PARTITION BY LIST COLUMNS(State_id) (   
PARTITION pcovisheild VALUES IN('A1', 'A2', 'A3'),   
PARTITION pcovaxin VALUES IN('B1', 'B2', 'B3'),   
PARTITION pSputnikV VALUES IN ('C1', 'C2', 'C3'));  


/*Check partition created by table by select statement and where clause*/
SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH  
FROM INFORMATION_SCHEMA.PARTITIONS  
WHERE TABLE_SCHEMA =  'covid_19' AND TABLE_NAME = 'Covid_Vaccine';


