SELECT a.surname, i.surname, i.discount FROM contract c
JOIN agent a ON a.id = c.agent_id
JOIN insurer i ON i.id = c.insurer_id
WHERE i.discount >= 2 AND i.address <> a.address
ORDER BY i.discount;

SELECT t.type FROM contract c
JOIN insurance_type t ON t.id = c.insurance_id
JOIN insurer i ON i.id = c.insurer_id
WHERE t.payment_address = i.address;

SELECT t.type FROM contract c
JOIN insurance_type t ON t.id = c.insurance_id
WHERE t.weekly_fee > 1300
GROUP BY t.id
HAVING COUNT(DISTINCT c.insurer_id) > 1;

SELECT DISTINCT a.surname FROM contract c
JOIN agent a ON a.id = c.agent_id
WHERE c.contract_date <> 'Январь' AND c.cost > 100000;
