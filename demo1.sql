use impact_byte;

/* DDL ------------------------------------------------------------------ */
/* CREATE */
create table customers (
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100),
    address text,
    age int(3),
    date_of_birth date,
    primary key(id)
);

/* DROP */
drop table customers;

/* ALTER */
alter table customers
add column email varchar(45) not null;

alter table customers
modify column email varchar(30) not null;

alter table customers
drop column email;

/* TRUNCATE */

/* DML ------------------------------------------------------------------ */
/* INSERT */
insert into customers(first_name,last_name,address,age,date_of_birth,email)
values
("Gibran","Khrisna","Jl. Kemang Raya No.7",18,"1990-02-02","gibran@gmail.com");

insert into customers(first_name,last_name,address,age,date_of_birth,email)
values
("Fadhil","Rahmah","Jl.Depok No.7",14,"2004-08-12","fadhil@gmail.com"),
("Budi","Doremi","Jl. Bangka",20,"2000-08-20","budi@gmail.com"),
("Susi","Susan","Jl.Keobn Jeruk No.7",19,"2008-08-1","susi@gmail.com"),
("Joni","Joni","Jl.Jalan No.7",17,"1987-10-12","joni@gmail.com");

/* SELECT */
select * from customers;
select first_name,last_name from customers;
/* SELECT  WHERE*/
select * from customers where first_name="gibran";
select * from customers where id=3;
select * from customers where first_name="gibran" and last_name="Khrisna";
select * from customers where first_name="gibran" or age=14;
/* SELECT  DISTINCT*/
select distinct age from customers;
/* SELECT  LOGICAL OPERATOR */
select * from customers where age < 15;
select * from customers where age between 20 and 40;
/* SELECT LIKE */
select * from customers where first_name like "%bran";
select * from customers where first_name like "%i";
select * from customers where first_name like "b%";
select * from customers where first_name like "%b%";

/* TRUNCATE*/
truncate table customers;

/* FOREIGN KEY ------------------------------------------------------------------ */
create table products (
	id int not null auto_increment,
    name varchar(255) not null,
    price double(11,6) not null,
    primary key (id)
);

INSERT INTO `impact_byte`.`products`
(`name`,`price`)
VALUES
("sabun",2500),
("mie",1500),
("kopi",5000),
("baygon",15000),
("autan",1000);


create table orders(
	id int not null auto_increment,
    product_id int not null,
    customer_id int not null,
    order_date datetime not null default current_timestamp,
    primary key(id),
    foreign key(product_id) references products(id),
	foreign key(customer_id) references customers(id)
);


insert into orders (product_id,customer_id) values
(1,2),
(2,5),
(4,1),
(4,2),
(3,3);

/* GROUP BY */
select * from orders;
select product_id,count(product_id) from orders group by product_id;

/* ORDER BY */
select * from orders order by product_id asc;
select * from orders order by product_id desc;

/* SELECT FROM MULTIPLE TABLE */
select * from products p, orders o where p.id = o.product_id;
SELECT 
    p.name, p.price, o.order_date
FROM
    products p,
    orders o
WHERE
    p.id = o.product_id;
    
/* INNER JOIN */
SELECT 
    p.name, p.price, o.order_date
FROM
    products p
        INNER JOIN
    orders o ON p.id = o.product_id;
    
/* LEFT JOIN */
SELECT 
    p.name, p.price, o.order_date
FROM
    products p
        LEFT JOIN
    orders o ON p.id = o.product_id;
    
 /* 3 Tables */
 SELECT 
    p.name, p.price, c.first_name, c.last_name, o.order_date
FROM
    products p,
    orders o,
    customers c
WHERE
    p.id = o.product_id
        AND o.customer_id = c.id;
        
/* CONCAT */
 SELECT 
    p.name,
    p.price,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    o.order_date
FROM
    products p,
    orders o,
    customers c
WHERE
    p.id = o.product_id
        AND o.customer_id = c.id;
        
/* SQL FUNCTIONS */
select avg(age) as average from customers;
select sum(age) from customers;
select count(age) from customers;
select min(age) from customers;
select max(age) from customers;

select * from customers;



