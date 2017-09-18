https://en.wikibooks.org/wiki/SQL_Exercises/Planet_Express#Table_creation_code
sudo mysql --force --comments -vvv;
tee 'filename';
notee;
# mysqldump --single-transaction -u root -p --databases mytestdb > C:/Users/719320/Downloads/dumpMyTestDb.sql

SELECT @n := name FROM products WHERE name = 'monitor';
SELECT name FROM products WHERE name = 'monitor' INTO @v;
select @n;

SELECT [] INTO OUTFILE 'U:/Users/pritesh.patel/Downloads/q1.txt';
LOAD DATA INFILE '' INTO TABLE [PET];
CREATE VIEW v1 as SELECT Code,Name from products;

DESC INFORMATION_SCHEMA.COLUMNS;

SELECT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS;

SELECT COLUMN_NAME,DATA_TYPE,IS_NULLABLE,COLUMN_DEFAULT
    -> FROM INFORMATION_SCHEMA.COLUMNS
    -> WHERE TABLE_NAME = 'PRODUCTS'
    -> AND TABLE_SCHEMA = 'MYTESTDB';
+--------------+-----------+-------------+----------------+
| COLUMN_NAME  | DATA_TYPE | IS_NULLABLE | COLUMN_DEFAULT |
+--------------+-----------+-------------+----------------+
| Code         | int       | NO          | NULL           |
| Name         | varchar   | NO          | NULL           |
| Price        | decimal   | NO          | NULL           |
| Manufacturer | int       | YES         | NULL           |
+--------------+-----------+-------------+----------------+

USE INFORMATION_SCHEMA;
Database changed
MariaDB [INFORMATION_SCHEMA]> SHOW TABLES;

MariaDB [INFORMATION_SCHEMA]>SELECT * FROM TABLES WHERE TABLE_SCHEMA = 'MYTESTDB';  // information
MariaDB [INFORMATION_SCHEMA]>SELECT * FROM TABLES WHERE TABLE_SCHEMA = 'MYTESTDB'\g;  // Column information
MariaDB [INFORMATION_SCHEMA]>SELECT * FROM TABLES WHERE TABLE_SCHEMA = 'MYTESTDB'\G;  // Row wise information

create database examc0719320;

use examc0719320;

CREATE TABLE tbl_employee 
(
  employee_id INTEGER PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  position TEXT NOT NULL,
  salary REAL NOT NULL,
  remarks TEXT
);

INSERT INTO tbl_employee VALUES(1, 'Phillip J. Fry', 'Delivery boy', 7500.0, 'Not to be confused with the Philip J. Fry from Hovering Squid World 97a');
INSERT INTO tbl_employee VALUES(2, 'Turanga Leela', 'Captain', 10000.0, NULL);
INSERT INTO tbl_employee VALUES(3, 'Bender Bending Rodriguez', 'Robot', 7500.0, NULL);
INSERT INTO tbl_employee VALUES(4, 'Hubert J. Farnsworth', 'CEO', 20000.0, NULL);
INSERT INTO tbl_employee VALUES(5, 'John A. Zoidberg', 'Physician', 25.0, NULL);
INSERT INTO tbl_employee VALUES(6, 'Amy Wong', 'Intern', 5000.0, NULL);
INSERT INTO tbl_employee VALUES(7, 'Hermes Conrad', 'Bureaucrat', 10000.0, NULL);
INSERT INTO tbl_employee VALUES(8, 'Scruffy Scruffington', 'Janitor', 5000.0, NULL);

CREATE TABLE tbl_location 
(
  location_id INTEGER PRIMARY KEY NOT NULL,
  location TEXT NOT NULL,
  coordinates REAL NOT NULL
);

INSERT INTO tbl_location VALUES(1, 'Omicron Persei 8', 89475345.3545);
INSERT INTO tbl_location VALUES(2, 'Decapod X', 65498463216.3466);
INSERT INTO tbl_location VALUES(3, 'Mars', 32435021.65468);
INSERT INTO tbl_location VALUES(4, 'Omega III', 98432121.5464);
INSERT INTO tbl_location VALUES(5, 'Tarantulon VI', 849842198.354654);
INSERT INTO tbl_location VALUES(6, 'Cannibalon', 654321987.21654);
INSERT INTO tbl_location VALUES(7, 'DogDoo VII', 65498721354.688);
INSERT INTO tbl_location VALUES(8, 'Nintenduu 64', 6543219894.1654);
INSERT INTO tbl_location VALUES(9, 'Amazonia', 65432135979.6547);

CREATE TABLE tbl_shipment 
(
  shipment_id INTEGER PRIMARY KEY NOT NULL,
  shipment_date TEXT,
  manager INTEGER NOT NULL,
  location INTEGER NOT NULL,
  FOREIGN KEY (manager) REFERENCES tbl_employee(employee_id),
  FOREIGN KEY (location) REFERENCES tbl_location(location_id)
);

INSERT INTO tbl_shipment VALUES(1, '3004/05/11', 1, 1);
INSERT INTO tbl_shipment VALUES(2, '3004/05/11', 1, 2);
INSERT INTO tbl_shipment VALUES(3, NULL, 2, 3);
INSERT INTO tbl_shipment VALUES(4, NULL, 2, 4);
INSERT INTO tbl_shipment VALUES(5, NULL, 7, 5);

CREATE TABLE tbl_has_clearance
(
  employee_id INTEGER NOT NULL,
  location_id INTEGER NOT NULL,
  status INTEGER NOT NULL,
  PRIMARY KEY(employee_id, location_id),
  FOREIGN KEY(employee_id) REFERENCES tbl_employee(employee_id),
  FOREIGN KEY(employee_id)REFERENCES tbl_location(location_id)
);

