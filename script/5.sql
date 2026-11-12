SELECT surname, address FROM insurer WHERE discount < 2;
SELECT type, max_insurers FROM insurance_type
        WHERE NOT weekly_fee > 1000 AND payment_address <> 'Советский'
        ORDER BY max_insurers;
SELECT surname FROM agent WHERE address = 'Приокский';