/*create tables */
mysql> create table categories(
    -> categoryId int auto_increment primary key,
    -> categoryName varchar (255) not null );
Query OK, 0 rows affected (0.17 sec)

mysql> create table medicine(
    -> sno int auto_increment primary key,
    -> medicineId varchar(255) not null,
    -> medicineBrand varchar(255) not null,
    -> medicineName varchar(255) not null,
    -> categoryId int,
    -> constraint fk_category foreign key (categoryId) references categories(categoryId),
    -> medicineInDate date null,
    -> medicinePrice Int not null ,
    -> constraint c_price check (medicinePrice >= 1 AND medicinePrice <=500),
    -> medicinestate varchar(20) ,
    -> constraint c_state check (medicinestate in ('Gujarat','Maharashtra','Uttarakhand','himachal pradesh','Punjab','Telangana','Karnataka')),
    -> WHOapproved char(1) ,
    -> constraint c_WHOapproved check (WHOapproved in ('y','Y','n','N') )
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> CREATE TABLE sell (
    ->   sno int NOT NULL AUTO_INCREMENT,
    ->   medicineId varchar(20) DEFAULT NULL,
    ->   soldNos int DEFAULT NULL,
    ->   soldTime datetime DEFAULT NULL,
    ->   PRIMARY KEY (sno)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> CREATE TABLE store (
    ->   sno int NOT NULL AUTO_INCREMENT,
    ->   medicineId varchar(20) DEFAULT NULL,
    ->   quantity int DEFAULT NULL,
    ->   PRIMARY KEY (sno)
    -> );
Query OK, 0 rows affected (0.07 sec)

/*insert rows*/
insert into categories (categoryName) values('child');
insert into categories (categoryName) values('teen');
insert into categories (categoryName) values('adult');
insert into categories (categoryName) values('severe ill');
insert into categories (categoryName) values('newborn');
insert into covid_19.medicine(medicineId,medicineBrand,medicineName,categoryId,medicineInDate,medicinePrice,medicinestate,WHOapproved )values(1, 'dr.reddy', 'combiflam',1, '2021-11-01', 5, 'himachal pradesh','Y');
insert into covid_19.medicine(medicineId,medicineBrand,medicineName,categoryId,medicineInDate,medicinePrice,medicinestate,WHOapproved ) values(2, 'dr.reddy', 'combiflam',1, '2021-11-02', 500, 'Gujarat','Y');
insert into covid_19.medicine(medicineId,medicineBrand,medicineName,categoryId,medicineInDate,medicinePrice,medicinestate,WHOapproved )values(3,'maceleiods', 'gryluntus',3, '2021-11-01', 80, 'Maharashtra','Y');

/*used constaint check while creating table*/
insert into covid_19.medicine(medicineId,medicineBrand,medicineName,categoryId,medicineInDate,medicinePrice,medicinestate,WHOapproved ) values(4,'sunpharma', 'cov-500',4, '2021-11-04', 50, 'Uttharakhand','Y');
ERROR 3819 (HY000): Check constraint 'c_state' is violated.

insert into covid_19.medicine(medicineId,medicineBrand,medicineName,categoryId,medicineInDate,medicinePrice,medicinestate,WHOapproved )values(4,'sunpharma', 'cov-500',4, '2021-11-04', 150, 'Uttarakhand','Y');
insert into covid_19.medicine(medicineId,medicineBrand,medicineName,categoryId,medicineInDate,medicinePrice,medicinestate,WHOapproved )values(5,'pfizer', 'fab-flu',5, '2021-11-05', 490, 'Maharashtra','Y');
insert into sell (sno,medicineId,soldNos,soldTime) values (1,'abc',100,'2021-11-01');
insert into sell (sno,medicineId,soldNos,soldTime) values (2,'adc',100,'2021-11-02');
insert into sell (sno,medicineId,soldNos,soldTime) values (3,'adc',130,'2021-11-02');
insert into sell (sno,medicineId,soldNos,soldTime) values (4,'ade',140,'2021-11-03');
insert into sell (sno,medicineId,soldNos,soldTime) values (5,'aae',140,'2021-11-04');

/*insert rows*/
insert into store (sno,medicineId,quantity) values(1,'abc',5000);
insert into store (sno,medicineId,quantity) values(2,'adc',4500);
insert into store (sno,medicineId,quantity) values(3,'adc',4500);
insert into store (sno,medicineId,quantity) values(4,'ade',1900);
insert into store (sno,medicineId,quantity) values(5,'aae',1950);


/*check the constraints for table*/
mysql> select * from information_schema.table_constraints where table_name='medicine';
+--------------------+-------------------+-----------------+--------------+------------+-----------------+----------+
| CONSTRAINT_CATALOG | CONSTRAINT_SCHEMA | CONSTRAINT_NAME | TABLE_SCHEMA | TABLE_NAME | CONSTRAINT_TYPE | ENFORCED |
+--------------------+-------------------+-----------------+--------------+------------+-----------------+----------+
| def                | covid_19          | PRIMARY         | covid_19     | medicine   | PRIMARY KEY     | YES      |
| def                | covid_19          | fk_category     | covid_19     | medicine   | FOREIGN KEY     | YES      |
| def                | covid_19          | c_price         | covid_19     | medicine   | CHECK           | YES      |
| def                | covid_19          | c_state         | covid_19     | medicine   | CHECK           | YES      |
| def                | covid_19          | c_WHOapproved   | covid_19     | medicine   | CHECK           | YES      |
+--------------------+-------------------+-----------------+--------------+------------+-----------------+----------+
5 rows in set (0.01 sec)

/*using clauses*/
mysql> select * from medicine order by categoryId ASC;
+-----+------------+---------------+--------------+------------+----------------+---------------+------------------+-------------+
| sno | medicineId | medicineBrand | medicineName | categoryId | medicineInDate | medicinePrice | medicinestate    | WHOapproved |
+-----+------------+---------------+--------------+------------+----------------+---------------+------------------+-------------+
|   1 | 1          | dr.reddy      | combiflam    |          1 | 2021-11-01     |             5 | himachal pradesh | Y           |
|   2 | 2          | dr.reddy      | combiflam    |          1 | 2021-11-02     |           500 | Gujarat          | Y           |
|   3 | 3          | maceleiods    | gryluntus    |          3 | 2021-11-01     |            80 | Maharashtra      | Y           |
|   4 | 4          | sunpharma     | cov-500      |          4 | 2021-11-04     |           150 | Uttarakhand      | Y           |
|   5 | 5          | pfizer        | fab-flu      |          5 | 2021-11-05     |           490 | Maharashtra      | Y           |
+-----+------------+---------------+--------------+------------+----------------+---------------+------------------+-------------+
5 rows in set (0.00 sec)

select * from medicine order by categoryId DESC;

select * from medicine group by categoryId ;

select * from medicine where medicinePrice between 1 and 50 ;

select * from medicine group by categoryId HAVING medicinePrice > 20;

/*complex queries using join,groupby */
mysql> select t1.medicinebrand, t1.medicineName, t1.medicinePrice as price,
    -> t2.quantity as store_quantity,
    -> (select sum(t3.soldNos)) as sold , (t2.quantity+sum(t3.soldNos)) as total_medicines
    -> from medicine t1
    -> left join store t2 on  t1.medicineId=t2.medicineId
    -> inner join sell t3 on t2.medicineId=t3.medicineId
    -> GROUP BY t1.medicineId;

mysql> select t1.medicinebrand, t1.medicineName, t1.medicinePrice as price, t2.quantity as store_quantity,
    -> (select sum(t3.soldNos) ) as sold
    -> from medicine t1
    -> left join store t2 on  t1.medicineId=t2.medicineId
    -> inner join sell t3 on t2.medicineId=t3.medicineId
    -> GROUP BY t1.medicineId
    -> HAVING sum(t3.soldNos) >10;

mysql> select t1.medicinebrand, t1.medicineName, t1.medicinePrice as price, t2.quantity as store_quantity,
    -> (select sum(t3.soldNos) ) as sold
    -> from medicine t1
    -> left join store t2 on  t1.medicineId=t2.medicineId
    -> inner join sell t3 on t2.medicineId=t3.medicineId
    -> GROUP BY t1.medicineBrand
    -> HAVING sum(t3.soldNos) <1;