INSERT INTO tbl_has_clearance VALUES(1, 1, 2);
INSERT INTO tbl_has_clearance VALUES(1, 2, 3);
INSERT INTO tbl_has_clearance VALUES(2, 3, 2);
INSERT INTO tbl_has_clearance VALUES(2, 4, 4);
INSERT INTO tbl_has_clearance VALUES(3, 5, 2);
INSERT INTO tbl_has_clearance VALUES(3, 6, 4);
INSERT INTO tbl_has_clearance VALUES(4, 7, 1);


CREATE TABLE tbl_client 
(
  account_number INTEGER PRIMARY KEY NOT NULL,
  client_name TEXT NOT NULL
);
INSERT INTO tbl_client VALUES(1, 'Zapp Brannigan');
INSERT INTO tbl_client VALUES(2, "Al Gore's Head");
INSERT INTO tbl_client VALUES(3, 'Barbados Slim');
INSERT INTO tbl_client VALUES(4, 'Ogden Wernstrom');
INSERT INTO tbl_client VALUES(5, 'Leo Wong');
INSERT INTO tbl_client VALUES(6, 'Lrrr');
INSERT INTO tbl_client VALUES(7, 'John Zoidberg');
INSERT INTO tbl_client VALUES(8, 'John Zoidfarb');
INSERT INTO tbl_client VALUES(9, 'Morbo');
INSERT INTO tbl_client VALUES(10, 'Judge John Whitey');
INSERT INTO tbl_client VALUES(11, 'Calculon');


CREATE TABLE tbl_package
 (
  shipment_id INTEGER NOT NULL,
  package_number INTEGER NOT NULL,
  contents TEXT NOT NULL,
  weight REAL NOT NULL,
  sender INTEGER NOT NULL,
  recipient INTEGER NOT NULL,
  PRIMARY KEY(shipment_id, package_number),
  FOREIGN KEY (shipment_id) REFERENCES tbl_shipment(shipment_id),
  FOREIGN KEY (sender) REFERENCES tbl_client(account_number),
  FOREIGN KEY (recipient) REFERENCES tbl_client(account_number)
);


INSERT INTO tbl_package VALUES(1, 1, 'Undeclared', 1.5, 1, 2);
INSERT INTO tbl_package VALUES(2, 1, 'Undeclared', 10.0, 2, 3);
INSERT INTO tbl_package VALUES(2, 2, 'A bucket of krill', 2.0, 8, 7);
INSERT INTO tbl_package VALUES(3, 1, 'Undeclared', 15.0, 3, 4);
INSERT INTO tbl_package VALUES(3, 2, 'Undeclared', 3.0, 5, 1);
INSERT INTO tbl_package VALUES(3, 3, 'Undeclared', 7.0, 2, 3);
INSERT INTO tbl_package VALUES(4, 1, 'Undeclared', 5.0, 4, 5);
INSERT INTO tbl_package VALUES(4, 2, 'Undeclared', 27.0, 1, 2);
INSERT INTO tbl_package VALUES(5, 1, 'Undeclared', 100.0, 5, 1);



==> Who recevied 1.5 kg package_number
select recipient from tbl_package where weight = 1.5

select name from tbl_employee where employee_id = (select recipient from tbl_package where weight = 1.5);
----------- or -----------------
select name from tbl_employee JOIN tbl_package 
on tbl_employee.employee_id = tbl_package.recipient 
where weight=1.5;


==> Total weight of packages sent by Turanga Leela(employee_id = 2);

select sum(weight), employee_id from tbl_package JOIN tbl_employee 
ON tbl_package.recipient = tbl_employee.employee_id 
where tbl_employee.name = 'Turanga Leela'

==> 

SELECT tbl_employee.name
FROM tbl_employee
  JOIN tbl_shipment 
  ON tbl_shipment.manager = tbl_employee.employee_id 
  JOIN tbl_package 
  ON tbl_package.shipment_id = tbl_shipment.shipment_id 
 WHERE tbl_shipment.shipment_id IN (
	SELECT p.shipment_id 
	FROM tbl_client AS c 
    JOIN tbl_package as P 
    ON c.account_number = p.sender
  WHERE c.account_number = (
    SELECT tbl_client.account_number
    FROM tbl_client JOIN tbl_package 
      ON tbl_client.account_number = tbl_package.recipient 
    WHERE tbl_package.weight = 1.5
  )
)group by (tbl_employee.name);


select recipient from tbl_package  
where weight = 1.5; 

//--------- my version ----------


SELECT tbl_employee.name
FROM tbl_employee
  JOIN tbl_shipment 
  ON tbl_shipment.manager = tbl_employee.employee_id 
  JOIN tbl_package 
  ON tbl_package.shipment_id = tbl_shipment.shipment_id 
 WHERE tbl_shipment.shipment_id IN (
	
select tbl_package.shipment_id from tbl_package 
JOIN tbl_client 
ON tbl_package.sender = tbl_client.account_number 
where tbl_package.sender = 
 (
    select recipient from tbl_package  
	where weight = 1.5 
  )

)group by (tbl_employee.name);
//---------------

select tbl_employee.name 
from tbl_employee  
JOIN tbl_shipment  
ON tbl_shipment.manager = tbl_employee.employee_id 
where tbl_shipment.shipment_id IN 
(
	
select tbl_package.shipment_id from tbl_package 
JOIN tbl_client 
ON tbl_package.sender = tbl_client.account_number 
where tbl_package.sender = 
 (
    select recipient from tbl_package  
	where weight = 1.5 
  )

);











