/*primary key and foreign keys*/

mysql> CREATE TABLE Persons (
    ->     ID int NOT NULL,
    ->     LastName varchar(255) NOT NULL,
    ->     FirstName varchar(255),
    ->     Age int
    -> );
Query OK, 0 rows affected (0.25 sec)

mysql> describe persons;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int          | NO   |     | NULL    |       |
| LastName  | varchar(255) | NO   |     | NULL    |       |
| FirstName | varchar(255) | YES  |     | NULL    |       |
| Age       | int          | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.04 sec)

mysql> ALTER TABLE Persons
    -> ADD PRIMARY KEY (ID);
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe persons;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int          | NO   | PRI | NULL    |       |
| LastName  | varchar(255) | NO   |     | NULL    |       |
| FirstName | varchar(255) | YES  |     | NULL    |       |
| Age       | int          | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> drop table persons;
Query OK, 0 rows affected (0.10 sec)


mysql> CREATE TABLE Persons (
    ->     ID int NOT NULL ,
    ->     LastName varchar(255) NOT NULL,
    ->     FirstName varchar(255),
    ->     Age int
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> describe persons;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int          | NO   |     | NULL    |       |
| LastName  | varchar(255) | NO   |     | NULL    |       |
| FirstName | varchar(255) | YES  |     | NULL    |       |
| Age       | int          | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.04 sec)

mysql> alter table persons add person_id int auto_increment primary key;
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe persons;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| ID        | int          | NO   |     | NULL    |                |
| LastName  | varchar(255) | NO   |     | NULL    |                |
| FirstName | varchar(255) | YES  |     | NULL    |                |
| Age       | int          | YES  |     | NULL    |                |
| person_id | int          | NO   | PRI | NULL    | auto_increment |
+-----------+--------------+------+-----+---------+----------------+
5 rows in set (0.04 sec)

mysql> drop table persons;
Query OK, 0 rows affected (0.07 sec)

mysql> CREATE TABLE Persons (
    ->     ID int NOT NULL ,
    ->     LastName varchar(255) NOT NULL,
    ->     FirstName varchar(255),
    ->     Age int
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> describe persons;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int          | NO   |     | NULL    |       |
| LastName  | varchar(255) | NO   |     | NULL    |       |
| FirstName | varchar(255) | YES  |     | NULL    |       |
| Age       | int          | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.02 sec)

mysql> ALTER TABLE Persons
    -> ADD CONSTRAINT PK_Person PRIMARY KEY (ID);
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe persons;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int          | NO   | PRI | NULL    |       |
| LastName  | varchar(255) | NO   |     | NULL    |       |
| FirstName | varchar(255) | YES  |     | NULL    |       |
| Age       | int          | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.04 sec)

mysql> drop table persons;
Query OK, 0 rows affected (0.11 sec)


mysql> CREATE TABLE Persons (
    ->     ID int NOT NULL,
    ->     LastName varchar(255) NOT NULL,
    ->     FirstName varchar(255),
    ->     Age int
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> describe persons;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int          | NO   |     | NULL    |       |
| LastName  | varchar(255) | NO   |     | NULL    |       |
| FirstName | varchar(255) | YES  |     | NULL    |       |
| Age       | int          | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.03 sec)


mysql> alter table persons add CONSTRAINT persons_pk  primary key (id);
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe persons;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| ID        | int          | NO   | PRI | NULL    |       |
| LastName  | varchar(255) | NO   |     | NULL    |       |
| FirstName | varchar(255) | YES  |     | NULL    |       |
| Age       | int          | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.03 sec)
mysql> CREATE TABLE Orders (
    ->     OrderID int NOT NULL,
    ->     OrderNumber int NOT NULL,
    ->     PersonID int,
    ->     PRIMARY KEY (OrderID),
    ->     FOREIGN KEY (PersonID) REFERENCES Persons(id)
    -> );
Query OK, 0 rows affected (0.21 sec)

