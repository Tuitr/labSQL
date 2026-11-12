SELECT a.surname, i.surname, i.discount
FROM agent a, insurer i
WHERE (a.id, i.id) IN (SELECT c.agent_id, c.insurer_id FROM contract c)
AND i.discount >= 2
AND i.address <> a.address
ORDER BY i.discount;

SELECT a.surname FROM agent a
WHERE a.id IN (
    SELECT c.agent_id FROM contract c
    WHERE c.contract_date <> 'Январь' AND c.cost > 100000
);

SELECT a.surname FROM agent a
WHERE a.id NOT IN (
    SELECT c.agent_id FROM contract c
    WHERE c.insurer_id IN (
        SELECT i.id FROM insurer i
        WHERE i.address = 'Нижегродский'
    )
);

SELECT t.type FROM insurance_type t
WHERE t.payment_address NOT IN ('Советский');