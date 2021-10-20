/* DATABASE RESTORE */
/*Create new database in commandline client/workbench to restore database  */

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| coders             |
| covid_19           |
| cpulogdata         |
| cpulogdatacopy     |
| demo               |
| demo1              |
| demo1copy          |
| demosnapshot       |
| employee           |
| information_schema |
| lms                |
| lmscopy            |
| mysql              |
| performance_schema |
| pets               |
| practice           |
| sakila             |
| salesdepartment    |
| sys                |
| world              |
+--------------------+
20 rows in set (0.02 sec)


/* create new database to restore database which is backup before */
mysql> create database covid_19_copy;
Query OK, 1 row affected (0.03 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| coders             |
| covid_19           |
| covid_19_copy      |
| cpulogdata         |
| cpulogdatacopy     |
| demo               |
| demo1              |
| demo1copy          |
| demosnapshot       |
| employee           |
| information_schema |
| lms                |
| lmscopy            |
| mysql              |
| performance_schema |
| pets               |
| practice           |
| sakila             |
| salesdepartment    |
| sys                |
| world              |
+--------------------+
21 rows in set (0.00 sec)

mysql> use covid_19_copy;
Database changed

/* check for the tables */
mysql> show tables;
Empty set (0.02 sec)


/* Open command prompt */
Microsoft Windows [Version 10.0.19043.1237]
(c) Microsoft Corporation. All rights reserved.

C:\Users\saura>

/* give the path of MYSQL which installed in machine */
C:\Users\saura>cd C:\Program Files\MySQL\MySQL Server 8.0\bin


/* Import dump file to database created in commandline client/workbench ,give path of backup file extension. Note-" < " to import */
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u root -p covid_19_copy < C:\Users\saura\MYSQLbackup\covid_19.sql
Enter password: *****


/*check for database tables in command line client/workbench after import done in cmd*/
mysql> use covid_19_copy;
Database changed
mysql> show tables;
+-------------------------+
| Tables_in_covid_19_copy |
+-------------------------+
| covid_19_india          |
| covid_vaccine_statewise |
| statewisetestingdetails |
+-------------------------+
3 rows in set (0.02 sec)

