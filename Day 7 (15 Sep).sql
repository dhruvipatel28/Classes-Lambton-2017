Views 
update Views


Exam Save all the querys as views Named like q1,q2,q3

Drop views

Learn About View 
Exam is all about views
RENAME Table

Trigger 
https://dev.mysql.com/doc/refman/5.7/en/trigger-syntax.html


create trigger
drop trigger


//--------- Guidelines for a View in mysql:

INSERTION 
    Primary key and not null columns is manadatory

UPDATATION AND DELETION
    Records will be affection only if that record exsist in that view
    Cannot Modify the physical structure of the tables.
	
	
//------------- Triggers 

create trigger [triger_name] after/before insert/update/delete ON [table_name]
FOR each row
	BEGIN
		{Statments}
	END





mysql> CREATE TRIGGER ins_transaction BEFORE INSERT ON account
       FOR EACH ROW PRECEDES ins_sum
       SET
       @deposits = @deposits + IF(NEW.amount>0,NEW.amount,0),
       @withdrawals = @withdrawals + IF(NEW.amount<0,-NEW.amount,0);
	   
//-----------Rename

RENAME TABLE audio to Audit ;

create table Audit
(
    opration_id integer(10) AUTO_INCREMENT PRIMARY KEY,
    table_name varchar(50) NOT NULL,
    Opration_name varchar(50) NOT NULL,
    opration_date datetime default current_timestamp
	);
	
INSERT INTO Audit (table_name,Opration_name) values('Products' ,'Insert');

select * from Audit;
+-------------+------------+---------------+---------------------+
| opration_id | table_name | Opration_name | opration_date       |
+-------------+------------+---------------+---------------------+
|           1 | Products   | Insert        | 2017-09-15 19:06:24 |
+-------------+------------+---------------+---------------------+

//-------------------- trigger with insert --------------


delimiter //
CREATE TRIGGER insert_check_products AFTER INSERT ON Products
       FOR EACH ROW
       BEGIN
          INSERT INTO Audit(table_name, Opration_name) Values('Products','After_insert');
       END;//
delimiter ;



insert into products values(16,'Apple TV' , 378.78,1);


select * from audit;
+-------------+------------+---------------+---------------------+
| opration_id | table_name | Opration_name | opration_date       |
+-------------+------------+---------------+---------------------+
|           1 | Products   | Insert        | 2017-09-15 19:06:24 |
|           2 | Products   | After_insert  | 2017-09-15 19:13:44 |
+-------------+------------+---------------+---------------------+

//-------------------- trigger for update --------------


delimiter //
create trigger update_check_product after update on Products
for each row 
begin
	insert into audit(table_name,Opration_name) Values('Products' , 'Update');
END //
delimiter ;


select * from Products;


update Products set Name='Mac Mini' where Code = 16;


select * from Audit ;

+-------------+------------+---------------+---------------------+
| opration_id | table_name | Opration_name | opration_date       |
+-------------+------------+---------------+---------------------+
|           1 | Products   | Insert        | 2017-09-15 19:06:24 |
|           2 | Products   | After_insert  | 2017-09-15 19:13:44 |
|           3 | Products   | Update        | 2017-09-15 19:34:13 |
+-------------+------------+---------------+---------------------+


//================ trigger on delete 

delimiter //
create trigger delete_check_products after delete on Products
for each row
begin 
	insert into Audit (table_name , Opration_name) values ('Products','Delete');
END //


delimiter ;


delete from Products where Code = 16;



select * from Products;
+------+-----------------+-------+---------------+
| Code | Name            | Price | manufacturers |
+------+-----------------+-------+---------------+
|    1 | Hard drive      |   240 |             5 |
|    2 | Memory          |   120 |             6 |
|    3 | ZIP drive       |   150 |             4 |
|    4 | Floppy disk     |     5 |             6 |
|    5 | Monitor         |   240 |             1 |
|    6 | DVD drive       |   180 |             2 |
|    7 | CD drive        |    90 |             2 |
|    8 | Printer         |   270 |             3 |
|    9 | Toner cartridge |    66 |             3 |
|   10 | DVD burner      |   180 |             2 |
|   11 | HARD DISK       |   240 |             5 |
+------+-----------------+-------+---------------+

select * from Audit;
+-------------+------------+---------------+---------------------+
| opration_id | table_name | Opration_name | opration_date       |
+-------------+------------+---------------+---------------------+
|           1 | Products   | Insert        | 2017-09-15 19:06:24 |
|           2 | Products   | After_insert  | 2017-09-15 19:13:44 |
|           3 | Products   | Update        | 2017-09-15 19:34:13 |
|           4 | Products   | Delete        | 2017-09-15 19:47:01 |
+-------------+------------+---------------+---------------------+






