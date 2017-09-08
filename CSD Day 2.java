==> update students set city='Toronto'; // Update whole Field 

+------------+-----------+--------+------+------+
| STUDENT_ID | Snm       | Gender | CITY | Age  |
+------------+-----------+--------+------+------+
|          1 | SHUBHAM   | MALE   | NULL |   25 |
|          2 | JASKEERAT | MALE   | NULL |   24 |
|          3 | MAHIMA    | FEMALE | NULL |   26 |
|          4 | NULL      | Male   | NULL | NULL |
|          5 | VAIBHAV   | MALE   | NULL |   23 |
+------------+-----------+--------+------+------+

==>  update students set Snm='Ruresh' where STUDENT_ID = 4;
 
 
 +------------+-----------+--------+---------+------+
| STUDENT_ID | Snm       | Gender | CITY    | Age  |
+------------+-----------+--------+---------+------+
|          1 | SHUBHAM   | MALE   | Toronto |   25 |
|          2 | JASKEERAT | MALE   | Toronto |   24 |
|          3 | MAHIMA    | FEMALE | Toronto |   26 |
|          4 | Ruresh    | Male   | Toronto | NULL |
|          5 | Suresh    | MALE   | Toronto |   23 |
+------------+-----------+--------+---------+------+;

==>  update students set Snm='Suresh', city='Alberta' where STUDENT_ID = 3;

+------------+-----------+--------+---------+------+
| STUDENT_ID | Snm       | Gender | CITY    | Age  |
+------------+-----------+--------+---------+------+
|          1 | SHUBHAM   | MALE   | Toronto |   25 |
|          2 | JASKEERAT | MALE   | Toronto |   24 |
|          3 | Suresh    | FEMALE | Alberta |   26 |
|          4 | Ruresh    | Male   | Toronto | NULL |
|          5 | Suresh    | MALE   | Toronto |   23 |
+------------+-----------+--------+---------+------+

==> update students set Age=30, CITY='Missisauga', Gender='Female' ,snm='Geeta'  where STUDENT_ID = 4;

+------------+-----------+--------+------------+------+
| STUDENT_ID | Snm       | Gender | CITY       | Age  |
+------------+-----------+--------+------------+------+
|          1 | SHUBHAM   | MALE   | Toronto    |   25 |
|          2 | JASKEERAT | MALE   | Toronto    |   24 |
|          3 | Suresh    | FEMALE | Alberta    |   26 |
|          4 | Geeta     | Female | Missisauga |   30 |
|          5 | Suresh    | MALE   | Toronto    |   23 |
+------------+-----------+--------+------------+------+




==>  delete from tb_student where student_id=34;   // Delete 

+------------+--------------+--------+------+
| student_id | student_name | gender | age  |
+------------+--------------+--------+------+
|          1 | dhruvi       | female |   25 |
|          3 | Geeta        | female |   43 |
|          4 | Ramesh       | male   |   28 |
|          5 | Suresh       | male   |   30 |
+------------+--------------+--------+------+

//---------------------------  Functions ----------------------

==> select version();

	+-----------------+
	| version()       |
	+-----------------+
	| 10.1.21-MariaDB |
	+-----------------+

==>  select user();     //------------ root@ip address


--> root is a super user
--> To conect with other then local computer you use ip address of remote machine



	+----------------+
	| user()         |	
	+----------------+
	| root@localhost |
	+----------------+
	
	
==>  select sysdate();


+---------------------+
| sysdate()           |
+---------------------+
| 2017-09-07 18:02:58 |
+---------------------+

==>  select current_date();  OR select curdate();

+----------------+
| current_date() |
+----------------+
| 2017-09-07     |
+----------------+\

==>  select now();


+---------------------+
| now()               |
+---------------------+
| 2017-09-07 18:04:20 |
+---------------------+

==>  select curdate();

+------------+
| curdate()  |
+------------+
| 2017-09-07 |
+------------+

==>  select current_time();
+----------------+
| current_time() |
+----------------+
| 18:06:32       |
+----------------+


==>  select current_timestamp();
+---------------------+
| current_timestamp() |
+---------------------+
| 2017-09-07 18:06:59 |
+---------------------+


==>   select current_time();
+----------------+
| current_time() |
+----------------+
| 18:07:21       |
+----------------+


==>   alter table tb_student add column Marks int(3);

+------------+--------------+--------+------+-------+
| student_id | student_name | gender | age  | Marks |
+------------+--------------+--------+------+-------+
|          1 | dhruvi       | female |   25 |  NULL |
|          3 | Geeta        | female |   43 |  NULL |
|          4 | Ramesh       | male   |   28 |  NULL |
|          5 | Suresh       | male   |   30 |  NULL |
+------------+--------------+--------+------+-------+


==> update tb_student set Marks=78 where student_id='1';
	 update tb_student set Marks=55 where student_id='2';
	 update tb_student set Marks=67 where student_id='3';
	 update tb_student set Marks=89 where student_id='4';
	 update tb_student set Marks=45 where student_id='5';
	 
