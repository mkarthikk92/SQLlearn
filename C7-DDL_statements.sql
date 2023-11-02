-- -- -- -- -- -- Data Definition Language -- -- -- -- -- --
-- To create or change the structure of Database objects using DDL statements.

-- Types of DDL statements:
-- 1) CREATE
-- 2) ALTER
-- 3) TRUNCATE - Delete all rows in a table and space allocated. This operation cannot be rolled back.
-- 4) DROP - Delete objects from a database.
-- 5) RENAME - Rename an existing object.
-- 6) COMMENT 

-- Every DDL command has an AUTO-COMMIT feature.

-- All object names are case insensitive. All are treated as UPPERCASE letter, if not enclosed in double quotes.

-- -- -- -- [CREATE TABLE] CREATING A TABLE -- -- -- --
-- When using CTAS command to create a table, only the NOT NULL contraints are inherited from the
-- parent table.

DROP TABLE hr.my_employees;

CREATE TABLE hr.my_employees (
    employee_id NUMBER(3) NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50),
    email VARCHAR2(20),
    hire_date DATE DEFAULT SYSDATE NOT NULL
);

SELECT * FROM my_employees;

CREATE TABLE employees_copy (first, last, sal)
AS (SELECT first_name, last_name, salary FROM employees);

SELECT * FROM employees_copy;

-- -- -- -- [ALTER TABLE] -- -- -- --
-- [ADD]: Adding columns to a table
ALTER TABLE employees_copy
ADD ssn VARCHAR(11);

-- Adding new columns to a table. If there is no default then all rows would be NULL.
ALTER TABLE employees_copy
ADD (
    fax_number VARCHAR2(11), 
    birth_date DATE, 
    password VARCHAR(20) DEFAULT 'abc1234'
    );

-- [MODIFY] Altering a row does not have effect on the previously inserted rows.
-- We can alter a column but as long as it does not effect the previously inserted rows to that column.
ALTER TABLE employees_copy
MODIFY password VARCHAR2(50) DEFAULT 'abcdefg123456';

-- [DROP] Drop a column using ALTER statement
ALTER TABLE employees_copy 
DROP COLUMN ssn;

ALTER TABLE employees_copy
DROP (fax_number, password);

SELECT * FROM employees_copy;

-- [SET UNUSED] Marking a column unused
ALTER TABLE employees_copy
SET UNUSED COLUMN first;

ALTER TABLE employees_copy
SET UNUSED (sal);

SELECT * FROM USER_UNUSED_COL_TABS;

-- [ONLINE] To allow DML operations when the ALTER operation is still processing
ALTER TABLE employees_copy
SET UNUSED (last) ONLINE;

-- [DROP UNUSED COLUMNS] - Removes columns physically from the disks
ALTER TABLE employees_copy DROP UNUSED COLUMNS;

-- -- -- -- READ ONLY TABLES -- -- -- --
-- Especially useful when doing maintainence.

CREATE TABLE emp_temp AS
SELECT * FROM employees;

SELECT * FROM emp_temp;

-- [READ ONLY] All DML and some DDL operations are not allowed since it changes the original data in the table.
ALTER TABLE emp_temp READ ONLY;

-- [DELETE] Since the table is marked read-only, will need special privileges to delete the table.
-- DELETE operation deletes all the rows from the table.
-- DELETE is a DML operation.
DELETE emp_temp;

ALTER TABLE emp_temp
DROP COLUMN commission_pct;

-- We can add a new column (or) drop a table but cannot drop a column or delete the table.
-- We can add a column because it does not change the original data.
ALTER TABLE emp_temp
ADD gender VARCHAR2(10);

-- [DROP TABLE] Although in READ ONLY mode, the entire table can be dropped.
DROP TABLE emp_temp;

-- [READ WRITE] To drop a column or able to delete the table we will need to change the table to READ WRITE.
ALTER TABLE emp_temp READ WRITE;

-- -- -- -- DROP TABLE -- -- -- --
CREATE TABLE emp_temp1 
AS SELECT * FROM employees;

CREATE TABLE emp_temp2 
AS SELECT * FROM employees;

CREATE TABLE emp_temp3
AS SELECT * FROM employees;

CREATE TABLE emp_temp4
AS SELECT * FROM employees;

-- [DROP] Can only drop one table at a time.
-- Removes the table and moves it to recycle bin. Can be restored.
DROP TABLE emp_temp1;

-- [FLASHBACK TABLE] Restore the dropped table to a state before dropping.
FLASHBACK TABLE emp_temp1 TO BEFORE DROP;
SELECT * FROM emp_temp1;

-- [PURGE] Removes the table permanently from the disk.
DROP TABLE emp_temp2 PURGE;
FLASHBACK TABLE emp_temp2 TO BEFORE DROP;

-- -- -- -- TRUNCATE TABLE -- -- -- --
-- TRUNCATE command deletes all rows in one step.
-- It it similar to the DELETE statement DML operation which deletes rows one by one.
-- In TRUNCATE, we cannot easily restore the data because it does not generate an undo file, log data or recovery files unlike DELETE.
-- Very useful for large data tables.

TRUNCATE TABLE emp_temp4;

-- -- -- -- RENAME TO [COLUMN OR TABLE] -- -- -- --
-- To rename a column or table name.
ALTER TABLE emp_temp1 RENAME TO employees_copy1;
SELECT * FROM emp_temp1;
SELECT * FROM employees_copy1;

ALTER TABLE employees_copy1 RENAME COLUMN hire_date TO start_date;



