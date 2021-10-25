/* DATABASE BACKUP */
/* Open command prompt */

Microsoft Windows [Version 10.0.19043.1237]
(c) Microsoft Corporation. All rights reserved.

C:\Users\saura>

/* give the path of MYSQL which installed in machine */
C:\Users\saura> cd C:\Program Files\MySQL\MySQL Server 8.0\bin


/* use mysqldump tool to export the database,give path of Backupfolder with sql extension 
 * -R flag backup all tiggers,store procedure and function
 * Note-" > " to export
 */
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump -u root -p -R covid_19 > C:\Users\saura\MYSQLbackup\All_opcovid.sql
Enter password: **********

