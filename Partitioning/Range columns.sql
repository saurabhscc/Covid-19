/*Create Table*/
CREATE TABLE Vaccines ( 
centre_id INT NOT NULL,
statename VARCHAR(40),   
State_id VARCHAR(20) NOT NULL,
dose_administered INT NOT NULL,
Covishield INT NOT NULL,
Covaxin INT NOT NULL,
SputnikV INT NOT NULL,
Supply_date DATE  NOT NULL,
Batch_no VARCHAR(40)NOT NULL
)   
PARTITION BY RANGE COLUMNS(dose_administered,Covishield)(
PARTITION p0 VALUES LESS THAN (50000,5000),
PARTITION p1 VALUES LESS THAN (100000,25000),
PARTITION p2 VALUES LESS THAN (150000,50000)
);

/*Insert rows to table*/
Insert into Vaccines values (1,'Andaman and Nicobar Islands',1,20000,12000,8000,0,'2021-01-15','ABC12AA');
Insert into Vaccines values (2,'Andhra Pradesh',2,15000,8000,7000,0,'2021-02-15','ABC13AA');
Insert into Vaccines values (3,'Assam',3,10000,3000,7000,0,'2021-02-20','ABC14AA');
Insert into Vaccines values (4,'Delhi',4,40000,20000,19000,1000,'2021-01-15','ABC15AA');
Insert into Vaccines values (5,'Maharashtra',5,50000,40000,10000,0,'2021-01-30','ABC16AA');
Insert into Vaccines values (6,'WestBengal',6,13000,5000,8000,0,'2021-03-11','ABD12AA');
Insert into Vaccines values (7,'Gujarat',7,18000,10000,8000,0,'2021-03-23','ABD13AA');
Insert into Vaccines values (8,'Ladakh',8,4000,2000,2000,0,'2021-04-04','ABD14AA');


/*Check partition created by table by select statement and where clause*/
SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH  
FROM INFORMATION_SCHEMA.PARTITIONS  
WHERE TABLE_SCHEMA =  'covid_19' AND TABLE_NAME = 'Vaccines'; 