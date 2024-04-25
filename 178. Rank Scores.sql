--Using window function
SELECT score, dense_rank() OVER(ORDER BY score DESC) AS 'rank'
FROM Scores


--Without using window function - using self join
SELECT s1.score, count(DISTINCT s2.score) AS 'rank'
FROM scores s1, scores s2
WHERE s2.score >= s1.score
GROUP BY s1.id,s1.score
ORDER BY s1.score DESC


--Another way
SELECT s1.score,
(SELECT count(DISTINCT s2.score) FROM Scores s2 
WHERE s2.score >=s1.score) as 'rank' 
FROM scores s1
ORDER BY score DESC