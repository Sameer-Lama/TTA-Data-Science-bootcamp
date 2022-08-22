DROP DATABASE company_details;
CREATE DATABASE company_details; 

USE company_details; 


-- Create a table
Create Table company(
company_ID int,
company_Name varchar(255),
revenue int,
expenses int,
profit int,
PRIMARY KEY (Company_ID),
UNIQUE(Company_ID)
);

ALTER TABLE company
MODIFY Company_ID INT NOT NULL;

INSERT INTO company(company_ID, company_Name, revenue, expenses, profit)
VALUES (1, 'A', 100, 100, 0),
(2, 'B', 200, 100, 100),
(3, 'C', 300, 100, 200),
(4, 'D', 400, 100, 300),
(5, 'E', 500, 100, 400);

EXPLAIN company;

-- Delete a record
DELETE FROM company
WHERE company_id = 5;


-- Update a record
UPDATE company
SET company_Name = 'K'
WHERE company_id = 1;








