-- Using count

SELECT d.name AS Department,e1.name AS Employee, e1.salary AS Salary
FROM Employee e1 
LEFT JOIN department d 
ON e1.departmentId = d.id
WHERE 3 > (SELECT count(DISTINCT e2.salary) FROM Employee e2
WHERE e1.departmentId = e2.departmentId
AND e2.salary > e1.salary)


--Using DENSE_RANK -- Cleaner way to do queries using window function
WITH CTE AS (
    SELECT e.name, e.departmentId, e.salary, 
    DENSE_RANK() OVER(PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rnk FROM Employee e
)

SELECT d.name AS Department,e1.name AS Employee, e1.salary AS Salary
FROM CTE e1 
LEFT JOIN department d 
ON e1.departmentId = d.id
WHERE e1.rnk < 4
