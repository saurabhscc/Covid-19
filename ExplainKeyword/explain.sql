mysql> explain select * from covid_19_india;
+----+-------------+----------------+------------+------+---------------+------+---------+------+-------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows  | filtered | Extra |
+----+-------------+----------------+------------+------+---------------+------+---------+------+-------+----------+-------+
|  1 | SIMPLE      | covid_19_india | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 18188 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+---------------+------+---------+------+-------+----------+-------+
1 row in set, 1 warning (0.02 sec)

mysql> explain select * from statewisetestingdetails;
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+-------+----------+-------+
| id | select_type | table                   | partitions | type | possible_keys | key  | key_len | ref  | rows  | filtered | Extra |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+-------+----------+-------+
|  1 | SIMPLE      | statewisetestingdetails | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 16204 |   100.00 | NULL  |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+-------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select * from covid_vaccine_statewise;
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table                   | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | covid_vaccine_statewise | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 7678 |   100.00 | NULL  |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.02 sec)

mysql> explain select * from confirmed_detail;
+----+-------------+------------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table            | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+------------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | confirmed_detail | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    2 |   100.00 | NULL  |
+----+-------------+------------------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.02 sec)

mysql> explain select * from confirmed_info;
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | confirmed_info | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   10 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.02 sec)

mysql> explain select * from confirmed_mh_cases;
+----+-------------+----------------+------------+------+---------------+------+---------+------+-------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows  | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+-------+----------+-------------+
|  1 | SIMPLE      | covid_19_india | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 18188 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+-------+----------+-------------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select * from covid_vaccine;
+----+-------------+---------------+--------------------------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table         | partitions                     | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+---------------+--------------------------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | covid_vaccine | pcovisheild,pcovaxin,pSputnikV | ALL  | NULL          | NULL | NULL    | NULL |    1 |   100.00 | NULL  |
+----+-------------+---------------+--------------------------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select * from statezone;
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table     | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | statezone | p0,p1      | ALL  | NULL          | NULL | NULL    | NULL |   12 |   100.00 | NULL  |
+----+-------------+-----------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select * from covishield;
+----+-------------+------------+----------------------------------------------------------------------------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table      | partitions                                                                       | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+------------+----------------------------------------------------------------------------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | covishield | p0_p0sp0,p0_p0sp1,p0_p0sp2,p1_p1sp0,p1_p1sp1,p1_p1sp2,p2_p2sp0,p2_p2sp1,p2_p2sp2 | ALL  | NULL          | NULL | NULL    | NULL |    1 |   100.00 | NULL  |
+----+-------------+------------+----------------------------------------------------------------------------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.02 sec)

mysql> explain select * from covishield_vaccine;
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table                   | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | covid_vaccine_statewise | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 7678 |    10.00 | Using where |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select * from mh_inout_info;
+----+-------------+---------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table         | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+---------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | mh_inout_info | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    4 |   100.00 | NULL  |
+----+-------------+---------------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select * from patient_log;
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table       | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | patient_log | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   11 |   100.00 | NULL  |
+----+-------------+-------------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select * from statewise_forigner_confirmed;
+----+-------------+----------------+------------+------+---------------+------+---------+------+-------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows  | filtered | Extra |
+----+-------------+----------------+------------+------+---------------+------+---------+------+-------+----------+-------+
|  1 | SIMPLE      | covid_19_india | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 18188 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+---------------+------+---------+------+-------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select * from total_hospital_intakes;
+----+-------------+------------------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table                  | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+------------------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | total_hospital_intakes | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    1 |   100.00 | NULL  |
+----+-------------+------------------------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select * from vaccines;
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table    | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | vaccines | p0,p1,p2   | ALL  | NULL          | NULL | NULL    | NULL |    7 |   100.00 | NULL  |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select * from vaccines_administered;
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table                   | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | covid_vaccine_statewise | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 7678 |   100.00 | NULL  |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select * from vaccines_supply;
+----+-------------+-----------------+-------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table           | partitions  | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+-----------------+-------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | vaccines_supply | p0,p1,p2,p3 | ALL  | NULL          | NULL | NULL    | NULL |    9 |   100.00 | NULL  |
+----+-------------+-----------------+-------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select Deaths from covid_19_india where State_UnionTerritory ="Maharashtra";
+----+-------------+----------------+------------+------+---------------+------+---------+------+-------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows  | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+-------+----------+-------------+
|  1 | SIMPLE      | covid_19_india | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 18188 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+-------+----------+-------------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select Positive from statewisetestingdetails where State ="Maharashtra";
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+-------+----------+-------------+
| id | select_type | table                   | partitions | type | possible_keys | key  | key_len | ref  | rows  | filtered | Extra       |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+-------+----------+-------------+
|  1 | SIMPLE      | statewisetestingdetails | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 16204 |    10.00 | Using where |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+-------+----------+-------------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select CoviShield_DosesAdministered,Covaxin_DosesAdministered from covid_vaccine_statewise order by State asc;
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+----------------+
| id | select_type | table                   | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra          |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+----------------+
|  1 | SIMPLE      | covid_vaccine_statewise | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 7678 |   100.00 | Using filesort |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+----------------+
1 row in set, 1 warning (0.00 sec)

mysql> explain select TotalIndividualsVaccinated from covid_vaccine_statewise where State ="Maharashtra";
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table                   | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | covid_vaccine_statewise | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 7678 |    10.00 | Using where |
+----+-------------+-------------------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0.00 sec)