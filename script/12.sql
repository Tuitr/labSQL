SELECT a.address FROM agent a
UNION
SELECT t.payment_address FROM insurance_type t;