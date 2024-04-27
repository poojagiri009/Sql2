-- Write your MySQL query statement below
-- Using mod
SELECT (
    CASE WHEN mod(id,2) !=0 AND id != cnts THEN id+1
    WHEN mod(id,2) !=0 AND id = cnts THEN id
    ELSE id - 1
    END
    ) AS id, student
    FROM seat, 
    (SELECT count(*) AS cnts FROM seat) a
ORDER BY id


--Using bitwise expression (x+1)^1-1
SELECT s1.id,coalesce(s2.student, s1.student) AS student 
FROM seat s1
LEFT JOIN seat s2
ON
(s1.id + 1 ) ^ 1 - 1 = s2.id
ORDER BY s1.id

