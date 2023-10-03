-- -- -- -- -- -- RESTRICTING DATA -- -- -- -- -- -- 

-- -- -- -- WHERE CLAUSE -- -- -- -- 
-- Conditions can be column names, airthematic expressions, logical exepressions
-- and functions etc.

-- Comparison Operators:
--     =, <, >, <=, >=, <<, !=
--     BETWEEN ... AND, IN, LIKE, IS NULL, IS NOT NULL 
-- Logical Operators:
--     AND, OR and NOT

-- -- -- -- IN operator -- -- -- --

SELECT * FROM employees 
WHERE employee_id IN (100, 105, 102, 200);

-- -- -- -- LIKE opeartor -- -- -- --
-- To perform wild card searches and return rows matching a certain pattern.
--   % - Any number of characters
--   _ - Exactly one character

-- -- -- -- IS NULL and IS NOT NULL -- -- -- --

SELECT * FROM employees
WHERE department_id IS NULL;

