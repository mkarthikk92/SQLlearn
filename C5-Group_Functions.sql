-- -- -- -- -- -- GROUP / Multi-Row / Aggregate functions -- -- -- -- -- --

-- These functions return a single value from multiple rows.
-- Can be used with SELECT and ORDER BY clause.
-- Some GROUP functions ignore NULL values.

-- Some of the GROUP functions are,
--   A) AVG
--   B) COUNT
--   C) MAX
--   D) MIN
--   E) SUM
--   F) LISTAGG

-- -- -- -- COUNT function -- -- -- --
-- COUNT(*) includes NULL values as well.

SELECT COUNT(DISTINCT first_name) FROM employees;

-- -- -- -- LISTAGG ... WITHIN GROUP (ORDER BY ...) function -- -- -- --
SELECT LISTAGG(salary, ',') WITHIN GROUP (ORDER BY salary)
FROM employees;



