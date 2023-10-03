-- -- -- -- -- -- RETRIEVING DATA -- -- -- -- -- --


-- -- -- --  ALIASES -- -- -- --
-- Should be used with double quotes if they have special characters, space characters
-- (or) it is used to handle case sensitivity.

SELECT first_name AS "MY NAME #" FROM employees;

-- -- -- -- QUOTE OPERATOR AND SINGLE QUOTES -- -- -- --
-- To return text we can use this QUOTE operator.
-- We can also single quotes. Special characters need to be escaped with single quotes.
-- Also handles special charaters.

SELECT 'My Name is Karthik' AS Name FROM dual;
SELECT 'I''m Karthik' AS Name FROM dual;
SELECT q'[I'm Karthik]' AS Name FROM dual;

-- -- -- -- DISTINCT (OR) UNIQUE -- -- -- --
-- It is a row based operator.
-- Only one distinct keyword can be used in a SQL statement and also before the first column.
SELECT DISTINCT first_name FROM employees ORDER BY first_name DESC;

-- -- -- -- CONCATENATION OPERATOR -- -- -- --
-- Concatenates two or more strings or columns and returns a single output column value.
SELECT 'My first name is ' || first_name || ' and ' || 'my last name is ' || last_name || '.' FROM employees;

-- Concatenation with a string and NULL returns the string.
SELECT first_name || NULL  AS "string and null concatenation" FROM employees;

-- -- -- -- ARITHEMATIC EXPRESSIONS -- -- -- --
-- These can be used to perform arithematic operations on NUMBERS and DATES.
-- Operations with NULL returns a NULL.

SELECT salary, salary+100*12 FROM employees;

