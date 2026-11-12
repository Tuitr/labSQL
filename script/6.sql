SELECT c.contract_no, i.surname, c.duration, c.cost
FROM contract c
JOIN insurer i ON i.id = c.insurer_id
ORDER BY c.cost;

SELECT c.contract_date, a.surname, i.type, c.duration
FROM contract c
JOIN agent a ON a.id = c.agent_id
JOIN insurance_type i ON i.id = c.insurance_id;