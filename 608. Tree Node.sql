
--Using union
SELECT id,'Root' AS type
FROM   tree
WHERE  p_id IS NULL

UNION

SELECT id,'Leaf' AS type
FROM   tree
WHERE  id NOT IN (SELECT DISTINCT p_id FROM tree WHERE p_id IS NOT NULL)
       AND p_id IS NOT NULL
	   
UNION

SELECT id,'Inner' AS type
FROM   tree
WHERE  id IN (SELECT DISTINCT p_id FROM tree WHERE p_id IS NOT NULL)
       AND p_id IS NOT NULL; 

	   
	   
-- Using Case statement   
SELECT id,
CASE WHEN p_id IS NULL THEN 'Root'
WHEN id IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Inner'
ELSE 'Leaf'
END AS TYPE
FROM Tree


-- Using IF statement
SELECT id, 
IF(ISNULL(p_id),'Root',
IF(id IN (SELECT DISTINCT p_id from Tree where p_id IS NOT NULL),'Inner','Leaf')) as Type
from Tree


