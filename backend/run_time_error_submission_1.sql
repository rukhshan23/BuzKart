--  Create table account
--  (account_id	varchar(45) not NULL,
-- email		varchar(45) not NULL,
--  password	varchar(45) not NULL,
--  sec_ques	varchar(45),
--  sec_ans		varchar(45),
--  primary key(account_id)
--  );

-- create table admin
-- 	(admin_id	varchar(500),
-- 	name		varchar(500) not null,
-- 	primary key (admin_id),
--     account_id varchar(500),
-- 	foreign key(account_id) references account(account_id) on delete cascade
-- );

-- create table subscription(
-- subs_id varchar(500) not NULL,
-- comm_id	numeric(3,0) not NULL,
-- no_prod	numeric(5,0) not NULL,
-- primary key(subs_id)
-- );

-- create table seller(
-- 	seller_id	varchar(500) not NULL,
-- 	name		varchar(500) not null,
-- 	subs_id		varchar(500),
-- 	phone		varchar(500) not null,
-- 	discount	varchar(500) not null,
--  account_id	varchar(500),
-- 	primary key (seller_id),
-- 	foreign key (account_id) references account(account_id) on delete cascade,
-- 	foreign key (subs_id) references subscription(subs_id) on delete cascade
-- );

-- create table buyer
-- 	(buyer_id varchar(500) not NULL,
-- 	name varchar(500) not null,
-- 	mailing_address varchar(500) not null,
-- 	phone varchar(500) not null,
-- 	credit	numeric(8,2),
--  account_id	varchar(500),
-- 	primary key (buyer_id),
-- 	foreign key (account_id) references account(account_id) on delete cascade
-- );

--  create table product(
--  product_id	varchar(500) not null,
--  name 		varchar(500) not null,
--  seller_id 	varchar(500),
--  pic_links  	varchar(500),
--  price 		numeric (8,2) not null,
--  stock 		numeric (8,2) not null,
--  primary key (product_id),
--  foreign key (seller_id) references seller(seller_id) on delete cascade);

-- create table category
-- (product_id	varchar(500),
-- cat_name	varchar(500) not NULL,
-- primary key(product_id),
-- foreign key(product_id) references product(product_id) on delete cascade,
-- check (cat_name in ('beverages', 'crockery','electronics', 'snacks', 'sports', 'garments', 'grocery', 'cosmetics'))
-- );

-- create table review(
-- product_id	varchar(50),
-- buyer_id	varchar(50),
-- review		varchar(500),
-- rating		numeric(2,0),
-- primary key (product_id, buyer_id),
-- foreign key (buyer_id) references buyer(buyer_id),
-- foreign key (product_id) references product(product_id)
-- );
-- REMOVED SELLER_ID FROM TABLE REVIEW



-- create table items(
--  order_id varchar(50),
--  product_id varchar(50),
--  quantity varchar(500) not NULL,
--  price numeric(8,2),
--  seller_id varchar(500),
--  buyer_id varchar(500),
--  shipping_status numeric(1,0) not NULL,
--  primary key (order_id,product_id),
--  foreign key (product_id) references product(product_id),
--  foreign key (price) references product(price),
--  foreign key (seller_id) references seller(seller_id),
-- check  (shipping_status in (0,1))
--  );

-- alter table items
-- add constraint shipping_constraint
-- check  (shipping_status in (0,1));
-- alter table account modify column email varchar(45);
-- alter table account modify column sec_ques varchar(45);
-- alter table account modify column password varchar(45);
-- alter table account modify column sec_ans varchar(45);
-- alter table subscription modify column comm_id numeric(3,0);
-- alter table seller modify column subs_id varchar(45) on delete cascade;
-- alter table category drop column cat_id;

-- insert into account (account_id,email,password,sec_ques,sec_ans) values ('1234','c@gmail,com','abcdef','What is the name of your pet?','MO');
-- insert into account (account_id,email,password,sec_ques,sec_ans) values ('1235','d@gmail,com','abcdgh','What is the name of your dog?','dog');
-- insert into account (account_id,email,password,sec_ques,sec_ans) values ('1236','e@gmail,com','abcdhi','What is the name of your uncle?','uncle');
-- insert into account (account_id,email,password,sec_ques,sec_ans) values ('1237','f@gmail,com','abcdjk','What is the name of your aunt?','aut');
-- insert into account (account_id,email,password,sec_ques,sec_ans) values ('1238','g@gmail,com','abcdlm','What is the name of your cat?','cat');
-- insert into account (account_id,email,password,sec_ques,sec_ans) values ('1239','h@gmail,com','abcdno','What is the name of your father?','father');
-- insert into account (account_id,email,password,sec_ques,sec_ans) values ('1240','i@gmail,com','abcdpq','What is the name of your mom?','mom');
-- insert into account (account_id,email,password,sec_ques,sec_ans) values ('1241','j@gmail,com','abcdrs','What is the name of your brother?','bro');
-- insert into account (account_id,email,password,sec_ques,sec_ans) values ('1242','k@gmail,com','abcduv','What is the name of your sister?','sis');
-- insert into account (account_id,email,password,sec_ques,sec_ans) values ('1243','l@gmail,com','abcdws','What is the name of your friend?','bff');

