/* 
Procedures


http://www.mysqltutorial.org/mysql-stored-procedure-tutorial.aspx

https://www.w3resource.com/mysql/mysql-procedure.php

https://code.tutsplus.com/articles/an-introduction-to-stored-procedures-in-mysql-5--net-17843

Corsors

https://www.w3resource.com/mysql/mysql-procedure.php#MCA
Declare Coursors

DECLARE cursor_name 
CURSOR FOR select_statement





*/



delimiter //
create or replace procedure procedure_1()
begin
	select * from tbl_status;
end //
delimiter ;

 call procedure_1;
+-----------+-------------------+
| status_id | status            |
+-----------+-------------------+
|         1 | Pending           |
|         2 | Processing        |
|         3 | Shipped           |
|         4 | Canceled          |
|         5 | Complete          |
|         6 | Denied            |
|         7 | Canceled Reversal |
|         8 | Failed            |
|         9 | Refunded          |
|        10 | Reversed          |
|        11 | Chargeback        |
|        12 | Voided            |
|        13 | Processed         |
|        14 | Expired           |
+-----------+-------------------+


/* --------------------   -------------------- */
delimiter //

create or replace procedure procedure_3(sta_id int(10))
BEGIN
	select * from tbl_status where status_id = sta_id  ;
END //

delimiter ;


call procedure_3(8);
+-----------+--------+
| status_id | status |
+-----------+--------+
|         8 | Failed |
+-----------+--------+

/* --------------------  ---------   -------------------- */

delimiter //

create or replace procedure procedure_2(sta_id1 int(10) , sta_id2 int(10))
BEGIN
	select * from tbl_status where status_id between sta_id1 and sta_id2 ;
END //

delimiter ;

call procedure_2(3,8);
+-----------+-------------------+
| status_id | status            |
+-----------+-------------------+
|         3 | Shipped           |
|         4 | Canceled          |
|         5 | Complete          |
|         6 | Denied            |
|         7 | Canceled Reversal |
|         8 | Failed            |
+-----------+-------------------+


/* --------------------  --------------------  -------------------- */
delimiter //

create or replace procedure procedure_4(code_id varchar(30))
BEGIN
	select @provider := Provider from provides where Code = code_id;
	select @provider ;
END //

call procedure_4(4)//
+-----------------------+
| @provider := Provider |
+-----------------------+
| RBT                   |
+-----------------------+
1 row in set (0.00 sec)

+-----------+
| @provider |
+-----------+
| RBT       |
+-----------+

/* --------------------  --------------------  -------------------- */

create or replace procedure procedure_5()
BEGIN
	select * , (Price+30) as 'New Price' from provides; 
END //
call procedure_5//

 call procedure_5//
+------+-------+----------+-------+-----------+
| Code | Piece | Provider | Price | New Price |
+------+-------+----------+-------+-----------+
|    1 |     1 | HAL      | 10.00 |     40.00 |
|    2 |     1 | RBT      | 15.00 |     45.00 |
|    3 |     2 | HAL      | 20.00 |     50.00 |
|    4 |     2 | RBT      | 15.00 |     45.00 |
|    5 |     2 | TNBC     | 14.00 |     44.00 |
|    6 |     3 | RBT      | 50.00 |     80.00 |
|    7 |     3 | TNBC     | 45.00 |     75.00 |
|    8 |     4 | HAL      |  5.00 |     35.00 |
|    9 |     4 | RBT      |  7.00 |     37.00 |
+------+-------+----------+-------+-----------+

/* -------------------- procedure with veriable --------------------  -------------------- */
create or replace procedure procedure_6(a int, b int, opt char(1) )
BEGIN
	CASE
		WHEN (opt= '+')
		THEN SET @answer = a+b;
		
		WHEN (opt = '-')
		THEN SET @answer = (a-b);
		
	END CASE;
		select @answer ;
END //

call procedure_6 (10,20,'+')//
+---------+
| @answer |
+---------+
|      30 |
+---------+

/* --------------------  --------------------  -------------------- */
create or replace procedure procedure_7(a int, b int, opt char )
BEGIN
	CASE
		WHEN (opt= '+')
		THEN SET @answer = a+b;
		
		WHEN (opt = '-')
		THEN SET @answer = (a-b);
		
		WHEN (opt = '*')
		THEN SET @answer = (a*b);
		
		WHEN (opt = '/')
		THEN SET @answer = (a/b);
		
	END CASE;
		select @answer ;
END //

call procedure_7 (10,20,'+')//
+---------+
| @answer |
+---------+
|      30 |
+---------+


/* --------------------  -------  create procedure with IN AND OUT   -------------  -------------------- */
create or replace procedure procedure_8(IN a int,IN  b int,IN opt char(1) ,OUT answer int)
BEGIN
	SET @answer = 0;
	CASE
		WHEN (opt= '+')
		THEN SET @answer = a+b;
		
		WHEN (opt = '-')
		THEN SET @answer = (a-b);
		
		WHEN (opt = '*')
		THEN SET @answer = (a*b);
		
		WHEN (opt = '/')
		THEN SET @answer = (a/b);
		
	END CASE;
		select @answer ;
		SET answer = @answer;
END //

call procedure_8(20,30,'*',@total)//
+---------+
| @answer |
+---------+
|     600 |
+---------+

select @total //
+--------+
| @total |
+--------+
|    600 |
+--------+
delimiter ;

/* --------------------  -------   Coursors

Declare Coursors

DECLARE cursor_name 
CURSOR FOR select_statement

-------------  -------------------- */
create or replace procedure procedure_cursor ()
BEGIN
	DECLARE xProvider varchar(25) DEFAULT 'None';
	DECLARE xPrice DECIMAL(10,0) ;
	DECLARE xCode int;
	DECLARE done tinyint DEFAULT 0;
	Declare cur1 CURSOR FOR Select code,Provider,Price from Provides;
	Declare continue  handler for not found set done =1 ;

	open cur1 ;
	read_loop: LOOP 
		FETCH FROM cur1 INTO xCode, xProvider, xPrice;
		IF DONE
			THEN LEAVE read_loop;
		END IF;
		select xCode,xProvider,xPrice;
	END LOOP;
	close cur1;

END//

call procedure_cursor()//

+-------+-----------+--------+
| xCode | xProvider | xPrice |
+-------+-----------+--------+
|     1 | HAL       |     10 |
+-------+-----------+--------+
1 row in set (0.00 sec)

+-------+-----------+--------+
| xCode | xProvider | xPrice |
+-------+-----------+--------+
|     2 | RBT       |     15 |
+-------+-----------+--------+
.
.
.
.
.
+-------+-----------+--------+
| xCode | xProvider | xPrice |
+-------+-----------+--------+
|     9 | RBT       |      7 |
+-------+-----------+--------+


/* --------------------  -------   Coursors -------------  -------------------- */









































