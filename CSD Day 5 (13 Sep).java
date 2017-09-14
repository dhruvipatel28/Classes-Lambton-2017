https://dev.mysql.com/doc/refman/5.7/en/parameters-table.html

/*
Schema
Check Constrain


# mysqldump --single-transaction -u root -p --databases mytestdb > C:/Users/719320/Downloads/dumpMyTestDb.sql



*/


 desc information_schema.columns;
+--------------------------+---------------------+------+-----+---------+-------+
| Field                    | Type                | Null | Key | Default | Extra |
+--------------------------+---------------------+------+-----+---------+-------+
| TABLE_CATALOG            | varchar(512)        | NO   |     |         |       |
| TABLE_SCHEMA             | varchar(64)         | NO   |     |         |       |
| TABLE_NAME               | varchar(64)         | NO   |     |         |       |
| COLUMN_NAME              | varchar(64)         | NO   |     |         |       |
| ORDINAL_POSITION         | bigint(21) unsigned | NO   |     | 0       |       |
| COLUMN_DEFAULT           | longtext            | YES  |     | NULL    |       |
| IS_NULLABLE              | varchar(3)          | NO   |     |         |       |
| DATA_TYPE                | varchar(64)         | NO   |     |         |       |
| CHARACTER_MAXIMUM_LENGTH | bigint(21) unsigned | YES  |     | NULL    |       |
| CHARACTER_OCTET_LENGTH   | bigint(21) unsigned | YES  |     | NULL    |       |
| NUMERIC_PRECISION        | bigint(21) unsigned | YES  |     | NULL    |       |
| NUMERIC_SCALE            | bigint(21) unsigned | YES  |     | NULL    |       |
| DATETIME_PRECISION       | bigint(21) unsigned | YES  |     | NULL    |       |
| CHARACTER_SET_NAME       | varchar(32)         | YES  |     | NULL    |       |
| COLLATION_NAME           | varchar(32)         | YES  |     | NULL    |       |
| COLUMN_TYPE              | longtext            | NO   |     | NULL    |       |
| COLUMN_KEY               | varchar(3)          | NO   |     |         |       |
| EXTRA                    | varchar(27)         | NO   |     |         |       |
| PRIVILEGES               | varchar(80)         | NO   |     |         |       |
| COLUMN_COMMENT           | varchar(1024)       | NO   |     |         |       |
+--------------------------+---------------------+------+-----+---------+-------+




select table_name  from information_schema.columns;



big result;



select  COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT
    ->   FROM INFORMATION_SCHEMA.COLUMNS
    -> where table_name = 'pet'
    -> and table_schema = 'mytestdb';
+-------------+-----------+-------------+----------------+
| COLUMN_NAME | DATA_TYPE | IS_NULLABLE | COLUMN_DEFAULT |
+-------------+-----------+-------------+----------------+
| name        | varchar   | YES         | NULL           |
| owner       | varchar   | YES         | NULL           |
| species     | varchar   | YES         | NULL           |
| sex         | char      | YES         | NULL           |
| birth       | date      | YES         | NULL           |
| death       | date      | YES         | NULL           |
+-------------+-----------+-------------+----------------+


use information_schema


