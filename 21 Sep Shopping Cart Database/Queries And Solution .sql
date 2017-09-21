Query List

Insert Into Cart is left 

Points Covered 

SubQuery
Group By 
NOT IN
Function Match()
TRIGGER
Alter Table
Update Table Value with/without SubQuery
JOIN
AND , Between , or in whare clouse


1) List the customers who has given 2 phone numbers;
	
	select concat(first_name, '  ',last_name ) as 'Customer Name' 
	from tbl_customer where address_id = (
	select address_id from tbl_address 
	where phone_number1 is not null and phone_number2 is not null );

	/*    Show Phone Number also   */
Points : SubQuery , NOT NULL, CONCAT
	
2) List the Brand That has no products.
	
	select * from tbl_brand 
	where brand_id NOT IN (SELECT brand_id FROM `tbl_product` group by brand_id) ;
	
Points : Group By & NOT IN	

3) List the Customer who have 'harvy' in their email address.
	 
	select * from tbl_customer where MATCH(email_address) AGAINST ('harvy'); // running 
	or
	select * from tbl_customer where email_address like '%harvy%';
	
Points : Use of Function Match() & LIKE

  Create Trigger after insert Order  update the customer Points.

	CREATE TRIGGER Trigger_point 
	AFTER INSERT ON tbl_order
	FOR EACH ROW
	BEGIN
		
	END



Points : Use of Triggers.

5)  Add Points Field to the customer table;

	ALTER TABLE tbl_product ADD COLUMN points1 int(10) NOT NULL  AFTER date_added;
	
Points :  Alter Table
  
6)  Update Price of product 'Apple 6 PLUS' with new price 780
	
	Update tbl_product set price=780 
	where product_name = 'Apple 6 PLUS';
	
Points :  Update Table Value
	
7)  Show Order_staus where order is placed by customer lastname is 'Ross' and first Name is ' Mick'; 

/*  show status from status table )

	select tbl_order.order_status from tbl_order
	JOIN tbl_customer
	ON tbl_order.customer_id = tbl_customer.customer_id
	where tbl_customer.customer_id = 
	(
	select customer_id from tbl_customer where first_name = 'Mick' and last_name = 'Ross'
	)
	
	*/
	
	select tbl_order.order_status,tbl_status.status from tbl_order
	JOIN tbl_status
	ON tbl_order.order_status = tbl_status.status_id
	JOIN tbl_customer
	ON tbl_order.customer_id = tbl_customer.customer_id
	where tbl_customer.customer_id = 
	(
	select customer_id from tbl_customer where first_name = 'Mick' and last_name = 'Ross'
	)
	
/*	
	select tbl_customer.customer_id, tbl_order.order_status,tbl_status.status from tbl_order
	JOIN tbl_status
	ON tbl_order.order_status = tbl_status.status
	JOIN tbl_customer
	ON tbl_order.customer_id = tbl_customer.customer_id
	where tbl_customer.customer_id = 
	(
	select tbl_customer.customer_id from tbl_customer where tbl_customer.first_name = 'Mick' and tbl_customer.last_name = 'Ross'
	) 
	
	*/
	
Points : JOIN applied in Query with AND in where condition.

8) 	Update state in address table where customer_id = 3;

	Update tbl_address set state = (select state_id from tbl_state where state_name = 'Manitoba') 
	where customer_id = 3;

Points : Update Table Field value with SubQuery.


9)	List The Letest Added Product name in thier category with its brand name.

	select tbl_product.product_name, tbl_category.category_name, tbl_brand.brand_name,   
	timestampdiff(day, tbl_product.date_added, curdate()) as 'Added before Days' 
	from tbl_product
	JOIN tbl_category
	ON tbl_product.category_id = tbl_category.catergory_id 
	JOIN tbl_brand 
	ON tbl_brand.brand_id = tbl_product.brand_id 
	group by tbl_product.category_id;

10) List the minimum price product for each category of Apple Brand.

	Select product_name, product_model, min(price), tbl_brand.brand_name, tbl_category.category_name
	from tbl_product
	JOIN tbl_category
	ON tbl_product.category_id = tbl_category.catergory_id 
	JOIN tbl_brand 
	ON tbl_brand.brand_id = tbl_product.brand_id 
	where tbl_brand.brand_name = 'Apple' 
	group by tbl_product.category_id;
	
05) Create Procedure that gives you total purchase amount of provided customer ID.

CREATE PROCEDURE total_purchase_of_customer(VAR_CUSTOMER_ID INT)
BEGIN
	SELECT SUM(total) from tbl_order where customer_id = VAR_CUSTOMER_ID ;
END

call total_purchase_of_customer(1);

create procedure procedure_3(VAR_CUSTOMER_ID int(10))
BEGIN
	select * from tbl_status where status_id = sta_id  ;
END //


11) Show total percahse of customer uptill now.

	

12) Show product Name , Modle and Price whoes price is between 99 to 299.

	select product_name, product_model, price from tbl_product
		where price between 99 and 599;



Update tbl_order set tbl_order.order_status = (select status_id from tbl_status where status = 'Refunded') 
JOIN tbl_customer
	ON tbl_order.customer_id = tbl_customer.customer_id
	where tbl_customer.customer_id = 
	(
	select customer_id from tbl_customer where first_name = 'Mick' and last_name = 'Ross'
	)
	
	
	