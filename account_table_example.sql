CREATE TABLE account(
id int primary key,
name varchar(255) UNIQUE,
balance INT NOT NULL DEFAULT 0
);

INSERT INTO account(id, name)
values(1,'A');

INSERT INTO account(id, name)
values(2,'B');

DROP table account;

SELECT * FROM account;