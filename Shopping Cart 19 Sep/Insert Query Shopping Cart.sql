
INSERT INTO tbl_user ( user_id ,  user_email_id ,  user_password ,  date_added ) 
VALUES 
('1', 'abc.def@yahoo.com', 'abc', '2016-08-16'), /* 16 Aug 2016*/
('2', 'abc1@gmail.com', 'abc1', '2017-01-12'); /* 12 Jna 2017 */

INSERT INTO tbl_address  
( address_id ,  address ,  city ,  state ,  phone_number1 ,  phone_number2 ) 
VALUES 
('1', '5100, Wilson Hills', 'Missisauga', '1', '6785464354', NULL), 
('2', '438, Erin Mills', 'Missisauga', '1', '6756478987', NULL);

INSERT INTO tbl_brand ( brand_id ,  brand_name ,  user_id ,  date_added )
VALUES 
('1', 'Apple','1', '2017-07-12'),
('2', 'HTC',  '1', '2017-05-19'),
('3', 'Samsung', '1', '2017-01-12'),
('4', 'Sony',  '1', '2017-02-19');
('5', 'Rogers',  '2', '2017-02-19');

INSERT INTO tbl_category ( catergory_id ,  category_name ,  description ,  user_id ,  date_added ) 
VALUES 
('1', 'Cell Phone', 'Apple Phones', '1', '2016-12-14'),
('2', 'Htc Phones', 'HTC Phones', '2', '2017-03-15'),
('3', 'Apple Watch', 'Apple Watch', '2', '2016-03-15'),
('4', 'MacBook Pro', 'Mac Book Pro', '2', '2017-05-28');


INSERT INTO tbl_product
( product_id ,  product_name ,  product_description ,  product_model ,  price ,  points ,  
weight ,  height ,  widht ,  rating ,  date_added ,  brand_id ,  category_id ,  user_id ) 
VALUES 
('1', 'Apple 6', 'Apple 6 phone', 'Model 6', '600.00', '30', '156.89', '5.3', '3.4', '4', '2017-11-17', '1', '1', '1'),
('2', 'Apple 6 PLUS', 'Apple 6 PLUS phone', 'Model 6 PLUS', '750.00', '45', '166.89', '5.8', '3.8', '5', '2016-07-17', '1', '1', '1'),
('3', 'HTC ', 'phone', 'HTC X', '450.00', '15', '106.70', '5.1', '4.1', '3', '2017-03-17', '2', '2', '1'),
('4', 'Built-in GPS', 'With built-in GPS, Apple Watch Series 2 can record precise distance, speed and pace.', 
		'Built-in GPS', '529.99', '15', '34.2', '3.64', '4.25', '2', '2017-06-21', '1', '3', '2'),
('5', 'Apple Watch Series 2', 'Rose Gold Aluminum Case with Pink Sand Sport Band', 
		'Apple Watch Series 2', '399.99', '21', '28.2', '3.84', '3.33', '3', '2017-09-1', '1', '3', '2'),
('6', '13-Inch MacBook Air', '13-Inch MacBook Air', 
		'MQD32LL/A', '1999.99', '60', '780.78', '13.84', '23.67', '4', '2017-09-30', '1', '4', '1'),
('7', 'Rogers Pixel ', 'Phone by Google 32GB - Quite Black - 2 ', 'Pixel', '99.00', '5', '138.17', '6.95', '5.6', '1', '2017-04-14', '5', '1', '1'),
		
		
INSERT INTO tbl_state (state_id, state_name) 
VALUES 
 ('1', 'Ontorio'),
 ('2', 'British Columbia'),
 ('3', 'Quebec'),
 ('4', 'Alberta'),
 ('5', 'Nova Scotia'),
 ('6', 'Manitoba'),
 ('7', 'New Brunswick'),
 ('8', 'Sasketchewan'),
 ('9', 'NewFounLand and Labrador');
 
INSERT INTO tbl_status (status_id, name) VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Canceled'),
(5, 'Complete'),
(6, 'Denied'),
(7, 'Canceled Reversal'),
(8,'Failed'),
(9,'Refunded'),
(10, 'Reversed'),
(11, 'Chargeback'),
(12, 'Voided'),
(13, 'Processed'),
(14, 'Expired');