mysql> describe orders;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| OrderID     | int  | NO   | PRI | NULL    |       |
| OrderNumber | int  | NO   |     | NULL    |       |
| PersonID    | int  | YES  | MUL | NULL    |       |
+-------------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> drop table orders;
Query OK, 0 rows affected (0.10 sec)

mysql> CREATE TABLE Orders (
    ->     OrderID int NOT NULL,
    ->     OrderNumber int NOT NULL,
    ->     PersonID int,
    ->     PRIMARY KEY (OrderID)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> describe orders;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| OrderID     | int  | NO   | PRI | NULL    |       |
| OrderNumber | int  | NO   |     | NULL    |       |
| PersonID    | int  | YES  |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
3 rows in set (0.03 sec)

mysql> ALTER TABLE Orders
    -> ADD FOREIGN KEY (PersonID) REFERENCES Persons(id);
Query OK, 0 rows affected (0.23 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe orders;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| OrderID     | int  | NO   | PRI | NULL    |       |
| OrderNumber | int  | NO   |     | NULL    |       |
| PersonID    | int  | YES  | MUL | NULL    |       |
+-------------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> drop table orders;
Query OK, 0 rows affected (0.10 sec)

mysql> CREATE TABLE Orders (
    ->     OrderID int NOT NULL,
    ->     OrderNumber int NOT NULL,
    ->     PersonID int,
    ->     PRIMARY KEY (OrderID)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> describe orders;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| OrderID     | int  | NO   | PRI | NULL    |       |
| OrderNumber | int  | NO   |     | NULL    |       |
| PersonID    | int  | YES  |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> ALTER TABLE Orders
    -> ADD CONSTRAINT FK_PersonOrder
    -> FOREIGN KEY (PersonID) REFERENCES Persons(id);
Query OK, 0 rows affected (0.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe orders;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| OrderID     | int  | NO   | PRI | NULL    |       |
| OrderNumber | int  | NO   |     | NULL    |       |
| PersonID    | int  | YES  | MUL | NULL    |       |
+-------------+------+------+-----+---------+-------+
3 rows in set (0.02 sec)

mysql> drop table orders;
Query OK, 0 rows affected (0.09 sec)

mysql> CREATE TABLE Orders (
    ->     OrderID int NOT NULL,
    ->     OrderNumber int NOT NULL,
    ->     PersonID int
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> describe orders;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| OrderID     | int  | NO   |     | NULL    |       |
| OrderNumber | int  | NO   |     | NULL    |       |
| PersonID    | int  | YES  |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
3 rows in set (0.02 sec)


mysql> alter table orders add primary key (OrderID);
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe orders;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| OrderID     | int  | NO   | PRI | NULL    |       |
| OrderNumber | int  | NO   |     | NULL    |       |
| PersonID    | int  | YES  |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)


mysql> alter table orders add FOREIGN KEY (PersonID) REFERENCES Persons(id);
Query OK, 0 rows affected (0.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe orders;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| OrderID     | int  | NO   | PRI | NULL    |       |
| OrderNumber | int  | NO   |     | NULL    |       |
| PersonID    | int  | YES  | MUL | NULL    |       |
+-------------+------+------+-----+---------+-------+
3 rows in set (0.02 sec)

mysql> CREATE TABLE Orders (
    ->     OrderID int NOT NULL,
    ->     OrderNumber int NOT NULL,
    -> PRIMARY KEY (OrderID)
    -> );
ERROR 1050 (42S01): Table 'orders' already exists
mysql> drop table orders;
Query OK, 0 rows affected (0.10 sec)

mysql> CREATE TABLE Orders (
    ->     OrderID int NOT NULL,
    ->     OrderNumber int NOT NULL,
    -> PRIMARY KEY (OrderID)
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> describe orders;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| OrderID     | int  | NO   | PRI | NULL    |       |
| OrderNumber | int  | NO   |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
2 rows in set (0.02 sec)

mysql> alter table orders
    -> add  PersonID int,
    -> ADD FOREIGN KEY (PersonID) REFERENCES Persons(id);
Query OK, 0 rows affected (0.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe orders;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| OrderID     | int  | NO   | PRI | NULL    |       |
| OrderNumber | int  | NO   |     | NULL    |       |
| PersonID    | int  | YES  | MUL | NULL    |       |
+-------------+------+------+-----+---------+-------+
3 rows in set (0.03 sec)

mysql> drop table orders;
Query OK, 0 rows affected (0.09 sec)

mysql> CREATE TABLE Orders (
    ->     OrderID int NOT NULL,
    ->     OrderNumber int NOT NULL,
    -> PRIMARY KEY (OrderID)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> describe orders;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| OrderID     | int  | NO   | PRI | NULL    |       |
| OrderNumber | int  | NO   |     | NULL    |       |
+-------------+------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> alter table orders
    -> add  PersonID int,
    -> ADD CONSTRAINT FOREIGN KEY (PersonID) REFERENCES Persons(id);
Query OK, 0 rows affected (0.18 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe orders;
+-------------+------+------+-----+---------+-------+
| Field       | Type | Null | Key | Default | Extra |
+-------------+------+------+-----+---------+-------+
| OrderID     | int  | NO   | PRI | NULL    |       |
| OrderNumber | int  | NO   |     | NULL    |       |
| PersonID    | int  | YES  | MUL | NULL    |       |
+-------------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> create table Employee(
    -> EmployeeID int not null,
    -> LastName varchar(255),
    -> FirstName varchar(255),
    -> Address varchar(255),
    -> City varchar(255)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> describe Employee;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| EmployeeID | int          | NO   |     | NULL    |       |
| LastName   | varchar(255) | YES  |     | NULL    |       |
| FirstName  | varchar(255) | YES  |     | NULL    |       |
| Address    | varchar(255) | YES  |     | NULL    |       |
| City       | varchar(255) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
5 rows in set (0.02 sec)

mysql> insert into Employee values(1,'sam','neel','jmroad','mumbai');
Query OK, 1 row affected (0.03 sec)
insert into Employee values(2,'sammy','rowling','Mkroad','mumbai');
Query OK, 1 row affected (0.01 sec)
insert into Employee values(3,'samy','king','Mkstreet','mumbai');
Query OK, 1 row affected (0.01 sec)

mysql> select * from Employee;
+------------+----------+-----------+----------+--------+
| EmployeeID | LastName | FirstName | Address  | City   |
+------------+----------+-----------+----------+--------+
|          1 | sam      | neel      | jmroad   | mumbai |
|          2 | sammy    | rowling   | Mkroad   | mumbai |
|          3 | samy     | king      | Mkstreet | mumbai |
+------------+----------+-----------+----------+--------+
3 rows in set (0.00 sec)

mysql> alter table Employee add id int auto_increment primary key;
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe Employee;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| EmployeeID | int          | NO   |     | NULL    |                |
| LastName   | varchar(255) | YES  |     | NULL    |                |
| FirstName  | varchar(255) | YES  |     | NULL    |                |
| Address    | varchar(255) | YES  |     | NULL    |                |
| City       | varchar(255) | YES  |     | NULL    |                |
| id         | int          | NO   | PRI | NULL    | auto_increment |
+------------+--------------+------+-----+---------+----------------+
6 rows in set (0.02 sec)

mysql> select * from Employee;
+------------+----------+-----------+----------+--------+----+
| EmployeeID | LastName | FirstName | Address  | City   | id |
+------------+----------+-----------+----------+--------+----+
|          1 | sam      | neel      | jmroad   | mumbai |  1 |
|          2 | sammy    | rowling   | Mkroad   | mumbai |  2 |
|          3 | samy     | king      | Mkstreet | mumbai |  3 |
+------------+----------+-----------+----------+--------+----+
3 rows in set (0.00 sec)