-- insert into admin (admin_id, name, account_id ) values ('1','rahim', '1234');
-- insert  into admin (admin_id, name, account_id) values ('2','achraf', '1235');

-- insert into buyer values ('1','benzema','eme','12345','0','1236');
-- insert into buyer values ('2','ramos','defence','67890','0','1237');
-- insert into buyer values ('3','vini','eme','12389','0','1238');
-- insert into buyer values ('4','rodrygo','defence','67812','0','1239');

-- insert into subscription values ('1', 50, '50');
-- insert into subscription values ('2', 20, '100');

-- insert into seller values ('1','rodrygo','1','03333333','20','1240');
-- insert into seller values ('2','varnane','2','0444444','15','1241');
-- insert into seller values ('3','carvajal','2','0555555','10','1242');
-- insert into seller values ('4','rodrygo','1','06666666','5','1243');

-- insert into product values ('1','coke','1','htttpcoke','80','50');
-- insert into product values ('2','shampoo','2','htttpshampoo','100','50');
-- insert into product values ('3','cake','3','htttpcake','1000','10');
-- insert into product values ('4','iphone','4','htttpiphone','20000','20');
-- insert into product values ('5','smasung','1','htttpsamsung','1000','10');
-- insert into product values ('6','football','2','htttfootball','500','10');
-- insert into product values ('7','basketball','3','htttpbasketball','600','15');
-- insert into product values ('8','lamp','4','htttlamp','800','25');
-- insert into product values ('9','book','2','htttpbook','200','5');
-- insert into product values ('10','pillow','3','htttppillow','200','5');

-- insert into category values ('1', 'beverages');
-- insert into category values ('2', 'beverages');
-- insert into category values ('3', 'snacks');
-- insert into category values ('4', 'electronics');
-- insert into category values ('5', 'electronics');
-- insert into category values ('6', 'sports');
-- insert into category values ('7', 'sports');
-- insert into category values ('8', 'electronics');
-- insert into category values ('9', 'snacks');
-- insert into category values ('10', 'snacks');


-- insert into review values ('1', '1', 'acha product tha shahbash', 5);
-- insert into review values ('2', '2', 'bhai jaan scam hai ye an kharedna', 1 );
-- insert into review values ('3', '3','bahi kamal bohat achi fit hua hai', 5);
-- insert into review values ('4', '4', 'bhai packing achi nahi thi color bhi sahi nahi dia', 1);
-- insert into review values ('5', '2', 'mastii kar raya aaai', 3);
-- insert into review values ('6', '3', 'nice, very good, bootiful', 2);
-- delete from review where product_id ='6' and seller_id = '2' and buyer_id = '3';


-- insert into items values ('1', '1','1', '80', '1', '1', 0);
-- insert into items values ('2', '2','1', '100', '2', '2',1);
-- insert into items values ('3', '3','1', '1000', '3', '3',0 );
-- insert into items values ('4', '4','1', '20000', '4', '4', 1);
-- insert into items values ('5', '5','1', '1000', '1', '2', 0);
-- insert into items values ('6', '6','1', '500', '2', '3', 1);
-- insert into items values ('7', '7','1', '600', '3', '1', 1);
-- insert into items values ('8', '8','1', '800', '4', '2', 0);
-- insert into items values ('9', '9','1', '200', '2', '3', 0);
-- insert into items values ('10', '10','1', '200', '3', '4', 1);
-- insert into items values ('11', '1','1', '500', '1', '1', 1);

-- ALTER TABLE subscription RENAME COLUMN comm_id TO comm_percentage
-- select * from review;

-- select order_id, product_id, quantity
-- from items
-- where seller_id='2' and shipping_status='1'

-- ALTER TABLE items
-- ADD credit_used numeric(8,2);

-- ALTER TABLE items
-- ADD discount numeric(10,2);

-- Alter Table seller modify discount numeric(10,2);
-- Alter Table items modify discount numeric(10,2);
--  make 2,2 as discount constraint
-- ALTER TABLE items
-- ADD FOREIGN KEY (discount) REFERENCES seller(discount);
-- seller_id in review is redundant DONE
-- add date in items table DONE
-- add additional discount column and/or date column for individual items
-- security checks must be on database, front end and back end
-- read up on SQL injections 
-- Connect database with backend for Tuesday
-- alter table items add column date datetime DONE
-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password'
FLUSH PRIVILEGES;