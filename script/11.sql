SELECT i.surname FROM insurer i
JOIN contract c ON c.insurer_id = i.id
WHERE (c.contract_date = 'Январь' OR c.contract_date = 'Февраль')
AND c.cost >= ALL(
SELECT c.cost FROM contract c
WHERE c.contract_date = 'Январь' OR c.contract_date = 'Февраль'
);

SELECT a.address FROM agent a
WHERE a.commission <= ALL(SELECT a.commission FROM agent a);

SELECT DISTINCT i.address
FROM insurer i
JOIN contract c ON c.insurer_id = i.id
JOIN insurance_type t ON t.id = c.insurance_id
WHERE t.payment_address = 'Нижегродский'
  AND t.weekly_fee >= ALL (
    SELECT t.weekly_fee
    FROM insurance_type t
    WHERE t.payment_address = 'Нижегродский'
);

SELECT DISTINCT t.type FROM contract c
JOIN insurance_type t ON t.id = c.insurance_id
WHERE t.payment_address = ANY(
SELECT i.address FROM insurer i
WHERE i.id = c.insurer_id);
