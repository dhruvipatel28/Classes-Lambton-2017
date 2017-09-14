-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
-- 1.11 Select the product name, price, and manufacturer name of all the products.
-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
-- 1.15 Select the name and price of the cheapest product.
-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.



============  Answer 1.10 ===========
select P.Code as Product_Code , P.Name as Product_Name , P.Price as Producy_Price , M.Code as Manufacturer_Code , M.Name as Manuacturer_Name 
from Products P , Manufacturers M 
where P.manufacturers = M.Code;


select * form Products as p INNER JOIN Manufacturers as m on p.manufacturers = m.code 

+------+-----------------+-------+---------------+------+-----------------+
| Code | Name            | Price | manufacturers | Code | Name            |
+------+-----------------+-------+---------------+------+-----------------+
|    5 | Monitor         |   240 |             1 |    1 | Sony            |
|    6 | DVD drive       |   180 |             2 |    2 | Creative Labs   |
|    7 | CD drive        |    90 |             2 |    2 | Creative Labs   |
|   10 | DVD burner      |   180 |             2 |    2 | Creative Labs   |
|    8 | Printer         |   270 |             3 |    3 | Hewlett-Packard |
|    9 | Toner cartridge |    66 |             3 |    3 | Hewlett-Packard |
|    3 | ZIP drive       |   150 |             4 |    4 | Iomega          |
|    1 | Hard drive      |   240 |             5 |    5 | Fujitsu         |
|    2 | Memory          |   120 |             6 |    6 | Winchester      |
|    4 | Floppy disk     |     5 |             6 |    6 | Winchester      |
+------+-----------------+-------+---------------+------+-----------------+

============  Answer 1.11 ===========

select P.Name as Product_Name ,P.Price as Producy_Price , M.Name as Manuacturer_Name 
from Products P , Manufacturers M
where P.manufacturers = M.Code;


+-----------------+---------------+------------------+
| Product_Name    | Producy_Price | Manuacturer_Name |
+-----------------+---------------+------------------+
| Monitor         |           240 | Sony             |
| DVD drive       |           180 | Creative Labs    |
| CD drive        |            90 | Creative Labs    |
| DVD burner      |           180 | Creative Labs    |
| Printer         |           270 | Hewlett-Packard  |
| Toner cartridge |            66 | Hewlett-Packard  |
| ZIP drive       |           150 | Iomega           |
| Hard drive      |           240 | Fujitsu          |
| Memory          |           120 | Winchester       |
| Floppy disk     |             5 | Winchester       |
+-----------------+---------------+------------------+

============  Answer 1.12 / 1.13 ===========


 select  avg(P.price) , M.Code , M.Name  
 from  Products P ,manufacturers  M 
 where  M.Code = P.manufacturers 
 group by m.code

+--------------+------+-----------------+
| avg(P.price) | Code | Name            |
+--------------+------+-----------------+
|          240 |    1 | Sony            |
|          150 |    2 | Creative Labs   |
|          168 |    3 | Hewlett-Packard |
|          150 |    4 | Iomega          |
|          240 |    5 | Fujitsu         |
|         62.5 |    6 | Winchester      |
+--------------+------+-----------------+


============ Answer 1.14 ================

SELECT AVG(Price), Manufacturers.Name  
FROM Products, Manufacturers  
WHERE Products.Manufacturers = Manufacturers.Code  
GROUP BY Manufacturers.Name  
HAVING AVG(Price) >= 150;


+------------+-----------------+
| AVG(Price) | Name            |
+------------+-----------------+
|        150 | Creative Labs   |
|        240 | Fujitsu         |
|        168 | Hewlett-Packard |
|        150 | Iomega          |
|        240 | Sony            |
+------------+-----------------+


================ Answer 1.15 ======================

select Name , min(Price )from Products P ;


+------------+-------------+
| Name       | min(Price ) |
+------------+-------------+
| Hard drive |           5 |
+------------+-------------+


=================== Answer 1.16 ================

 SELECT  Manufacturers.Name , Products.Name , Max(Products.price)    FROM Products, Manufacturers ;
+------+------------+---------------------+
| Name | Name       | Max(Products.price) |
+------+------------+---------------------+
| Sony | Hard drive |                 270 |
+------+------------+---------------------+

