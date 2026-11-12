SELECT ROUND(AVG(i.discount), 2) AS avg_discount
FROM insurer i
WHERE EXISTS (SELECT 1 FROM agent WHERE address = 'Нижегродский')
  AND NOT EXISTS (
    SELECT 1 FROM agent a
    WHERE a.address = 'Нижегродский'
      AND NOT EXISTS (
        SELECT 1 FROM contract c
        WHERE c.insurer_id = i.id
          AND c.agent_id = a.id
    )
);

SELECT COUNT(DISTINCT c.insurer_id) AS insurers_count
FROM contract c
JOIN agent a ON a.id = c.agent_id
WHERE a.surname = 'Вишнякова'
    AND c.cost > 50000;

SELECT a.surname FROM agent a
WHERE a.commission > (
    SELECT AVG(a.commission) FROM agent a
);

SELECT COALESCE(SUM(c.cost),0) FROM contract c
JOIN agent a ON a.id = c.agent_id
JOIN insurer i ON i.id = c.insurer_id
WHERE a.address = 'Нижегородский' AND
      i.address = 'Сормово';

