mysql> create table employee
    -> ( emp_ID int primary key,
    -> emp_NAME varchar(50) not null,
    -> DEPT_NAME varchar(50),
    -> SALARY int);
Query OK, 0 rows affected (0.07 sec)

mysql> describe employee;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| emp_ID    | int         | NO   | PRI | NULL    |       |
| emp_NAME  | varchar(50) | NO   |     | NULL    |       |
| DEPT_NAME | varchar(50) | YES  |     | NULL    |       |
| SALARY    | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.03 sec)

mysql> select * from employee;
+--------+----------+-----------+--------+
| emp_ID | emp_NAME | DEPT_NAME | SALARY |
+--------+----------+-----------+--------+
|    101 | Mohan    | Admin     |   4000 |
|    102 | Rajkumar | HR        |   3000 |
|    103 | Akbar    | IT        |   4000 |
|    104 | Dorvin   | Finance   |   6500 |
|    105 | Rohit    | HR        |   3000 |
|    106 | Rajesh   | Finance   |   5000 |
|    107 | Preet    | HR        |   7000 |
|    108 | Maryam   | Admin     |   4000 |
|    109 | Sanjay   | IT        |   6500 |
|    110 | Vasudha  | IT        |   7000 |
|    111 | Melinda  | IT        |   8000 |
|    112 | Komal    | IT        |  10000 |
|    113 | Gautham  | Admin     |   2000 |
|    115 | Chandni  | IT        |   4500 |
|    116 | Satya    | Finance   |   6500 |
+--------+----------+-----------+--------+
15 rows in set (0.00 sec)



/* fetch the second last record from  employee table */

mysql> select emp_id, emp_name, dept_name, salary
    -> from(
    -> select * ,row_number() over (order by emp_id desc) as rn
    -> from employee e) x where x.rn=2;
+--------+----------+-----------+--------+
| emp_id | emp_name | dept_name | salary |
+--------+----------+-----------+--------+
|    115 | Chandni  | IT        |   4500 |
+--------+----------+-----------+--------+



/* max and min salary of diffn department*/

mysql> select x.*
    -> from employee e
    -> join (select *,
    -> max(salary) over (partition by dept_name) as max_salary,
    -> min(salary) over (partition by dept_name) as min_salary
    -> from employee) x
    -> on e.emp_id = x.emp_id
    -> and (e.salary = x.max_salary or e.salary = x.min_salary)
    -> order by x.dept_name, x.salary;
+--------+----------+-----------+--------+------------+------------+
| emp_ID | emp_NAME | DEPT_NAME | SALARY | max_salary | min_salary |
+--------+----------+-----------+--------+------------+------------+
|    113 | Gautham  | Admin     |   2000 |       4000 |       2000 |
|    101 | Mohan    | Admin     |   4000 |       4000 |       2000 |
|    108 | Maryam   | Admin     |   4000 |       4000 |       2000 |
|    106 | Rajesh   | Finance   |   5000 |       6500 |       5000 |
|    104 | Dorvin   | Finance   |   6500 |       6500 |       5000 |
|    116 | Satya    | Finance   |   6500 |       6500 |       5000 |
|    102 | Rajkumar | HR        |   3000 |       7000 |       3000 |
|    105 | Rohit    | HR        |   3000 |       7000 |       3000 |
|    107 | Preet    | HR        |   7000 |       7000 |       3000 |
|    103 | Akbar    | IT        |   4000 |      10000 |       4000 |
|    112 | Komal    | IT        |  10000 |      10000 |       4000 |
+--------+----------+-----------+--------+------------+------------+
11 rows in set (0.02 sec)

/*3 min salary*/

mysql> select distinct salary from employee a
    ->  where 3 >= (select count(distinct salary)
    -> from employee b
    -> where a.salary >= b.salary);
+--------+
| salary |
+--------+
|   4000 |
|   3000 |
|   2000 |
+--------+
3 rows in set (0.02 sec)


/*Count the total sal  deptname wise where more than 2 employees exist */

mysql> SELECT  dept_name, sum(salary) As totalsal
    -> FROM employee
    -> GROUP BY dept_name
    -> HAVING COUNT(emp_name) > 2;
+-----------+----------+
| dept_name | totalsal |
+-----------+----------+
| Admin     |    10000 |
| HR        |    13000 |
| IT        |    40000 |
| Finance   |    18000 |
+-----------+----------+
4 rows in set (0.00 sec)