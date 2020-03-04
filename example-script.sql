WITH levels AS (
  SELECT LEVEL AS lvl
  FROM   DUAL
  CONNECT BY LEVEL <= ( SELECT MAX( DupCount ) FROM TestTable )
)
SELECT Name,
       DupCount
FROM   TestTable
       INNER JOIN
       levels
       ON ( lvl <= DupCount )
ORDER BY Name