+------------+--------------+--------+------+-------+
| student_id | student_name | gender | age  | Marks |
+------------+--------------+--------+------+-------+
|          1 | dhruvi       | female |   25 |    78 |
|          3 | Geeta        | female |   43 |    67 |
|          4 | Ramesh       | male   |   28 |    89 |
|          5 | Suresh       | male   |   30 |    45 |
+------------+--------------+--------+------+-------+


==>  select now() , student_id from tb_student;

+---------------------+------------+
| now()               | student_id |
+---------------------+------------+
| 2017-09-07 18:14:37 |          1 |
| 2017-09-07 18:14:37 |          3 |
| 2017-09-07 18:14:37 |          4 |
| 2017-09-07 18:14:37 |          5 |
+---------------------+------------+

==>  select current_time() , student_id , avg(marks) from tb_student;


+----------------+------------+------------+
| current_time() | student_id | avg(marks) |
+----------------+------------+------------+
| 18:15:47       |          1 |    69.7500 |
+----------------+------------+------------+

==>  select current_time() , sum(Marks) , avg(marks) from tb_student;
+----------------+------------+------------+
| current_time() | sum(Marks) | avg(marks) |
+----------------+------------+------------+
| 18:16:32       |        279 |    69.7500 |
+----------------+------------+------------+



==>   select concat(student_name,student_id) from tb_student;
+---------------------------------+
| concat(student_name,student_id) |
+---------------------------------+
| dhruvi1                         |
| Geeta3                          |
| Ramesh4                         |
| Suresh5                         |
+---------------------------------+


==>   select concat(student_name,' ID is ', student_id) from tb_student;
+--------------------------------------------+
| concat(student_name,' ID is ', student_id) |
+--------------------------------------------+
| dhruvi ID is 1                             |
| Geeta ID is 3                              |
| Ramesh ID is 4                             |
| Suresh ID is 5                             |
+--------------------------------------------+


==>  select concat(student_name,' Scored  ' , marks , ' Marks') from tb_student;
+-----------------------------------------------------+
| concat(student_name,' Scored  ' , marks , ' Marks') |
+-----------------------------------------------------+
| dhruvi Scored  78 Marks                             |
| Geeta Scored  67 Marks                              |
| Ramesh Scored  89 Marks                             |
| Suresh Scored  45 Marks                             |
+-----------------------------------------------------+


==> select if(0 ,'true' , 'false');

+-------------------------+
| if(0 ,'true' , 'false') |
+-------------------------+
| false                   |
+-------------------------+

==>  select if(1 ,'true' , 'false');



+-------------------------+
| if(1 ,'true' , 'false') |
+-------------------------+
| true                    |
+-------------------------+


==>  select if(0=false ,'true' , 'false');
+-------------------------------+
| if(0=false ,'true' , 'false') |
+-------------------------------+
| true                          |
+-------------------------------+


if(1 = true ,'true' , 'false');
+--------------------------------+
| if(1 = true ,'true' , 'false') |
+--------------------------------+
| true                           |
+--------------------------------+


select weight_string(student_name) from tb_student;
+-----------------------------+
| weight_string(student_name) |
+-----------------------------+
| DHRUVI                      |
| GEETA                       |
| RAMESH                      |
| SURESH                      |
+-----------------------------+



==>   show create table tb_student\g;




CREATE TABLE Manufacturers (
 Code INTEGER,
 Name VARCHAR(255) NOT NULL,
 PRIMARY KEY (Code)   
);


[7:25] 
CREATE TABLE Products (
 Code INTEGER,
 Name VARCHAR(255) NOT NULL ,
 Price DECIMAL NOT NULL ,
 Manufacturer INTEGER NOT NULL,
 PRIMARY KEY (Code),
 FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ;


[7:25] 
INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);

select * from Manufacturers;
+------+-----------------+
| Code | Name            |
+------+-----------------+
|    1 | Sony            |
|    2 | Creative Labs   |
|    3 | Hewlett-Packard |
|    4 | Iomega          |
|    5 | Fujitsu         |
|    6 | Winchester      |
+------+-----------------+


 select * from Products;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
+------+-----------------+-------+--------------+





SELECT name,price FROM products;
+-----------------+--------+
| name            | price  |
+-----------------+--------+
| Hard drive      | 240.00 |
| Memory          | 120.00 |
| ZIP drive       | 150.00 |
| Floppy disk     |   5.00 |
| Monitor         | 240.00 |
| DVD drive       | 180.00 |
| CD drive        |  90.00 |
| Printer         | 270.00 |
| Toner cartridge |  66.00 |
| DVD burner      | 180.00 |
+-----------------+--------+


select * from products where price < 200 ;
+------+-----------------+--------+--------------+
| CODE | NAME            | PRICE  | MANUFACTURER |
+------+-----------------+--------+--------------+
|    2 | Memory          | 120.00 |            6 |
|    3 | ZIP drive       | 150.00 |            4 |
|    4 | Floppy disk     |   5.00 |            6 |
|    6 | DVD drive       | 180.00 |            2 |
|    7 | CD drive        |  90.00 |            2 |
|    9 | Toner cartridge |  66.00 |            3 |
|   10 | DVD burner      | 180.00 |            2 |
+------+-----------------+--------+--------------+




