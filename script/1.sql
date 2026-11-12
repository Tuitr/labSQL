CREATE TABLE insurer (
                         id        INTEGER      PRIMARY KEY,
                         surname   VARCHAR(50)  NOT NULL,
                         address   VARCHAR(50)  NOT NULL,
                         discount  NUMERIC(5,2) NOT NULL DEFAULT 0
                             CHECK (discount BETWEEN 0 AND 100)
);

CREATE TABLE agent (
                       id         INTEGER      PRIMARY KEY,
                       surname    VARCHAR(50)  NOT NULL,
                       address    VARCHAR(50)  NOT NULL,
                       commission NUMERIC(5,2) NOT NULL
                           CHECK (commission BETWEEN 0 AND 100)
);

CREATE TABLE insurance_type (
                                id              INTEGER       PRIMARY KEY,
                                type            VARCHAR(50)   NOT NULL,
                                payment_address VARCHAR(50)   NOT NULL,
                                weekly_fee      NUMERIC(10,2) NOT NULL CHECK (weekly_fee > 0),
                                max_insurers    INTEGER       NOT NULL CHECK (max_insurers > 0)
);

CREATE TABLE contract (
                          contract_no   INTEGER       PRIMARY KEY,
                          contract_date DATE          NOT NULL,
                          insurer_id    INTEGER       NOT NULL REFERENCES insurer(id),
                          agent_id      INTEGER       NOT NULL REFERENCES agent(id),
                          insurance_id  INTEGER       NOT NULL REFERENCES insurance_type(id),
                          duration      INTEGER       NOT NULL CHECK (duration > 0),
                          cost          NUMERIC(12,2) NOT NULL CHECK (cost >= 0)
);