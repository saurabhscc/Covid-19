/* Open command prompt */
Microsoft Windows [Version 10.0.19043.1237]
(c) Microsoft Corporation. All rights reserved.

/* Give the path of MYSQL which installed in machine */
C:\Users\saura>cd C:\Program Files\MySQL\MySQL Server 8.0\bin


/* Snapshot demo database,give path of Backupfolder with file with .db extension */
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p --databases covid_19 --master-data >C:\Users\saura\MYSQLbackup\covid_19.db
Enter password: *****


/* Snapshot demo database,give path of Backupfolder with file with .sql extension */
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p --databases covid_19 --master-data >C:\Users\saura\MYSQLbackup\covid_19snapshot.sql
Enter password: *****

/* Snapshot demo database,give path of Backupfolder with file with .sql extension(excluded --master-data) */
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p --databases covid_19 >C:\Users\saura\MYSQLbackup\covid_19_snapshot.sql
Enter password: *****