select  min(price) as Minimum_Price from Products;
+---------------+
| Minimum_Price |
+---------------+
|             5 |
+---------------+



 select  avg(price) as Average_Price from Products;
+---------------+
| Average_Price |
+---------------+
|      154.1000 |
+---------------+

select avg(Price) as Average_Price_Of_Manufacturer_2 from Products where Manufacturer='2';
+---------------------------------+
| Average_Price_Of_Manufacturer_2 |
+---------------------------------+
|                        150.0000 |
+---------------------------------+

select count(Name) from Products where price <= 150;
+-------------+
| count(Name) |
+-------------+
|           5 |
+-------------+


select * from Products order by Name ;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    7 | CD drive        |    90 |            2 |
|   10 | DVD burner      |   180 |            2 |
|    6 | DVD drive       |   180 |            2 |
|    4 | Floppy disk     |     5 |            6 |
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    5 | Monitor         |   240 |            1 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|    3 | ZIP drive       |   150 |            4 |
+------+-----------------+-------+--------------+


select * from Products order by Name DESC ;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    3 | ZIP drive       |   150 |            4 |
|    9 | Toner cartridge |    66 |            3 |
|    8 | Printer         |   270 |            3 |
|    5 | Monitor         |   240 |            1 |
|    2 | Memory          |   120 |            6 |
|    1 | Hard drive      |   240 |            5 |
|    4 | Floppy disk     |     5 |            6 |
|    6 | DVD drive       |   180 |            2 |
|   10 | DVD burner      |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
+------+-----------------+-------+--------------+



select * from Products order by  Manufacturer DESC , Name ;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    4 | Floppy disk     |     5 |            6 |
|    2 | Memory          |   120 |            6 |
|    1 | Hard drive      |   240 |            5 |
|    3 | ZIP drive       |   150 |            4 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|    7 | CD drive        |    90 |            2 |
|   10 | DVD burner      |   180 |            2 |
|    6 | DVD drive       |   180 |            2 |
|    5 | Monitor         |   240 |            1 |
+------+-----------------+-------+--------------+



select * from Products order by  Manufacturer DESC , Name desc;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    2 | Memory          |   120 |            6 |
|    4 | Floppy disk     |     5 |            6 |
|    1 | Hard drive      |   240 |            5 |
|    3 | ZIP drive       |   150 |            4 |
|    9 | Toner cartridge |    66 |            3 |
|    8 | Printer         |   270 |            3 |
|    6 | DVD drive       |   180 |            2 |
|   10 | DVD burner      |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    5 | Monitor         |   240 |            1 |
+------+-----------------+-------+--------------+

MariaDB [db_test_dhruvi]> select * from Products where Name like '%drive%';
+------+------------+-------+--------------+
| Code | Name       | Price | Manufacturer |
+------+------------+-------+--------------+
|    1 | Hard drive |   240 |            5 |
|    3 | ZIP drive  |   150 |            4 |
|    6 | DVD drive  |   180 |            2 |
|    7 | CD drive   |    90 |            2 |
+------+------------+-------+--------------+


//--------------------- Error 1452 -------------------

update Products set manufacturer=7  where code=1;
 Cannot add or update a child row: 
 ERROR 1452 (23000): a foreign key constraint fails (`db_test_dhruvi`.`products`, CONSTRAINT `products_ibfk_1` FOREIGN KEY (`Manufacturer`) REFERENCES `manufacturers` (`Code`))

  
  

insert into Products values(11 , 'Speacker' ,320 , 7);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`db_test_dhruvi`.`products`, CONSTRAINT `products_ibfk_1` FOREIGN KEY (`Manufacturer`) REFERENCES `manufacturers` (`Code`))

//--------------------- Error 1451 -------------------

delete from Manufacturers where Code=1;
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`db_test_dhruvi`.`products`, CONSTRAINT `products_ibfk_1` FOREIGN KEY (`Manufacturer`) REFERENCES `manufacturers` (`Code`))


insert into Manufacturers values(7,'Lenovo');

insert into Products values(12, '1 Tb Hard drive' , 764 , 7);
 insert into Products values(13, '2 Tb Hard drive' , 964 , 7);
 insert into Products values(14, '4 Tb Hard drive' , 1234 , 7);
 
 
 
 
 
  select * from Manufacturers;
+------+-----------------+
| Code | Name            |
+------+-----------------+
|    1 | Sony            |
|    2 | Creative Labs   |
|    3 | Hewlett-Packard |
|    4 | Iomega          |
|    5 | Fujitsu         |
|    6 | Winchester      |
|    7 | Lenovo          |
+------+-----------------+


select * from Products;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   500 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
|   11 | Speacker        |   320 |            6 |
|   12 | 1 Tb Hard drive |   764 |            7 |
|   13 | 2 Tb Hard drive |   964 |            7 |
|   14 | 4 Tb Hard drive |  1234 |            7 |
+------+-----------------+-------+--------------+



