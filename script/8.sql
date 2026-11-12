BEGIN;

UPDATE contract c
SET cost = ROUND(c.cost * (1 - i.discount / 100), 2)
FROM insurer i
WHERE i.id = c.insurer_id
RETURNING c.contract_no, i.surname, i.discount, c.cost AS new_cost;

COMMIT;