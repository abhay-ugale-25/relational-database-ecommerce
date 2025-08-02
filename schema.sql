CREATE TABLE Customer (
    cust_id INT primary key,
    name varchar(50),
    email varchar(50),
    reg_date date
);
CREATE TABLE Product(
    prod_id INT primary key,
    name varchar(50),
    category varchar(50),
    stock int
);
CREATE TABLE Orders(
    order_id int primary key,
    cust_id int,
    order_date date,
    total_amt int,
    foreign key(cust_id) references Customer(cust_id)
);
CREATE TABLE OrderItem(
    item_id int primary key,
    order_id int,
    prod_id int,
    quantity int,
    unit_price int,
    foreign key(order_id) references Orders(order_id),
    foreign key(prod_id) references Product(prod_id)
);
CREATE TABLE Payments(
    pay_id int primary key,
    order_id int,
    payment_date date,
    amount_paid int,
    pay_method varchar(20),
    foreign key(order_id) references Orders(order_id)
);
CREATE TABLE Reviews(
    review_id int primary key,
    cust_id int,
    prod_id int,
    rating int,
    review_date date,
    foreign key(cust_id) references Customer(cust_id),
    foreign key(prod_id) references Product(prod_id)
);