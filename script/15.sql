SELECT c.contract_date, SUM(c.cost) AS total
FROM contract c
JOIN agent a ON a.id = c.agent_id
WHERE a.commission < 5
GROUP BY c.contract_date;

SELECT c.contract_date, COUNT(*) AS contracts
FROM contract c
JOIN insurer i ON i.id = c.insurer_id
WHERE i.discount < 2
GROUP BY c.contract_date
HAVING COUNT(*) < 3;

SELECT a.surname, COALESCE(SUM(c.cost), 0) AS total
FROM agent a
LEFT JOIN contract c ON c.agent_id = a.id
    AND c.contract_date IN ('Март', 'Апрель', 'Май')
GROUP BY a.surname;



SELECT i.surname, COUNT(DISTINCT c.agent_id) AS agents
FROM insurer i
LEFT JOIN contract c ON c.insurer_id = i.id
        AND c.cost > 50000
GROUP BY i.id, i.surname;

