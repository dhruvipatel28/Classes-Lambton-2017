CREATE TABLE  tbl_address 
(
  address_id  int(10) NOT NULL AUTO_INCREMENT,
  address  varchar(255) NOT NULL,
  city  varchar(50) NOT NULL,
  state  int(10) NOT NULL,
  phone_number1  int(11) NOT NULL,
  phone_number2  int(11) DEFAULT NULL,
 PRIMARY KEY ( address_id )
) 

CREATE TABLE  tbl_brand  
(
  brand_id  int(10) NOT NULL AUTO_INCREMENT,
  brand_name  varchar(100) NOT NULL,
  user_id  int(10) NOT NULL,
  date_added  date NOT NULL,
 PRIMARY KEY ( brand_id ),
 UNIQUE KEY  unique_brand_name  ( brand_name )
) 

tbl_cart 
CREATE TABLE  tbl_cart  
(
  cart_id  int(11) NOT NULL AUTO_INCREMENT,
  customer_id  int(11) DEFAULT NULL,
  product_id  int(11) DEFAULT NULL,
  quantity  int(5) NOT NULL,
  coupon_id  int(11) DEFAULT NULL,
  date_added  datetime NOT NULL ,
 PRIMARY KEY ( cart_id )
) 

tbl_category	
CREATE TABLE  tbl_category  
(
  catergory_id  int(10) NOT NULL AUTO_INCREMENT,
  category_name  varchar(255) NOT NULL,
  description  text NOT NULL,
  user_id  int(10) NOT NULL,
  date_added  date NOT NULL,
 PRIMARY KEY ( catergory_id )
)

tbl_customer	

CREATE TABLE  tbl_customer  
(
  customer_id  int(10) NOT NULL AUTO_INCREMENT,
  first_name  varchar(50) NOT NULL,
  last_name  varchar(50) NOT NULL,
  email_address  varchar(100) NOT NULL,
  password  varchar(255) NOT NULL,
  address_id  int(10) NOT NULL,
  date_added  date NOT NULL,
  nwesletter  tinyint(1) NOT NULL ,
 PRIMARY KEY ( customer_id ),
 UNIQUE KEY  email_address  ( email_address ),
 UNIQUE KEY  password  ( password ),
 UNIQUE KEY  email_address_2  ( email_address ),
 FOREIGN KEY ( customer_id ) REFERENCES  tbl_address  ( address_id ) ON DELETE CASCADE ON UPDATE NO ACTION
) 

tbl_order	
CREATE TABLE  tbl_order  
(
  order_id  int(11) NOT NULL AUTO_INCREMENT,
  customer_id  int(11) NOT NULL ,
  payment_firstname  varchar(32) NOT NULL,
  payment_lastname  varchar(32) NOT NULL,
  payment_address  int(10) NOT NULL,
  payment_method  varchar(32) NOT NULL,
  shipping_firstname  varchar(32) NOT NULL,
  shipping_lastname  varchar(32) NOT NULL,
  shipping_address  int(10) NOT NULL,
  total  decimal(15,4) NOT NULL,
  order_status  int(11) NOT NULL 
  date_added  date NOT NULL,
  date_modified  date NOT NULL,
 PRIMARY KEY ( order_id ),
 FOREIGN KEY (customer_id) REFERENCES tbl_customer(customer_id),
 FOREIGN KEY (payment_address) REFERENCES tbl_address(address_id),
 FOREIGN KEY (shipping_address) REFERENCES tbl_address(address_id),
 FOREIGN KEY (order_status) REFERENCES tbl_status(status_id),
) 

tbl_product	

CREATE TABLE  tbl_product 
 (
  product_id  int(10) NOT NULL AUTO_INCREMENT,
  product_name  varchar(100) NOT NULL,
  product_description  text NOT NULL,
  product_model  varchar(150) NOT NULL,
  price  double NOT NULL,
  points  int(5) NOT NULL,
  weight  float NOT NULL,
  height  float NOT NULL,
  widht  float NOT NULL,
  rating  int(1) NOT NULL,
  date_added  date NOT NULL,
  brand_id  int(10) NOT NULL ,
  category_id  int(10) NOT NULL ,
  user_id  int(10) NOT NULL ,
 PRIMARY KEY ( product_id ),
 FOREIGN KEY (brand_id) REFERENCES tbl_brand(brand_id),
 FOREIGN KEY (category_id) REFERENCES tbl_category(category_id),
 FOREIGN KEY (user_id) REFERENCES tbl_user(user_id)
)


tbl_state	
CREATE TABLE  tbl_state  
(
  state_id  int(3) NOT NULL AUTO_INCREMENT,
  state_name  varchar(60) NOT NULL,
 PRIMARY KEY ( state_id )
)


tbl_status	
CREATE TABLE  tbl_status  
(
  status_id  int(11) NOT NULL AUTO_INCREMENT,
  status  varchar(32) NOT NULL,
 PRIMARY KEY ( status_id )
) 

tbl_user	
CREATE TABLE  tbl_user  
(
  user_id  int(10) NOT NULL AUTO_INCREMENT,
  user_email_id  tinytext NOT NULL,
  user_password  text NOT NULL,
  date_added  date NOT NULL,
 PRIMARY KEY ( user_id )
) 
