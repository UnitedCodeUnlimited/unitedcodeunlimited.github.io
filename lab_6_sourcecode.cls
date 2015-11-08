SQL Script for Lab #6 Remaining Tables , Primary Keys, and Foreign Keys

Part II “Right Hand SQL Commands”

/* Script for building remaining 7 tables of FLix2You */

/* accounts */
CREATE TABLE accounts(
	account_id int IDENTITY(1,1) NOT NULL,
	customer_id int NOT NULL,
	payment_method_code int NOT NULL,
	account_name varchar(128) NOT NULL,
	account_details varchar(512) NOT NULL);
Command(s) completed successfully.

/* customers */
CREATE TABLE customers(
	customer_id int IDENTITY(1,1) NOT NULL,
	member_yn char(1) NOT NULL,
	membership_number int NOT NULL,
	date_became_member date NOT NULL,
	customer_first_name varchar(32) NOT NULL,
	customer_last_name varchar(32) NOT NULL,
	customer_address varchar(128) NOT NULL,
	customer_phone varchar(13) NOT NULL,
	customer_email varchar(128) NOT NULL,
	customer_dob date NOT NULL);
Command(s) completed successfully.

/* customer_rentals */
CREATE TABLE customer_rentals(
	item_rental_id int IDENTITY(1,1) NOT NULL,
	customer_id int NOT NULL,
	movie_id int NOT NULL,
	rental_status_code int NOT NULL,
	rental_date_out date NOT NULL,
	rental_date_returned date NOT NULL,
	rental_amount_due money NOT NULL,
	other_rental_details varchar(512) NOT NULL);
Command(s) completed successfully.

/* financial_transactions */
CREATE TABLE financial_transactions(
	transaction_id int IDENTITY(1,1) NOT NULL,
	account_id int NOT NULL,
	item_rental_id int NOT NULL,
	previous_transaction_id int NOT NULL,
	transaction_type_code int NOT NULL,
	transaction_date date NOT NULL,
	transaction_amount int NOT NULL,
	transaction_comment varchar(128) NOT NULL);
Command(s) completed successfully.

/* payment_methods */
CREATE TABLE payment_methods(
	payment_method_code int IDENTITY(1,1) NOT NULL,
	payment_method_description varchar(128) NOT NULL);
Command(s) completed successfully.
 
/* rental_status_codes */
CREATE TABLE rental_status_codes(
	rental_status_code int IDENTITY(1,1) NOT NULL,
	rental_status_description varchar(218) NOT NULL);
Command(s) completed successfully.
 
/* transaction_types */
CREATE TABLE transaction_types(
	transaction_type_code int IDENTITY(1,1) NOT NULL,
	transaction_type_description varchar(218) NOT NULL);
Command(s) completed successfully.
 
/* create primary keys */
 ALTER TABLE accounts ADD CONSTRAINT pk_accounts PRIMARY KEY (account_id);
 ALTER TABLE customers ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);
 ALTER TABLE customer_rentals ADD CONSTRAINT pk_customer_rentals PRIMARY KEY (item_rental_id);
 ALTER TABLE financial_transactions ADD CONSTRAINT pk_financial_transactions PRIMARY KEY (transaction_id);
 ALTER TABLE payment_methods ADD CONSTRAINT pk_payment_methods PRIMARY KEY (payment_method_code);
 ALTER TABLE rental_status_codes ADD CONSTRAINT pk_rental_status_codes PRIMARY KEY (rental_status_code);
 ALTER TABLE transaction_types ADD CONSTRAINT pk_transaction_types PRIMARY KEY (transaction_type_code);
Command(s) completed successfully.

/* create foreign keys */
ALTER TABLE accounts ADD CONSTRAINT fk_accounts_customers FOREIGN KEY(customer_id)
REFERENCES customers (customer_id);
ALTER TABLE accounts ADD CONSTRAINT fk_accounts_payment_methods FOREIGN KEY(payment_method_code)
REFERENCES payment_methods (payment_method_code);
ALTER TABLE customer_rentals ADD CONSTRAINT fk_customer_rentals_customers FOREIGN KEY(customer_id)
REFERENCES customers (customer_id);
ALTER TABLE customer_rentals ADD CONSTRAINT fk_customer_rentals_movies FOREIGN KEY(movie_id)
REFERENCES movies (movie_id);
ALTER TABLE customer_rentals ADD CONSTRAINT fk_customer_rentals_rental_status_codes FOREIGN KEY(rental_status_code)
REFERENCES rental_status_codes (rental_status_code);
ALTER TABLE financial_transactions ADD CONSTRAINT fk_financial_transactions_accounts FOREIGN KEY(account_id)
REFERENCES accounts (account_id);
ALTER TABLE financial_transactions ADD CONSTRAINT fk_financial_transactions_customer_rentals FOREIGN KEY(item_rental_id)
REFERENCES customer_rentals (item_rental_id);
ALTER TABLE financial_transactions ADD CONSTRAINT fk_previous_transcation FOREIGN KEY(previous_transaction_id)
 REFERENCES financial_transactions (transaction_id);
ALTER TABLE financial_transactions ADD CONSTRAINT fk_financial_transactions_transaction_types FOREIGN KEY(transaction_type_code)
REFERENCES transaction_types (transaction_type_code);
Command(s) completed successfully.
 
