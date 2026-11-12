SELECT id, surname, address, discount FROM insurer;
SELECT id, surname, address, commission FROM agent;
SELECT id, type, payment_address, weekly_fee, max_insurers FROM insurance_type;
SELECT contract_no, contract_date, insurer_id, agent_id, insurance_id, duration, cost FROM contract;