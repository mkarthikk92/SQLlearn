-- -- -- -- -- -- SINGLE ROW FUNCTIONS -- -- -- -- -- --
-- Functions are pre-existing, compiled codes that are stored in the database. Also called STORED FUNCTIONS.
-- In Oracle there are,
--     A) SINGLE ROW FUNCTIONS - Returns a single value for each row.
--     B) MULTI ROW FUNCTIONS - Returns a single value for multiple rows.
-- These functions can also be nested.
-- Can be used in SELECT, WHERE and ORDER BY clause.

-- There are 5 types of SINGLE ROW functions:
--   A) Character
--   B) Numeric
--   C) Date
--   D) Conversion
--   E) General - Mainly used to handle NULL values

-- -- -- -- -- CHARACTER FUNCTIONS -- -- -- -- --
-- There are 2 types of character functions:
--   A) CASE CONVERSION functions: These are very obvious functions.
--      1) UPPER
--      2) LOWER
--      3) INITCAP
--   B) CHARACTER MANIPULATION functions:
--      1) SUBSTR
--      2) LENGTH
--      3) CONCAT
--      4) INSTR
--      5) TRIM
--      6) REPLACE
--      7) LPAD | RPAD

-- -- -- -- -- CHARACTER MANIPULATION FUNCTIONS -- -- -- -- --

-- -- -- -- SUBSTR -- -- -- --
-- If length of the string is less than the position parameter, then it will return NULL.
-- SUBSTR(string, position, offset).

SELECT SUBSTR(first_name, 3, 6), last_name 
FROM employees;

-- -- -- -- TRIM, LTRIM, RTRIM-- -- -- --
-- Using LTRIM and RTRIM, we can trim multiple characters.
-- Any number of apperances of the characters, specified in the trim string, in the string will be trimmed.
-- Each character in the trim string is considered.  
SELECT TRIM('   Karthik  M') FROM dual;
SELECT LTRIM('qqqqqjjjjjMy name is Karthikjjjjjqqqqq', 'qj') FROM dual;
SELECT RTRIM('qqqqqjjjjjMy name is Karthikjjjjjqqqqq', 'qj') FROM dual;

-- -- -- -- -- NUMERIC functions -- -- -- -- --
-- 1) ROUND: ROUND(12.136, 2) = 12.14
-- 2) TRUNC: TRUNC(12.136, 2) = 12.13
-- 3) CEIL: CEIL(2.67) = 3
-- 4) FLOOR: FLOOR(2.67) = 2
-- 5) MOD: MOD(8, 5) = 3

-- -- -- -- -- DATE functions -- -- -- -- --
-- Oracle stores date values in internal numeric format which is 7 byte number.
-- century, year, month, day, hour, minute, second
-- Date format model: 'DD-MON-RR HH12/24.MI.SS*FF AM TZR'

-- There are many different date formats in Oracle,
-- 'DD-MON-RR', 'DD-MM-YY', 'DD/MM/YYYY'

-- Date data types in Oracle,
--   1) DATE
--   2) TIMESTAMP
--   3) TIMESTAMP WITH TIMEZONE
--   4) TIMESTAMP WITH LOCAL TIME ZONE

-- Oracle Date functions,
--   1) SYSDATE: Date of the OS where DB is installed.
--   2) SYSTIMESTAMP: Date and time of the DB.
--   3) CURRENT_DATE: Current date of the logged in user's session.
--   4) CURRENT_TIMESTAMP: Current date and time of the DB.
--   5) SESSIONTIMEZONE: Timezone of the user's session.

-- Date Manipulation functions,
--   1) ADD_MONTHS('18-SEP-23', 3) = 18-DEC-23
--   2) ROUND('18-SEP-23', 'MONTH') = 1-SEP-23
--   3) TRUNC('18-SEP-23', 'YEAR') = 1-JAN-23
--   4) NEXT_DAY('4-JUN-20', 'TUESDAY') = 9-JUN-20
--   5) LAST_DAY('4-JUL-20') = 31-JUL-20

SELECT ROUND(sysdate, 'MONTH') FROM dual;
SELECT TRUNC(sysdate, 'YEAR') FROM dual;

-- -- -- -- -- CONVERSION functions -- -- -- -- --
-- Two types of conversions,
--   1) Implicit conversion: This is done automatically by the server.
--   2) Explicit conversion: This is done by the user.

-- These IMPLICIT conversions happen automatically,
--   1) VARCHAR2 OR CHAR ---- NUMBER OR DATE
--   2) NUMBER OR DATE ---- VARCHAR2

-- There are 3 explicit data type conversion functions,
--   1) TO_CHAR()
--   2) TO_NUMBER()
--   3) TO_DATE()

-- Number format models,
--   1) 9 - Number of digits.
--   2) 0 - Leading or trailing zeroes.
--   3) $ - Adds dollar sign.
--   4) L - Local currency symbol.
--   5) . - Decimal point.
--   6) , - Comma indicator.

SELECT TO_CHAR(12345, 'L0099,999.9999900') FROM dual;
SELECT TO_CHAR(sysdate, 'MM-DD-YYYY') FROM dual;

SELECT TO_NUMBER('1000.23') FROM dual;

-- -- -- -- -- GENERAL functions -- -- -- -- --
-- These functions are mostly used to handle NULL values.

-- -- -- -- NVL function -- -- -- --
-- If expression-1 is NULL then it returns expression-2.
SELECT commission_pct, NVL(commission_pct, 0) FROM employees;

-- -- -- -- NVL2 function -- -- -- --
-- If expression-1 is not NULL, then expression-2 or then expression-3
SELECT commission_pct, NVL2(commission_pct, 1, 0) FROM employees;

-- -- -- -- NULLIF function -- -- -- --
-- IF expression-1 and expression-2 are equal, then returns NULL,
-- ELSE returns expression-1

-- -- -- -- COALESCE -- -- -- --
-- This is just an improved version of NVL function.
-- Returns the first one that evaluates to a NULL.
-- COALESCE(expression-1, expression-2, ....., expression-n)













