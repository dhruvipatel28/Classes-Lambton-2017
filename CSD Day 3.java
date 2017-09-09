Today's Topics

--> Insert data into tables from text file
--> Reguler Expression in Sql 
--> Join Querys
--> On Delete Cascaed 





ER Diagrams 

https://www.lucidchart.com/pages/er-diagrams/c?er=1

Normalization

http://www.studytonight.com/dbms/database-normalization.php


//----------------  Insert data from text file (pet.text) to table --------------------


//--------- create table first ---------

CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);

// ----------  Use LOAD DATA INFILE  'path' INTO TABLE table_name ----------

current file path : \\storage\storage$\719320\Documents\Queries\Queries\pet.txt

LOAD DATA INFILE '\\storage\storage$\719320\Documents\Queries\Queries\pet.txt' INTO TABLE pet;

==>  select * from pet;
+----------+--------+---------+------+------------+------------+
| name     | owner  | species | sex  | birth      | death      |
+----------+--------+---------+------+------------+------------+
| Fluffy   | Harold | cat     | f    | 1993-02-04 | 0000-00-00 |
| Claws    | Gwen   | cat     | m    | 1994-03-17 | 0000-00-00 |
| Buffy    | Harold | dog     | f    | 1989-05-13 | 0000-00-00 |
| Fang     | Benny  | dog     | m    | 1990-08-27 | 0000-00-00 |
| Bowser   | Diane  | dog     | m    | 1979-08-31 | 1995-07-29 |
| Chirpy   | Gwen   | bird    | f    | 1998-09-11 | 0000-00-00 |
| Whistler | Gwen   | bird    |      | 1997-12-09 | 0000-00-00 |
| Slim     | Benny  | snake   | m    | 1996-04-29 | 0000-00-00 |
+----------+--------+---------+------+------------+------------+


//-------------   To calculate current age from birth day -----------

/*----------   TIMESTAMPDIFF(unit,datetime_expr1,datetime_expr2);  -----------


Name				Description
datetime_expr1		A datetime expression.
datetime_expr1		A datetime expression.
unit				An unit, as described in the description.  */

==>  select  TIMESTAMPDIFF(day ,'1992-02-28',CURDATE()) as Age_in_days ;
+-------------+
| Age_in_days |
+-------------+
|        9324 |
+-------------+

==> 	select  TIMESTAMPDIFF(month ,'1992-02-28',CURDATE()) as Age_in_month ;
+--------------+
| Age_in_month |
+--------------+
|          306 |
+--------------+

==>   select  TIMESTAMPDIFF(year ,'1992-02-28',CURDATE()) as Age_in_years ;
+--------------+
| Age_in_years |
+--------------+
|           25 |
+--------------+





==>   select name , birth, CURDATE() as 'today_date' , TIMESTAMPDIFF(Day ,birth,CURDATE()) as Age_in_days from pet ;

+----------+------------+------------+-------------+
| name     | birth      | today_date | Age_in_days |
+----------+------------+------------+-------------+
| Puffball | 1999-03-30 | 2017-09-08 |        6737 |
| Fluffy   | 1993-02-04 | 2017-09-08 |        8982 |
| Claws    | 1994-03-17 | 2017-09-08 |        8576 |
| Buffy    | 1989-05-13 | 2017-09-08 |       10345 |
| Fang     | 1990-08-27 | 2017-09-08 |        9874 |
| Bowser   | 1979-08-31 | 2017-09-08 |       13888 |
| Chirpy   | 1998-09-11 | 2017-09-08 |        6937 |
| Whistler | 1997-12-09 | 2017-09-08 |        7213 |
| Slim     | 1996-04-29 | 2017-09-08 |        7802 |
+----------+------------+------------+-------------+


==>  select name , birth, CURDATE() as 'today_date' , TIMESTAMPDIFF(month ,birth,CURDATE()) as Age_in_month from pet ;


+----------+------------+------------+--------------+
| name     | birth      | today_date | Age_in_month |
+----------+------------+------------+--------------+
| Puffball | 1999-03-30 | 2017-09-08 |          221 |
| Fluffy   | 1993-02-04 | 2017-09-08 |          295 |
| Claws    | 1994-03-17 | 2017-09-08 |          281 |
| Buffy    | 1989-05-13 | 2017-09-08 |          339 |
| Fang     | 1990-08-27 | 2017-09-08 |          324 |
| Bowser   | 1979-08-31 | 2017-09-08 |          456 |
| Chirpy   | 1998-09-11 | 2017-09-08 |          227 |
| Whistler | 1997-12-09 | 2017-09-08 |          236 |
| Slim     | 1996-04-29 | 2017-09-08 |          256 |
+----------+------------+------------+--------------+


/*

https://dev.mysql.com/doc/refman/5.7/en/regexp.html


Regular expresion , Pattern Matching , 

^b			=		start with b
er*			=		End with er
$			=		End with $
+			=		Must Have one occurence
|			=		Or occurence

*/

