ALTER TABLE contract DROP COLUMN agent_fee;

BEGIN;

ALTER TABLE contract ADD COLUMN agent_fee NUMERIC(12,2);
UPDATE contract c
SET agent_fee = ROUND(c.cost * a.commission / 100, 2)
FROM agent a
WHERE a.id = c.agent_id;

ALTER TABLE contract ALTER COLUMN agent_fee SET NOT NULL;

COMMIT;

SELECT contract_no, cost, agent_fee FROM contract;