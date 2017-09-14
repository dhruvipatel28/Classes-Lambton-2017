 create table parts
  (
  parts_id integer(10),
  part_name varchar(50) NOT NULL,
  PRIMARY KEY(parts_id)
  );
  
  create table providers
  (
	code varchar(50),
	provider_name varchar(50) not null,
	PRIMARY KEY (code)
  )
  
  create table final_product
  (
  code integer(10) auto_increment,
  pieces integer(10) references parts(parts_id),
  provider varchar(50) references providers(code),
  Price double(10,2) check (Price > 10),
  PRIMARY KEY (code , pieces , provider)
  
  )
  

INSERT INTO parts(parts_id, part_name) VALUES(1,'Sprocket');
INSERT INTO parts(parts_id, part_name) VALUES(2,'Screw');
INSERT INTO parts(parts_id, part_name) VALUES(3,'Nut');
INSERT INTO parts(parts_id, part_name) VALUES(4,'Bolt');

INSERT INTO providers(Code, provider_name) VALUES('HAL','Clarke Enterprises');
INSERT INTO providers(Code, provider_name) VALUES('RBT','Susan Calvin Corp.');
INSERT INTO providers(Code, provider_name) VALUES('TNBC','Skellington Supplies');


INSERT INTO final_product(pieces, Provider, Price) VALUES(1,'HAL',10);
INSERT INTO final_product(pieces, Provider, Price) VALUES(1,'RBT',15);
INSERT INTO final_product(pieces, Provider, Price) VALUES(2,'HAL',20);
INSERT INTO final_product(pieces, Provider, Price) VALUES(2,'RBT',15);
INSERT INTO final_product(pieces, Provider, Price) VALUES(2,'TNBC',14);
INSERT INTO final_product(pieces, Provider, Price) VALUES(3,'RBT',50);
INSERT INTO final_product(pieces, Provider, Price) VALUES(3,'TNBC',45);
INSERT INTO final_product(pieces, Provider, Price) VALUES(4,'HAL',5);
INSERT INTO final_product(pieces, Provider, Price) VALUES(4,'RBT',7);
  
  
  
show tables;

select * from Pieces;
select * from Providers;
select * from provides; 


select * from final_product;
+------+--------+----------+-------+
| code | pieces | provider | Price |
+------+--------+----------+-------+
|    1 |      1 | HAL      | 11.00 |
|    2 |      1 | RBT      | 16.00 |
|    3 |      2 | HAL      | 21.00 |
|    4 |      2 | RBT      | 16.00 |
|    5 |      2 | TNBC     | 15.00 |
|    6 |      3 | RBT      | 51.00 |
|    7 |      3 | TNBC     | 46.00 |
|    8 |      4 | HAL      |  6.00 |
|    9 |      4 | RBT      |  8.00 |
|   10 |      1 | TNBC     |  8.00 |
+------+--------+----------+-------+

select * from providers;
+------+----------------------+
| code | provider_name        |
+------+----------------------+
| HAL  | Clarke Enterprises   |
| RBT  | Susan Calvin Corp.   |
| TNBC | Skellington Supplies |
+------+----------------------+

select * from parts;
+----------+-----------+
| parts_id | part_name |
+----------+-----------+
|        1 | Sprocket  |
|        2 | Screw     |
|        3 | Nut       |
|        4 | Bolt      |
+----------+-----------+

-- 5.1
-- Select the name of all the pieces. 

select part_name from parts;
+-----------+
| part_name |
+-----------+
| Sprocket  |
| Screw     |
| Nut       |
| Bolt      |
+-----------+

-- 5.2 
-- Select all the providers' data. 
select * from providers;
+------+----------------------+
| code | provider_name        |
+------+----------------------+
| HAL  | Clarke Enterprises   |
| RBT  | Susan Calvin Corp.   |
| TNBC | Skellington Supplies |
+------+----------------------+
 
-- 5.3
-- Obtain the average price of each piece (show only the piece code and the average price).

select pieces , avg(Price) from final_product group by pieces ;
+--------+------------+
| pieces | avg(Price) |
+--------+------------+
|      1 |  12.500000 |
|      2 |  16.333333 |
|      3 |  47.500000 |
|      4 |   6.000000 |
+--------+------------+

-- 5.4 
-- Obtain the names of all providers who supply piece 1.


/* Without subquery */
 
 select provider_name from providers , final_product 
 where final_product.pieces = 1 
 and providers.code = final_product.provider;
 
+--------------------+
| provider_name      |
+--------------------+
| Clarke Enterprises |
| Susan Calvin Corp. |
+--------------------+
 
             
/* With subquery */
 
 select providers.provider_name 
 from providers 
 where providers.code  IN 
 (
 select  provider 
 from final_product  
 where pieces = 1
 );
 
