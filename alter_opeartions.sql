create table account(
id int primary key,
name varchar(255) UNIQUE,
balance INT NOT NULL DEFAULT 0
);

SELECT * FROM account;

-- ADD NEW COLUMN
ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;

-- float to double 
-- MODIFY
alter table account MODIFY interest DOUBLE NOT NULL DEFAULT 0;

DESC account;

-- rename column 
alter table account change column interest saving_interest FLOAT NOT NULL DEFAULT 0;

-- DROP COLUMN
alter table account DROP COLUMN saving_interest;

-- rename the table
alter table account RENAME TO account_details;


