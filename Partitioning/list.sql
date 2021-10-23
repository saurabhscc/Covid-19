/*Create Table*/
CREATE TABLE StateZone(
    State_id INT PRIMARY KEY NOT NULL,   
    statename VARCHAR(40),  
    dose_administered INT NOT NULL,      
    Supply_date DATE NOT NULL,   
    Batch_no VARCHAR(40)NOT NULL  
)  
PARTITION BY LIST(State_id) (   
PARTITION pEast VALUES IN (3,6,9),   
PARTITION pWest VALUES IN (5,7,10),   
PARTITION pNorth VALUES IN (4,8,11),   
PARTITION pSouth VALUES IN (1,2,12)
);  

/*Display table structure*/
describe StateZone;

/*Using select statement */
select * from StateZone;

/*Insert rows to table*/
Insert into StateZone  values (1,'Andaman and Nicobar Islands',20000,'2021-01-15','ABC12AA');
Insert into StateZone  values (2,'Andhra Pradesh',15000,'2021-02-15','ABC13AA');
Insert into StateZone  values (3,'Assam',10000,'2021-02-20','ABC14AA');
Insert into StateZone  values (4,'Delhi',40000,'2021-01-15','ABC15AA');
Insert into StateZone  values (5,'Maharashtra',50000,'2021-01-30','ABC16AA');
Insert into StateZone  values (6,'WestBengal',13000,'2021-03-11','ABD12AA');
Insert into StateZone  values (7,'Gujarat',18000,'2021-03-23','ABD13AA');
Insert into StateZone  values (8,'Ladakh',4000,'2021-04-04','ABD14AA');
Insert into StateZone  values (9,'ArunachalPradesh',34000,'2021-04-10','ABD15AA');
Insert into StateZone  values (10,'Karnataka',170000,'2021-04-15','ABD16AA');
Insert into StateZone  values (11,'Jammu',170000,'2021-04-15','ABD17AA');
Insert into StateZone  values (12,'Kerala',470000,'2021-04-15','ABD18AA');



/*Check partition created by table by select statement and where clause*/
SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS, AVG_ROW_LENGTH, DATA_LENGTH  
FROM INFORMATION_SCHEMA.PARTITIONS  
WHERE TABLE_SCHEMA =  'covid_19' AND TABLE_NAME = 'StateZone'; 