desc tables;
+-----------------+---------------------+------+-----+---------+-------+
| Field           | Type                | Null | Key | Default | Extra |
+-----------------+---------------------+------+-----+---------+-------+
| TABLE_CATALOG   | varchar(512)        | NO   |     |         |       |
| TABLE_SCHEMA    | varchar(64)         | NO   |     |         |       |
| TABLE_NAME      | varchar(64)         | NO   |     |         |       |
| TABLE_TYPE      | varchar(64)         | NO   |     |         |       |
| ENGINE          | varchar(64)         | YES  |     | NULL    |       |
| VERSION         | bigint(21) unsigned | YES  |     | NULL    |       |
| ROW_FORMAT      | varchar(10)         | YES  |     | NULL    |       |
| TABLE_ROWS      | bigint(21) unsigned | YES  |     | NULL    |       |
| AVG_ROW_LENGTH  | bigint(21) unsigned | YES  |     | NULL    |       |
| DATA_LENGTH     | bigint(21) unsigned | YES  |     | NULL    |       |
| MAX_DATA_LENGTH | bigint(21) unsigned | YES  |     | NULL    |       |
| INDEX_LENGTH    | bigint(21) unsigned | YES  |     | NULL    |       |
| DATA_FREE       | bigint(21) unsigned | YES  |     | NULL    |       |
| AUTO_INCREMENT  | bigint(21) unsigned | YES  |     | NULL    |       |
| CREATE_TIME     | datetime            | YES  |     | NULL    |       |
| UPDATE_TIME     | datetime            | YES  |     | NULL    |       |
| CHECK_TIME      | datetime            | YES  |     | NULL    |       |
| TABLE_COLLATION | varchar(32)         | YES  |     | NULL    |       |
| CHECKSUM        | bigint(21) unsigned | YES  |     | NULL    |       |
| CREATE_OPTIONS  | varchar(2048)       | YES  |     | NULL    |       |
| TABLE_COMMENT   | varchar(2048)       | NO   |     |         |       |
+-----------------+---------------------+------+-----+---------+-------+



select * from tables where table_schema = 'mytestdb'
    -> ;
+---------------+--------------+---------------+------------+--------+---------+------------+------------+----------------+-------------+-----------------+--------------+-----------+----------------+---------------------+-------------+------------+-------------------+----------+----------------+---------------+
| TABLE_CATALOG | TABLE_SCHEMA | TABLE_NAME    | TABLE_TYPE | ENGINE | VERSION | ROW_FORMAT | TABLE_ROWS | AVG_ROW_LENGTH | DATA_LENGTH | MAX_DATA_LENGTH | INDEX_LENGTH | DATA_FREE | AUTO_INCREMENT | CREATE_TIME         | UPDATE_TIME | CHECK_TIME | TABLE_COLLATION   | CHECKSUM | CREATE_OPTIONS | TABLE_COMMENT |
+---------------+--------------+---------------+------------+--------+---------+------------+------------+----------------+-------------+-----------------+--------------+-----------+----------------+---------------------+-------------+------------+-------------------+----------+----------------+---------------+
| def           | mytestdb     | manufacturers | BASE TABLE | InnoDB |      10 | Compact    |          6 |           2730 |       16384 |               0 |            0 |         0 |           NULL | 2017-09-12 18:04:44 | NULL        | NULL       | latin1_swedish_ci |     NULL |                |               |
| def           | mytestdb     | pet           | BASE TABLE | InnoDB |      10 | Compact    |          9 |           1820 |       16384 |               0 |            0 |         0 |           NULL | 2017-09-08 18:30:23 | NULL        | NULL       | latin1_swedish_ci |     NULL |                |               |
| def           | mytestdb     | products      | BASE TABLE | InnoDB |      10 | Compact    |         10 |           1638 |       16384 |               0 |            0 |         0 |           NULL | 2017-09-12 17:57:49 | NULL        | NULL       | latin1_swedish_ci |     NULL |                |               |
| def           | mytestdb     | student       | BASE TABLE | InnoDB |      10 | Compact    |          5 |           3276 |       16384 |               0 |            0 |         0 |           NULL | 2017-09-06 20:50:21 | NULL        | NULL       | latin1_swedish_ci |     NULL |                |               |
| def           | mytestdb     | t             | BASE TABLE | InnoDB |      10 | Compact    |          0 |              0 |       16384 |               0 |            0 |         0 |           NULL | 2017-09-06 18:41:00 | NULL        | NULL       | latin1_swedish_ci |     NULL |                |               |
+---------------+--------------+---------------+------------+--------+---------+------------+------------+----------------+-------------+-----------------+--------------+-----------+----------------+---------------------+-------------+------------+-------------------+----------+----------------+---------------+

select * from tables where table_schema = 'mytestdb'\G;
*************************** 1. row ***************************
  TABLE_CATALOG: def
   TABLE_SCHEMA: mytestdb
     TABLE_NAME: manufacturers
     TABLE_TYPE: BASE TABLE
         ENGINE: InnoDB
        VERSION: 10
     ROW_FORMAT: Compact
     TABLE_ROWS: 6
 AVG_ROW_LENGTH: 2730
    DATA_LENGTH: 16384