==> 	SELECT * FROM pet WHERE name REGEXP 'er*';   // with *
==> 	SELECT * FROM pet WHERE name REGEXP 'er$';		// with $

+----------+-------+---------+------+------------+------------+
| name     | owner | species | sex  | birth      | death      |
+----------+-------+---------+------+------------+------------+
| Bowser   | Diane | dog     | m    | 1979-08-31 | 1995-07-29 |
| Whistler | Gwen  | bird    |      | 1997-12-09 | 0000-00-00 |
+----------+-------+---------+------+------------+------------+



==>   SELECT * FROM pet WHERE name REGEXP '^b'; // end with b 
+--------+--------+---------+------+------------+------------+
| name   | owner  | species | sex  | birth      | death      |
+--------+--------+---------+------+------------+------------+
| Buffy  | Harold | dog     | f    | 1989-05-13 | 0000-00-00 |
| Bowser | Diane  | dog     | m    | 1979-08-31 | 1995-07-29 |
+--------+--------+---------+------+------------+------------+

==>		SELECT * FROM pet WHERE name REGEXP 'w';   //  contains 'w'
+----------+-------+---------+------+------------+------------+
| name     | owner | species | sex  | birth      | death      |
+----------+-------+---------+------+------------+------------+
| Claws    | Gwen  | cat     | m    | 1994-03-17 | 0000-00-00 |
| Bowser   | Diane | dog     | m    | 1979-08-31 | 1995-07-29 |
| Whistler | Gwen  | bird    |      | 1997-12-09 | 0000-00-00 |
+----------+-------+---------+------+------------+------------+


==>	SELECT * FROM pet WHERE name REGEXP '^.....$';   // 5 characters only
==>	SELECT * FROM pet WHERE name REGEXP '^.{5}$';   // 5 characters only
==>	SELECT * FROM pet WHERE name LIKE '_____';   // ( 5 times _ ) 5 characters only

+-------+--------+---------+------+------------+------------+
| name  | owner  | species | sex  | birth      | death      |
+-------+--------+---------+------+------------+------------+
| Claws | Gwen   | cat     | m    | 1994-03-17 | 0000-00-00 |
| Buffy | Harold | dog     | f    | 1989-05-13 | 0000-00-00 |
+-------+--------+---------+------+------------+------------+


==>  SELECT * FROM pet WHERE name REGEXP '^.{5}$';  // 5 characters only
+-------+--------+---------+------+------------+------------+
| name  | owner  | species | sex  | birth      | death      |
+-------+--------+---------+------+------------+------------+
| Claws | Gwen   | cat     | m    | 1994-03-17 | 0000-00-00 |
| Buffy | Harold | dog     | f    | 1989-05-13 | 0000-00-00 |
+-------+--------+---------+------+------------+------------+



==> SELECT DATABASE(); // To see current database
+------------+
| DATABASE() |
+------------+
| NULL       |
+------------+


==>  select version();   // to see sql version 
+-----------------+
| version()       |
+-----------------+
| 10.1.21-MariaDB |
+-----------------+



/*

			Joins   :  http://www.mysqltutorial.org/mysql-inner-join.aspx
*/



// ----------- Inner Join with alias table name

==>	 select P.Name as ProductName , M.Name as Manufacturer_Name
    -> from Products P , Manufacturers M
    -> where P.manufacturer = M.Code;
+-----------------+-------------------+
| ProductName     | Manufacturer_Name |
+-----------------+-------------------+
| Monitor         | Sony              |
| DVD drive       | Creative Labs     |
| CD drive        | Creative Labs     |
| DVD burner      | Creative Labs     |
| Printer         | Hewlett-Packard   |
| Toner cartridge | Hewlett-Packard   |
| ZIP drive       | Iomega            |
| Hard drive      | Fujitsu           |
| Memory          | Winchester        |
| Floppy disk     | Winchester        |
| 1 Tb Hard drive | Lenovo            |
| 2 Tb Hard drive | Lenovo            |
| 4 Tb Hard drive | Lenovo            |
+-----------------+-------------------+


==>	select * from Products P , Manufacturers M
    -> where P.Manufacturer = M.Code;
+------+-----------------+-------+--------------+------+-----------------+
| Code | Name            | Price | Manufacturer | Code | Name            |
+------+-----------------+-------+--------------+------+-----------------+
|    5 | Monitor         |   240 |            1 |    1 | Sony            |
|    6 | DVD drive       |   180 |            2 |    2 | Creative Labs   |
|    7 | CD drive        |    90 |            2 |    2 | Creative Labs   |
|   10 | DVD burner      |   180 |            2 |    2 | Creative Labs   |
|    8 | Printer         |   270 |            3 |    3 | Hewlett-Packard |
|    9 | Toner cartridge |    66 |            3 |    3 | Hewlett-Packard |
|    3 | ZIP drive       |   150 |            4 |    4 | Iomega          |
|    1 | Hard drive      |   240 |            5 |    5 | Fujitsu         |
|    2 | Memory          |   120 |            6 |    6 | Winchester      |
|    4 | Floppy disk     |     5 |            6 |    6 | Winchester      |
|   12 | 1 Tb Hard drive |   764 |            7 |    7 | Lenovo          |
|   13 | 2 Tb Hard drive |   964 |            7 |    7 | Lenovo          |
|   14 | 4 Tb Hard drive |  1234 |            7 |    7 | Lenovo          |
+------+-----------------+-------+--------------+------+-----------------+

