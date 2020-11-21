
-- Main ddl code --

 Create table account
 (account_id	int NOT NULL AUTO_INCREMENT,
 email		varchar(50) not NULL UNIQUE CHECK (email LIKE '%@%'),
 password	varchar(50) not NULL,
 sec_ques	varchar(200),
 sec_ans		varchar(200),
 primary key(account_id)
 );

create table admin
	(admin_id	int NOT NULL AUTO_INCREMENT,
	name		varchar(50) not null,
	account_id  int NOT NULL,
	UNIQUE(account_id),
	primary key (admin_id),
	foreign key(account_id) references account(account_id) on delete cascade
);

create table subscription(
subs_id int NOT NULL AUTO_INCREMENT,
comm_percentage	numeric(3,0) not NULL,
no_prod	numeric(5,0) not NULL,
primary key(subs_id)
);

create table seller(
	seller_id	int NOT NULL AUTO_INCREMENT,
	name		varchar(50) not null,
	subs_id		int NOT NULL,
	phone		varchar(50) not null,
	discount	numeric(10,2) not null,
	account_id	int NOT NULL,
	UNIQUE(account_id),
	primary key (seller_id),
	foreign key (account_id) references account(account_id) on delete cascade,
	foreign key (subs_id) references subscription(subs_id) on delete cascade
);

create table buyer
	(buyer_id	int NOT NULL AUTO_INCREMENT,
	name		varchar(50) not null,
	mailing_address		varchar(200) not null,
	phone		varchar(50) not null,
	credit		numeric(8,2),
	account_id	int NOT NULL,
	UNIQUE(account_id),
	primary key (buyer_id),
	foreign key (account_id) references account(account_id) on delete cascade
);


 create table product(
 product_id	int NOT NULL AUTO_INCREMENT,
 name 		varchar(50) not null,
 seller_id 	int NOT NULL,
 pic_links  	varchar(500),
 price 		numeric (8,2) not null,
 stock 		numeric (8,2) not null,
 primary key (product_id),
 foreign key (seller_id) references seller(seller_id) on delete cascade);

ALTER TABLE product 
ADD INDEX (price)VISIBLE;

create table category
(product_id		int NOT NULL,
cat_name			varchar(100) not NULL,
primary key(product_id),
foreign key(product_id) references product(product_id) on delete cascade,
check (cat_name in ('beverages', 'crockery','electronics', 'snacks', 'sports', 'garments', 'grocery', 'cosmetics'))
);

create table review(
product_id	int NOT NULL,
buyer_id		int NOT NULL,
review		varchar(500),
rating		numeric(2,0) NOT NULL,
primary key (product_id, buyer_id),
foreign key (buyer_id) references buyer(buyer_id) on delete cascade,
foreign key (product_id) references product(product_id) on delete cascade
);

create table items(
 order_id	int NOT NULL AUTO_INCREMENT,
 product_id	int NOT NULL,
 quantity	varchar(100) NOT NULL,
 price		numeric(8,2) NOT NULL,
 seller_id	int NOT NULL,
 buyer_id	int NOT NULL,
 shipping_status numeric(1,0) not NULL,
 credit_used numeric(8,2),
 date 		datetime,
 discount 	numeric(10,2),
 primary key (order_id,product_id),
 foreign key (product_id) references product(product_id) on delete cascade,
 foreign key (price) references product(price) on delete cascade,
 foreign key (seller_id) references seller(seller_id) on delete cascade,
--  foreign key (discount)  references seller(discount) on delete cascade,  -- ON HOLD
check  (shipping_status in (0,1))
);

-- All tables created --


-- Do not uncomment --

-- insert into account (email,password,sec_ques,sec_ans) values ('c@gmail,com','abcdef','What is the name of your pet?','MO');
-- insert into account (email,password,sec_ques,sec_ans) values ('d@gmail,com','abcdgh','What is the name of your dog?','dog');
-- insert into account (email,password,sec_ques,sec_ans) values ('e@gmail,com','abcdhi','What is the name of your uncle?','uncle');
-- insert into account (email,password,sec_ques,sec_ans) values ('f@gmail,com','abcdjk','What is the name of your aunt?','aut');
-- insert into account (email,password,sec_ques,sec_ans) values ('g@gmail,com','abcdlm','What is the name of your cat?','cat');
-- insert into account (email,password,sec_ques,sec_ans) values ('h@gmail,com','abcdno','What is the name of your father?','father');
-- insert into account (email,password,sec_ques,sec_ans) values ('i@gmail,com','abcdpq','What is the name of your mom?','mom');
-- insert into account (email,password,sec_ques,sec_ans) values ('j@gmail,com','abcdrs','What is the name of your brother?','bro');
-- insert into account (email,password,sec_ques,sec_ans) values ('k@gmail,com','abcduv','What is the name of your sister?','sis');

-- insert into admin (name, account_id) values ('rahim', 2);
-- insert  into admin (name, account_id) values ('achraf',4);

-- insert into buyer (name,mailing_address, phone, credit, account_id) values ('benzema','eme','12345',0,1);
-- insert into buyer (name,mailing_address, phone, credit, account_id) values ('ramos','defence','67890',0,3);
-- insert into buyer (name,mailing_address, phone, credit, account_id) values ('vini','eme','12389',0,5);
-- insert into buyer (name,mailing_address, phone, credit, account_id) values ('rodrygo','defence','67812',0,6);

-- insert into subscription (comm_percentage,no_prod) values (50, 50);
-- insert into subscription (comm_percentage,no_prod) values (20, 100);

-- insert into seller (name,subs_id,phone,discount,account_id) values ('rodrygo',1,'03333333',20,9);
-- insert into seller (name,subs_id,phone,discount,account_id) values ('varnane',2,'0444444',15, 8);

-- select * from seller;  
