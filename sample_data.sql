INSERT INTO Customer (cust_id, name, email, reg_date)
VALUES
(1, 'Amit Sharma', 'amit@example.com', '2023-01-10'),
(2, 'Neha Verma', 'neha@example.com', '2023-02-15'),
(3, 'Rohan Mehta', 'rohan@example.com', '2023-03-20'),
(4, 'Priya Singh', 'priya@example.com', '2023-04-25'),
(5, 'Karan Patel', 'karan@example.com', '2023-05-30');


INSERT INTO Product (prod_id, name, category, stock)
VALUES
(101, 'Laptop', 'Electronics', 50),
(102, 'Smartphone', 'Electronics', 100),
(103, 'Headphones', 'Accessories', 150),
(104, 'Office Chair', 'Furniture', 30),
(105, 'Backpack', 'Bags', 80);

INSERT INTO Orders (order_id, cust_id, order_date, total_amt)
VALUES
(1001, 1, '2023-06-01', 85000),
(1002, 2, '2023-06-05', 1200),
(1003, 3, '2023-06-10', 60000),
(1004, 1, '2023-06-15', 2500),
(1005, 4, '2023-06-20', 3000);

INSERT INTO OrderItem (item_id, order_id, prod_id, quantity, unit_price)
VALUES
(1, 1001, 101, 1, 85000),
(2, 1002, 103, 2, 600),
(3, 1003, 102, 1, 60000),
(4, 1004, 105, 1, 2500),
(5, 1005, 104, 1, 3000);

INSERT INTO Payments (pay_id, order_id, payment_date, amount_paid, pay_method)
VALUES
(201, 1001, '2023-06-01', 85000, 'Credit Card'),
(202, 1002, '2023-06-06', 1200, 'UPI'),
(203, 1003, '2023-06-11', 60000, 'Debit Card'),
(204, 1004, '2023-06-16', 2500, 'Cash'),
(205, 1005, '2023-06-21', 3000, 'Credit Card');

INSERT INTO Reviews (review_id, cust_id, prod_id, rating, review_date)
VALUES
(301, 1, 101, 5, '2023-06-05'),
(302, 2, 103, 4, '2023-06-07'),
(303, 3, 102, 3, '2023-06-12'),
(304, 1, 105, 4, '2023-06-18'),
(305, 4, 104, 5, '2023-06-22');