==>    // ============ Syntext Diffrence on applying INNER JOINS

select P.Name as Product_Name , P.Price as Product_Price , M.Name as Manufacturer_Name
    -> from Products as P INNER JOIN  Manufacturers as M ON
    -> P.Manufacturer = M.Code;   // AS used
	
select P.Name as Product_Name , P.Price as Product_Price , M.Name as Manufacturer_Name
    -> from Products  P INNER JOIN  Manufacturers  M ON
    -> P.Manufacturer = M.Code;   // Without AS
	
	//   INNER JOIN key work come between the table Names with AS 
	// AS key word does not make any diffrence 
	//   Where is replaced with ON keyword
	
select P.Name as Product_Name , P.Price as Product_Price , M.Name as Manufacturer_Name
    -> from Products P , Manufacturers M
    -> where P.Manufacturer = M.Code;

	
+-----------------+---------------+-------------------+
| Product_Name    | Product_Price | Manufacturer_Name |
+-----------------+---------------+-------------------+
| Monitor         |           240 | Sony              |
| DVD drive       |           180 | Creative Labs     |
| CD drive        |            90 | Creative Labs     |
| DVD burner      |           180 | Creative Labs     |
| Printer         |           270 | Hewlett-Packard   |
| Toner cartridge |            66 | Hewlett-Packard   |
| ZIP drive       |           150 | Iomega            |
| Hard drive      |           240 | Fujitsu           |
| Memory          |           120 | Winchester        |
| Floppy disk     |             5 | Winchester        |
| 1 Tb Hard drive |           764 | Lenovo            |
| 2 Tb Hard drive |           964 | Lenovo            |
| 4 Tb Hard drive |          1234 | Lenovo            |
+-----------------+---------------+-------------------+


===>   insert into Manufacturers values(8,'DEll');

//------------------- Outer Left Join -------



==>		 select * from manufacturers M Left outer join products p ON m.code = p.manufacturer;
==>		select  M.Name as Manufacturer_Name , P.Name as Product_Name from  Manufacturers M LEFT OUTER JOIN Products P ON M.Code = P.Manufacturer;

		//   LEFT OUTER JOIN key work come between the table Names with AS 
	// AS key word does not make any diffrence 
	//   Where is replaced with ON keyword

+------+-----------------+------+-----------------+-------+--------------+
| Code | Name            | Code | Name            | Price | Manufacturer |
+------+-----------------+------+-----------------+-------+--------------+
|    1 | Sony            |    5 | Monitor         |   240 |            1 |
|    2 | Creative Labs   |    6 | DVD drive       |   180 |            2 |
|    2 | Creative Labs   |    7 | CD drive        |    90 |            2 |
|    2 | Creative Labs   |   10 | DVD burner      |   180 |            2 |
|    3 | Hewlett-Packard |    8 | Printer         |   270 |            3 |
|    3 | Hewlett-Packard |    9 | Toner cartridge |    66 |            3 |
|    4 | Iomega          |    3 | ZIP drive       |   150 |            4 |
|    5 | Fujitsu         |    1 | Hard drive      |   240 |            5 |
|    6 | Winchester      |    2 | Memory          |   120 |            6 |
|    6 | Winchester      |    4 | Floppy disk     |     5 |            6 |
|    7 | Lenovo          |   12 | 1 Tb Hard drive |   764 |            7 |
|    7 | Lenovo          |   13 | 2 Tb Hard drive |   964 |            7 |
|    7 | Lenovo          |   14 | 4 Tb Hard drive |  1234 |            7 |
|    8 | DEll            | NULL | NULL            |  NULL |         NULL |
+------+-----------------+------+-----------------+-------+--------------+
14 rows in set (0.00 sec)


/*

				On Delete Cascaed / Set Null to child reference field 

 CREATE TABLE Products (
 Code INTEGER,
 Name VARCHAR(255) NOT NULL ,
 Price DECIMAL NOT NULL ,
 Manufacturer INTEGER ,
 PRIMARY KEY (Code),
 FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code) ON DELETE SET NULL
)
				
	NOTE	************  Foreigon Key Field Must allow NULL   ************
*/




==>   delete from Manufacturers where Code =  7;

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
|   12 | 1 Tb Hard drive |   764 |         NULL |
|   13 | 2 Tb Hard drive |   964 |         NULL |
|   14 | 4 Tb Hard drive |  1234 |         NULL |
|   15 | Mouse           |   464 |         NULL |
|   16 | Key Board       |   564 |         NULL |
+------+-----------------+-------+--------------+


