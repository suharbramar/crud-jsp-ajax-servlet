CREATE DATABASE NISPCOREWORK;

DROP TABLE IF EXISTS t_customer;
CREATE TABLE t_customer (
  customer_id int(11) NOT NULL,
  customer_name varchar(255) NOT NULL,
  PRIMARY KEY (customer_id)
);

DROP TABLE IF EXISTS t_transaction;
CREATE TABLE t_transaction (
  trans_id int(11) NOT NULL AUTO_INCREMENT,
  trans_date datetime NOT NULL,
  trans_description varchar(255) NOT NULL,
  trans_debitcredit_status varchar(1) NOT NULL,
  trans_amount decimal(18,2) NOT NULL,
  trans_customer_id int(11) NOT NULL,
  PRIMARY KEY (trans_id),
  KEY FK_TRANS(trans_customer_id),
  CONSTRAINT FK_CUSTOMER_ID FOREIGN KEY (trans_customer_id) REFERENCES t_customer (customer_id)
);

DROP TABLE IF EXISTS t_point;
CREATE TABLE t_point (
  point_id int(11) NOT NULL AUTO_INCREMENT,
  point_cust_id int(11) NOT NULL,
  point_cust_name varchar(255) NOT NULL,
  point_total int(11) NOT NULL default 0,
  point_trans_date datetime NOT NULL,
  PRIMARY KEY (point_id,point_cust_id)
);

DROP TABLE IF EXISTS t_sum_point;
CREATE TABLE t_sum_point (
  cust_id int(11) NOT NULL,
  cust_name varchar(255) NOT NULL,
  point_grand_total int(11) NOT NULL default 0,
  point_sum_trans_date datetime NOT NULL,
  PRIMARY KEY (cust_id)
);


