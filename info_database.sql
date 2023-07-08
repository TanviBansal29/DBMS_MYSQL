CREATE database info;

USE info;

CREATE TABLE Customer(
id integer PRIMARY KEY,
cname varchar(225),
Address varchar(225),
Gender char(2),
City varchar(225),
Pincode integer
);

INSERT INTO Customer
VALUES (1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
       (1300, 'Shayam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 141001),
       (245, 'Neelabh Shukla', 'Ashok', 'M', 'Jalandhar', 144003),
       (210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002),
       (500, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 1441001);
       
INSERT INTO Customer
VALUES (1252,'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL);
       
CREATE TABLE Order_details (
Order_id integer,
delivery_date DATE,
cust_id INT,
FOREIGN KEY(cust_id) references Customer(id)
);
       
       
       
       