MAX_DATA_LENGTH: 0
   INDEX_LENGTH: 0
      DATA_FREE: 0
 AUTO_INCREMENT: NULL
    CREATE_TIME: 2017-09-12 18:04:44
    UPDATE_TIME: NULL
     CHECK_TIME: NULL
TABLE_COLLATION: latin1_swedish_ci
       CHECKSUM: NULL
 CREATE_OPTIONS:
  TABLE_COMMENT:
*************************** 2. row ***************************
  TABLE_CATALOG: def
   TABLE_SCHEMA: mytestdb
     TABLE_NAME: pet
     TABLE_TYPE: BASE TABLE
         ENGINE: InnoDB
        VERSION: 10
     ROW_FORMAT: Compact
     TABLE_ROWS: 9
 AVG_ROW_LENGTH: 1820
    DATA_LENGTH: 16384
MAX_DATA_LENGTH: 0
   INDEX_LENGTH: 0
      DATA_FREE: 0
 AUTO_INCREMENT: NULL
    CREATE_TIME: 2017-09-08 18:30:23
    UPDATE_TIME: NULL
     CHECK_TIME: NULL
TABLE_COLLATION: latin1_swedish_ci
       CHECKSUM: NULL
 CREATE_OPTIONS:
  TABLE_COMMENT:
*************************** 3. row ***************************
  TABLE_CATALOG: def
   TABLE_SCHEMA: mytestdb
     TABLE_NAME: products
     TABLE_TYPE: BASE TABLE
         ENGINE: InnoDB
        VERSION: 10
     ROW_FORMAT: Compact
     TABLE_ROWS: 10
 AVG_ROW_LENGTH: 1638
    DATA_LENGTH: 16384
MAX_DATA_LENGTH: 0
   INDEX_LENGTH: 0
      DATA_FREE: 0
 AUTO_INCREMENT: NULL
    CREATE_TIME: 2017-09-12 17:57:49
    UPDATE_TIME: NULL
     CHECK_TIME: NULL
TABLE_COLLATION: latin1_swedish_ci
       CHECKSUM: NULL
 CREATE_OPTIONS:
  TABLE_COMMENT:
*************************** 4. row ***************************
  TABLE_CATALOG: def
   TABLE_SCHEMA: mytestdb
     TABLE_NAME: student
     TABLE_TYPE: BASE TABLE
         ENGINE: InnoDB
        VERSION: 10
     ROW_FORMAT: Compact
     TABLE_ROWS: 5
 AVG_ROW_LENGTH: 3276
    DATA_LENGTH: 16384
MAX_DATA_LENGTH: 0
   INDEX_LENGTH: 0
      DATA_FREE: 0
 AUTO_INCREMENT: NULL
    CREATE_TIME: 2017-09-06 20:50:21
    UPDATE_TIME: NULL
     CHECK_TIME: NULL
TABLE_COLLATION: latin1_swedish_ci
       CHECKSUM: NULL
 CREATE_OPTIONS:
  TABLE_COMMENT:
*************************** 5. row ***************************
  TABLE_CATALOG: def
   TABLE_SCHEMA: mytestdb
     TABLE_NAME: t
     TABLE_TYPE: BASE TABLE
         ENGINE: InnoDB
        VERSION: 10
     ROW_FORMAT: Compact
     TABLE_ROWS: 0
 AVG_ROW_LENGTH: 0
    DATA_LENGTH: 16384
MAX_DATA_LENGTH: 0
   INDEX_LENGTH: 0
      DATA_FREE: 0
 AUTO_INCREMENT: NULL
    CREATE_TIME: 2017-09-06 18:41:00
    UPDATE_TIME: NULL
     CHECK_TIME: NULL
TABLE_COLLATION: latin1_swedish_ci
       CHECKSUM: NULL
 CREATE_OPTIONS:
  TABLE_COMMENT:
  
  
  
  
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
  
  
  
  
  

