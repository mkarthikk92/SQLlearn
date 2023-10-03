-- -- -- -- -- -- SORTING DATA -- -- -- -- -- --

-- -- -- -- ORDER BY clause -- -- -- --
-- Sort by any column name, alias or the numeric position of the column.
-- Also, can use ASC or DESC.

SELECT first_name, last_name, salary FROM employees
ORDER BY salary DESC;

-- -- -- -- NULLS FIRST and NULLS LAST -- -- -- --
-- By default, NULL values are sorted last.
-- We can use the NULLS FIRST and NULL LAST implictly.

SELECT first_name, last_name, commission_pct 
FROM employees
ORDER BY first_name ASC NULLS LAST;

-- -- -- -- ROWNUM and ROWID -- -- -- --
-- ROWID is the unique identifier that contains the physical address of a row.
-- ROWNUM is the consecutive logical sequence number given to the row.

SELECT ROWNUM, ROWID, first_name, last_name
FROM employees;

-- -- -- -- FETCH clause -- -- -- --
-- It is an alternative to the LIMIT clause in MySQL and postgreSQL.
-- NEXT|FIRST are both the same. Just for semantic clarity.
-- WITH TIES | ONLY clauses can be used to include ties or not.

SELECT * FROM employees
ORDER BY salary DESC
OFFSET 5 ROWS FETCH NEXT 5 ROWS WITH TIES;

SELECT * FROM employees
ORDER BY salary DESC
OFFSET 5 ROWS FETCH FIRST 5 ROWS ONLY;