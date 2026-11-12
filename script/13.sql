SELECT a.surname FROM agent a
WHERE EXISTS (SELECT 1 FROM insurer WHERE address = 'Нижегородский')
  AND NOT EXISTS (
    SELECT 1 FROM insurer i
    WHERE i.address = 'Нижегородский'
      AND NOT EXISTS (
        SELECT 1 FROM contract c
        WHERE c.agent_id = a.id
          AND c.insurer_id = i.id
          AND c.insurance_id IN (SELECT id FROM insurance_type WHERE type = 'Недвижимость')
    )
);

SELECT t.type FROM insurance_type t
WHERE EXISTS(
    SELECT 1 FROM contract c
    JOIN insurer i ON i.id = c.insurer_id
    WHERE c.contract_date IN ('Январь', 'Февраль', 'Март', 'Апрель')
    AND c.insurance_id = t.id
    AND i.discount = (SELECT MAX(i2.discount) FROM insurer i2));

SELECT a.surname FROM agent a
WHERE EXISTS (SELECT 1 FROM insurance_type)
  AND NOT EXISTS (
    SELECT 1 FROM insurance_type t
    WHERE NOT EXISTS (
        SELECT 1 FROM contract c
        WHERE c.agent_id = a.id
          AND c.insurance_id = t.id
    )
);

SELECT i.surname FROM insurer i
WHERE NOT EXISTS (
    SELECT 1 FROM contract c
    JOIN insurance_type t ON t.id = c.insurance_id
    WHERE c.insurer_id = i.id
    AND c.contract_date IN ('Декабрь', 'Январь', 'Февраль')
    AND t.payment_address <> i.address
);