==>  mysql -u root -p

==>  create database db_test_dhruvi;

==>  show databases db_test_dhruvi;

==>	 use db_test_dhruvi;

==>	 show tables;

==>	 create table tb_student
    -> (
    -> student_id int(5),
    -> student_name varchar(25),
    -> gender varchar(10),
    -> age int(3)
    -> );
	
	
==>  show tables;

==>	 describe tb_student; //to show table structure 

==>	 decs tb_student; //to show table structure 

==>  insert into tb_student values
	-> (
    -> 0001, "dhruvi" , "female" , 25
	-> );
	
==>  insert into tb_student   // atuo genrated software use this syntex
    -> (
	-> age , gender , student_name , student_id
	-> )
    -> values(
	-> 34 , 'male' , 'xyz' , 0002
	->);
	
==>  insert into tb_student values(
    -> 0003 , 'Geeta', 'female' , 43);
	
==>	 insert into tb_student values(
    -> 0004 , 'Ramesh' ,'male', 28);
	
==>  insert into tb_student values(
    -> 0004 , 'Geeta', 'female' ,30);
	
==>	  insert into tb_student values(
    -> 0005 , 'Suresh', 'male' ,30);
	
	
+------------+--------------+--------+------+
| student_id | student_name | gender | age  |
+------------+--------------+--------+------+
|          1 | dhruvi       | female |   25 |
|          2 | xyz          | male   |   34 |
|          3 | Geeta        | female |   43 |
|          4 | Ramesh       | male   |   28 |
|          4 | Geeta        | female |   30 |
|          5 | Suresh       | male   |   30 |
+------------+--------------+--------+------+


==>	  select student_id, student_name from tb_student;  // SELECTED COLUMNS

==>	  select * from tb_student where student_id >=2; // WHERE

==>   select student_name from tb_student where age <=30;  //WHERE

+--------------+
| student_name |
+--------------+
| dhruvi       |
| Ramesh       |
| Geeta        |
| Suresh       |
+--------------+

==>  select * from tb_student where age <=30 and gender='male';  // AND

==>	 select * from tb_student where age <=30 and gender!='male';  //AND


==>  select * from tb_student where age <=30 or gender!='male'; //OR


==>  SELECT * FROM tb_student LIMIT 2;  // LIMIT

==>  select * from tb_student where student_name like 'Ge%';  // LIKE

+------------+--------------+--------+------+
| student_id | student_name | gender | age  |
+------------+--------------+--------+------+
|          3 | Geeta        | female |   43 |
|          4 | Geeta        | female |   30 |
+------------+--------------+--------+------+

==>  select * from tb_student where student_name like '%sh';  // Name end with 'SH'

+------------+--------------+--------+------+
| student_id | student_name | gender | age  |
+------------+--------------+--------+------+
|          4 | Ramesh       | male   |   28 |
|          5 | Suresh       | male   |   30 |
+------------+--------------+--------+------+


==> select * from tb_student where student_name like '_h%';  // Second character is 'H';

+------------+--------------+--------+------+
| student_id | student_name | gender | age  |
+------------+--------------+--------+------+
|          1 | dhruvi       | female |   25 |
+------------+--------------+--------+------+

//-------------- lession --------------

==>  select * from tb_student where student_name like '_h%' or '_e%'; //  Second character is 'H' OR 'E';

//-> After or the term '_e%' does not have any meaning unless you define it
	() wrong output  
+------------+--------------+--------+------+
| student_id | student_name | gender | age  |
+------------+--------------+--------+------+
|          1 | dhruvi       | female |   25 |
+------------+--------------+--------+------+

// -> Here we define student_name matched to '_e%'  ; so this will get executed


==> select * from tb_student where student_name like '_h%' or student_name like '_e%'; //  Second character is 'H' OR 'E';


+------------+--------------+--------+------+
| student_id | student_name | gender | age  |
+------------+--------------+--------+------+
|          1 | dhruvi       | female |   25 |
|          3 | Geeta        | female |   43 |
|          4 | Geeta        | female |   30 |
+------------+--------------+--------+------+


==>  select * from tb_student where 1;  // 1 is for true ;  IT IS A DUMMY CONDITION

+------------+--------------+--------+------+
| student_id | student_name | gender | age  |
+------------+--------------+--------+------+
|          1 | dhruvi       | female |   25 |
|          2 | xyz          | male   |   34 |
|          3 | Geeta        | female |   43 |
|          4 | Ramesh       | male   |   28 |
|          4 | Geeta        | female |   30 |
|          5 | Suresh       | male   |   30 |
+------------+--------------+--------+------+

==>   select * from tb_student where age between 30 and 40;  // BETWEEN

+------------+--------------+--------+------+
| student_id | student_name | gender | age  |
+------------+--------------+--------+------+
|          2 | xyz          | male   |   34 |
|          4 | Geeta        | female |   30 |
|          5 | Suresh       | male   |   30 |
+------------+--------------+--------+------+


==>   select * from tb_student where age in(20,30);   // Only match 30

+------------+--------------+--------+------+
| student_id | student_name | gender | age  |
+------------+--------------+--------+------+
|          4 | Geeta        | female |   30 |
|          5 | Suresh       | male   |   30 |
+------------+--------------+--------+------+


==>   // Altr Table

==>  alter table tb_student add marks int(5); //ALTER

+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| student_id   | int(5)      | YES  |     | NULL    |       |
| student_name | varchar(25) | YES  |     | NULL    |       |
| gender       | varchar(10) | YES  |     | NULL    |       |
| age          | int(3)      | YES  |     | NULL    |       |
| marks        | int(5)      | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+


==>  alter table tb_student add city varchar(50);  //ALTER

+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| student_id   | int(5)      | YES  |     | NULL    |       |
| student_name | varchar(25) | YES  |     | NULL    |       |
| gender       | varchar(10) | YES  |     | NULL    |       |
| age          | int(3)      | YES  |     | NULL    |       |
| marks        | int(5)      | YES  |     | NULL    |       |
| city         | varchar(50) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+

==>  select student_id as StudentID from tb_student;  // AS
==>   select student_id 'StudentID' from tb_student;
==>  select student_id `StudentID` from tb_student;
+-----------+ 
| StudentID |
+-----------+
|         1 |
|         2 |
|         3 |
|         4 |
|         4 |
|         5 |
+-----------+


==>  alter table tb_student drop column city; // Drop Column

+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| student_id   | int(5)      | YES  |     | NULL    |       |
| student_name | varchar(25) | YES  |     | NULL    |       |
| gender       | varchar(10) | YES  |     | NULL    |       |
| age          | int(3)      | YES  |     | NULL    |       |
| marks        | int(5)      | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+


==> alter table tb_student modify column marks int(6);  // atler coulmn data type

+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| student_id   | int(5)      | YES  |     | NULL    |       |
| student_name | varchar(25) | YES  |     | NULL    |       |
| gender       | varchar(10) | YES  |     | NULL    |       |
| age          | int(3)      | YES  |     | NULL    |       |
| marks        | int(6)      | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+