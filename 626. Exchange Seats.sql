-- Write your MySQL query statement below
SELECT (
    CASE WHEN mod(id,2) !=0 AND id != cnts THEN id+1
    WHEN mod(id,2) !=0 AND id = cnts THEN id
    ELSE id - 1
    END
    ) AS id, student
    FROM seat, 
    (SELECT count(*) AS cnts FROM seat) a
ORDER BY id