+--------------------+
| provider_name      |
+--------------------+
| Clarke Enterprises |
| Susan Calvin Corp. |
+--------------------+


-- 5.5
-- Select the name of pieces provided by provider with code "HAL".

select parts.part_name from parts 
where parts.parts_id  IN 
(
select pieces from final_product 
where final_product.provider = 'HAL' 
);


select P.part_name 
from parts P 
JOIN final_product fp 
ON  p.parts_id = fp.pieces 
AND fp.provider = 'HAL' ;


+-----------+
| part_name |
+-----------+
| Sprocket  |
| Screw     |
| Bolt      |
+-----------+

/* With EXISTS subquery */   
-- Interesting clause

select part_name from parts 
LEFT  JOIN final_product 
ON parts.parts_id = final_product.pieces 
INTERSECT 
select part_name from parts 
RIGHT  JOIN final_product 
ON parts.parts_id = final_product.pieces;



select code from providers 
INTERSECT 
select code from final_product 


-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Intereting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).

select providers.provider_name As Proider , parts.part_name as Part_Name , final_product.price as Price 
 from providers , parts , final_product 
 where final_product.pieces  = parts.parts_id 
 and final_product.provider = providers.code 
 group by final_product.pieces  
 having max(final_product.Price) ;
 
 
+--------------------+-----------+-------+
| Proider            | Part_Name | Price |
+--------------------+-----------+-------+
| Clarke Enterprises | Sprocket  | 10.00 |
| Clarke Enterprises | Screw     | 20.00 |
| Susan Calvin Corp. | Nut       | 50.00 |
| Clarke Enterprises | Bolt      |  5.00 |
+--------------------+-----------+-------+
 

-- 5.7
-- Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.

INSERT INTO final_product(pieces ,provider, Price) VALUES (1 , 'TNBC' , 7) ;

select * from final_product;
+------+--------+----------+-------+
| code | pieces | provider | Price |
+------+--------+----------+-------+
|    1 |      1 | HAL      | 10.00 |
|    2 |      1 | RBT      | 15.00 |
|    3 |      2 | HAL      | 20.00 |
|    4 |      2 | RBT      | 15.00 |
|    5 |      2 | TNBC     | 14.00 |
|    6 |      3 | RBT      | 50.00 |
|    7 |      3 | TNBC     | 45.00 |
|    8 |      4 | HAL      |  5.00 |
|    9 |      4 | RBT      |  7.00 |
|   10 |      1 | TNBC     |  7.00 |
+------+--------+----------+-------+

-- 5.8
-- Increase all prices by one cent.

update final_product set Price = (Price+1)  ;

 select * from final_product;
+------+--------+----------+-------+
| code | pieces | provider | Price |
+------+--------+----------+-------+
|    1 |      1 | HAL      | 11.00 |
|    2 |      1 | RBT      | 16.00 |
|    3 |      2 | HAL      | 21.00 |
|    4 |      2 | RBT      | 16.00 |
|    5 |      2 | TNBC     | 15.00 |
|    6 |      3 | RBT      | 51.00 |
|    7 |      3 | TNBC     | 46.00 |
|    8 |      4 | HAL      |  6.00 |
|    9 |      4 | RBT      |  8.00 |
|   10 |      1 | TNBC     |  8.00 |
+------+--------+----------+-------+

-- 5.9
-- Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).

delete from final_product where provider = 'RBT' AND pieces = '4';


select * from final_product;
+------+--------+----------+-------+
| code | pieces | provider | Price |
+------+--------+----------+-------+
|    1 |      1 | HAL      | 11.00 |
|    2 |      1 | RBT      | 16.00 |
|    3 |      2 | HAL      | 21.00 |
|    4 |      2 | RBT      | 16.00 |
|    5 |      2 | TNBC     | 15.00 |
|    6 |      3 | RBT      | 51.00 |
|    7 |      3 | TNBC     | 46.00 |
|    8 |      4 | HAL      |  6.00 |
|   10 |      1 | TNBC     |  8.00 |
+------+--------+----------+-------+


-- 5.10
-- Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
-- (the provider should still remain in the database).


DELETE from final_product where provider = 'RBT';

 select * from final_product;
 
+------+--------+----------+-------+
| code | pieces | provider | Price |
+------+--------+----------+-------+
|    1 |      1 | HAL      | 11.00 |
|    3 |      2 | HAL      | 21.00 |
|    5 |      2 | TNBC     | 15.00 |
|    7 |      3 | TNBC     | 46.00 |
|    8 |      4 | HAL      |  6.00 |
|   10 |      1 | TNBC     |  8.00 |
+------+--------+----------+-------+