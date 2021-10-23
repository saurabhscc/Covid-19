/*Create Table*/
CREATE TABLE Covishield (  
id INT NOT NULL,
statename VARCHAR(40) not null,
Batch_no VARCHAR(40) not null,
Supply_date Date not null   
)
PARTITION BY RANGE(YEAR(Supply_date) )  
    SUBPARTITION BY HASH(TO_DAYS(Supply_date) )  
    SUBPARTITIONS 3 (  
        PARTITION p0 VALUES LESS THAN (2020),  
        PARTITION p1 VALUES LESS THAN (2021),  
        PARTITION p2 VALUES LESS THAN MAXVALUE  
);  

/*Check partition created by table by select statement and where clause*/
SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH  
FROM INFORMATION_SCHEMA.PARTITIONS  
WHERE TABLE_SCHEMA =  'covid_19' AND TABLE_NAME = 'Covishield'; 



