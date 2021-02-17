USE `nispcorework`;
DROP procedure IF EXISTS `INPUT_CUSTOMER`;

DELIMITER $$
USE `nispcorework`$$
CREATE PROCEDURE `INPUT_CUSTOMER` (IN Custid INT(11),IN Name varchar(255))
BEGIN
  insert into t_customer(customer_id,customer_name) values(Custid,Name);
END;$$

DELIMITER ;


USE `nispcorework`;
DROP procedure IF EXISTS `INPUT_TRANSACTION`;

DELIMITER $$
USE `nispcorework`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `INPUT_TRANSACTION`(IN transdate datetime,
  IN transdescription varchar(255),
  IN debitcredit_status varchar(1),
  IN amount decimal(18,2),
  IN customer_id int(11)
 )
BEGIN
insert into t_transaction
(trans_date,trans_description,trans_debitcredit_status,trans_amount,trans_customer_id) 
values(transdate,transdescription,debitcredit_status,amount,customer_id);
END$$

DELIMITER ;


USE `nispcorework`;
DROP procedure IF EXISTS `CALC_POINT`;

DELIMITER $$
USE `nispcorework`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CALC_POINT`(
  IN transdescription varchar(255),
  IN amount decimal(18,2),
  IN p_customer_id int(11)
  )
BEGIN

DECLARE temp INT;
DECLARE temp_mod INT;
DECLARE temp_trans_amount INT;
DECLARE tpoint INT;
DECLARE p_cust_name varchar(255);

if transdescription = 'BELI PULSA' then
  set temp_trans_amount = amount;
  set tpoint = 0;
  set temp_mod = 0;
  while temp_trans_amount > 0 do
      if temp_trans_amount > 30000 then 
         set temp_mod = temp_trans_amount - 30000;
         set temp_trans_amount = temp_trans_amount - temp_mod;
         set tpoint = tpoint + (( temp_mod / 1000 ) * 2);
      else if temp_trans_amount >= 10001 and temp_trans_amount <= 30000 then 
         set temp_mod = temp_trans_amount - 10000;
		 set temp_trans_amount = temp_trans_amount - temp_mod;
		 set tpoint = tpoint + (( temp_mod / 1000 ) * 1);
	  else if temp_trans_amount >= 0 and temp_trans_amount <= 10000 then 
          set temp_trans_amount = temp_trans_amount - 10000;
          set tpoint = tpoint + 0;
	  end if;
      end if;
      end if;
  end while;
end if;

 if transdescription = 'BELI LISTRIK' then
  set temp_trans_amount = amount;
  set tpoint = 0;
  set temp_mod = 0;
  while temp_trans_amount > 0 do
      if temp_trans_amount > 100000 then 
         set temp_mod = temp_trans_amount - 100000;
         set temp_trans_amount = temp_trans_amount - temp_mod;
         set tpoint = tpoint + (( temp_mod / 2000 ) * 2);
      else if temp_trans_amount >= 50001 and temp_trans_amount <= 100000 then 
         set temp_mod = temp_trans_amount - 50000;
		 set temp_trans_amount = temp_trans_amount - temp_mod;
		 set tpoint = tpoint + (( temp_mod / 2000 ) * 1);
	  else if temp_trans_amount >= 0 and temp_trans_amount <= 50000 then 
          set temp_trans_amount = temp_trans_amount - 50000;
          set tpoint = tpoint + 0;
	  end if;
      end if;
      end if;
  end while;
end if;
select customer_name into p_cust_name
     from t_customer 
      where customer_id = p_customer_id;
      
insert into t_point(point_cust_id,point_cust_name,point_total,point_trans_date) 
values(p_customer_id,p_cust_name,tpoint,now());


END
DELIMITER ;

USE `nispcorework`;
DROP procedure IF EXISTS `SUMMARY_POINT`;

DELIMITER $$
USE `nispcorework`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SUMMARY_POINT`()
BEGIN
/* RE-GENERATE SUMMARY CUSTOMER POINT */
DELETE FROM t_sum_point;

INSERT INTO t_sum_point(cust_id,cust_name,point_grand_total,point_sum_trans_date) SELECT point_cust_id, point_cust_name, sum(point_total), now() from t_point group by point_cust_id;

     
END$$

DELIMITER ;