/*Create Table*/
CREATE TABLE Vaccines_Supply ( 
centre_id INT NOT NULL,
statename VARCHAR(40),   
State_id VARCHAR(20) NOT NULL,
dose_administered INT NOT NULL,
Covishield INT NOT NULL,
Covaxin INT NOT NULL,
SputnikV INT NOT NULL,
Supply_date DATE  PRIMARY KEY  NOT NULL,
Batch_no VARCHAR(40)NOT NULL
)   
PARTITION BY RANGE (TO_DAYS(Supply_date))(   
PARTITION p0 VALUES LESS THAN (TO_DAYS('2021-01-31')),
PARTITION p1 VALUES LESS THAN (TO_DAYS('2021-02-28')),
PARTITION p2 VALUES LESS THAN (TO_DAYS('2021-03-31')), 
PARTITION p3 VALUES LESS THAN(TO_DAYS('2021-04-30'))
);

/*Display table structure*/
describe Vaccines_Supply;

/*Using select statement */
select * from Vaccines_Supply;

/*Insert rows to table*/
Insert into Vaccines_Supply  values (1,'Andaman and Nicobar Islands',1,20000,12000,8000,0,'2021-01-15','ABC12AA');
Insert into Vaccines_Supply  values (2,'Andhra Pradesh',2,15000,8000,7000,0,'2021-02-15','ABC13AA');
Insert into Vaccines_Supply  values (3,'Assam',3,10000,3000,7000,0,'2021-02-20','ABC14AA');
Insert into Vaccines_Supply  values (4,'Delhi',4,40000,20000,19000,1000,'2021-01-15','ABC15AA');
Insert into Vaccines_Supply  values (5,'Maharashtra',5,50000,40000,10000,0,'2021-01-30','ABC16AA');
Insert into Vaccines_Supply  values (1,'Andaman and Nicobar Islands',1,13000,5000,8000,0,'2021-03-11','ABD12AA');
Insert into Vaccines_Supply  values (2,'Andhra Pradesh',2,18000,10000,8000,0,'2021-03-23','ABD13AA');
Insert into Vaccines_Supply  values (3,'Assam',3,4000,2000,2000,0,'2021-04-04','ABD14AA');
Insert into Vaccines_Supply  values (4,'Delhi',4,34000,19000,15000,0,'2021-04-10','ABD15AA');
Insert into Vaccines_Supply  values (5,'Maharashtra',5,170000,100000,50000,20000,'2021-04-15','ABD16AA');

/*Check partition created by table by select statement and where clause*/
SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH  
FROM INFORMATION_SCHEMA.PARTITIONS  
WHERE TABLE_SCHEMA = 'covid_19' AND TABLE_NAME = 'Vaccines_Supply';  

/*explain statement */
EXPLAIN select * from covid_19.Vaccines_Supply;

/*explain statement using where clause */
EXPLAIN select * from covid_19.Vaccines_Supply where Batch_no = 'ABC14AA';

/*DROP  Partition if not required ,suppose its p3 */
ALTER TABLE Vaccines_Supply TRUNCATE PARTITION p3;


