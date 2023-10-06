-- -- -- -- -- -- GROUPING data -- -- -- -- -- --
-- GROUP BY clause is used to create groups of values using the group functions.
-- Adding the GROUP BY clause splits the table into smaller groups on which aggregate functions can be performed.

-- -- -- -- IMPORTANT RULES FOR USING GROUP BY -- -- -- --

--   1) GROUP BY clause comes after the FROM and WHERE clause.
--   2) GROUP BY clause can be followed by ORDER BY caluse.

--   3) Columns in the select statement that are not used in the aggregate function must be included
--      in the GROUP BY clause as shown below. The job_id and department_id are not in the aggregate function
--      hence are included in the GROUP BY clause but salary is not.
--      All the columns in the GROUP BY does not have to be in the SELECT statement.

SELECT job_id, department_id, ROUND(AVG(salary+1000)), ROUND(AVG(salary)) 
FROM employees
GROUP BY job_id, department_id;

SELECT job_id, AVG(salary)
FROM employees
GROUP BY job_id, department_id;

--   4) We can use any number of aggregate functions in the SELECT statement when using
--      GROUP BY clause.

SELECT job_id, department_id, manager_id, AVG(salary), count(*) 
FROM employees
GROUP BY job_id, department_id, manager_id
ORDER BY count(*) DESC;

--   5) We cannot use column aliases with the GROUP BY clause. Below query does not
--      work as dep_id aliase is used in the GROUP BY clause.

SELECT job_id, department_id AS dep_id, ROUND(AVG(salary)) 
FROM employees
GROUP BY job_id, dep_id;

--   6) The ORDER BY clause cannot have any columns other than the GROUP BY clause.
--      Below query does not work since first_name is not in the GROUP BY clause and used in ORDER BY.

SELECT job_id, department_id, ROUND(AVG(salary+1000)), ROUND(AVG(salary)) 
FROM employees
GROUP BY job_id, department_id
ORDER BY first_name;

--   7) We can restrict the data using the WHERE clause but since we know aggregate functions
--      cannot be used in the WHERE clause. GROUP BY provides another method.

-- -- -- -- ORDER OF EXECUTIVE in SQL queries -- -- -- --
-- 
-- 1) FROM      - Choose and join tables to get base data.
-- 2) WHERE     - Filters the base data.
-- 3) GROUP BY  - Aggregates the base data.
-- 4) HAVING    - Filters the aggregated data.
-- 5) SELECT    - Returns the final result.
-- 6) ORDER BY  - Sorts the final data.

-- -- -- -- HAVING clause -- -- -- --
-- As an example if we wanted to get the AVG salary greater than 10,000.
-- Since we cannot use group functions in the WHERE clause, we need to use HAVING clause
-- after the GROUP BY clause.

-- We cannot use group functions in the WHERE clause because GROUP BY execution happens
-- after the WHERE clause as shown above in the EXECUTION order.

-- HAVING clause filters grouped data, but WHERE clause filters rows.

SELECT job_id, AVG(salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary) > 10000;





