/*Explain keyword*/
EXPLAIN SELECT * FROM Vaccines_Supply;

EXPLAIN SELECT * FROM Vaccines_Supply WHERE state_id = 5;

EXPLAIN SELECT * FROM StateZone;

EXPLAIN SELECT * FROM StateZone WHERE state_id = 5;

EXPLAIN SELECT * FROM hired_candidates_sub_partition WHERE hired_date < 2017;

EXPLAIN SELECT * FROM Vaccines WHERE Supply_date = '2021-01-15';

EXPLAIN SELECT * FROM Covid_Vaccine;

EXPLAIN SELECT * FROM Covid_Vaccine WHERE vaccine_name = '';

EXPLAIN SELECT * FROM Covishield;
