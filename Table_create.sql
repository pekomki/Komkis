CREATE TABLE DIAGWNIZOMENOS (
    code_d INT PRIMARY KEY,
    name_d VARCHAR(40) NOT NULL,
    age_d INT CHECK (age_d > 0),
    talent VARCHAR(20) NOT NULL
);


CREATE TABLE EKPOMPH (
    code_e CHAR(5) PRIMARY KEY,
    name_e VARCHAR(30) NOT NULL,
    hmerominia DATE NOT NULL,
    location VARCHAR(30)
);


CREATE TABLE KRITHS (
    code_k CHAR(6) PRIMARY KEY,
    name_k VARCHAR(40) NOT NULL,
    empeiria INT CHECK (empeiria >= 0),
    eidikotita VARCHAR(30)
);

CREATE TABLE THEATIS (
    code_th CHAR(6) PRIMARY KEY,
    name_th VARCHAR(40) NOT NULL,
    age_th INT CHECK (age_th > 0),
    email VARCHAR(50) UNIQUE
);

CREATE TABLE TICKET (
    code_t INT PRIMARY KEY,
    code_e CHAR(5) NOT NULL,
    buyer_name VARCHAR(50) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    seat_number VARCHAR(10),
    purchase_date DATE,
    FOREIGN KEY (code_e) REFERENCES EKPOMPH(code_e)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE BIO_DIAGWNIZOMENOU (
    bio_id CHAR(6) PRIMARY KEY,
    code_d INT UNIQUE NOT NULL,
    birth_date DATE,
    hometown VARCHAR(50),
    education VARCHAR(100),
    experience VARCHAR(200),
    FOREIGN KEY (code_d) REFERENCES DIAGWNIZOMENOS(code_d)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE SPONSOR (
    code_s CHAR(5) PRIMARY KEY,
    name_s VARCHAR(50) NOT NULL,
    budget DECIMAL(10,2),
    contact VARCHAR(50)
);

CREATE TABLE KRITHS_DETAILS (
    code_kd CHAR(6) PRIMARY KEY,
    code_k CHAR(6) UNIQUE NOT NULL,
    salary DECIMAL(10,2),
    experience_years INT CHECK (experience_years >= 0),
    specialization VARCHAR(50),
    bonus DECIMAL(10,2),
    FOREIGN KEY (code_k) REFERENCES KRITHS(code_k)
        ON UPDATE CASCADE ON DELETE CASCADE
);



-- Συσχέτιση: symmetexei (N:M) μεταξύ Διαγωνιζόμενου και Εκπομπής
CREATE TABLE SYMMETEXEI (
    code_d INT,
    code_e CHAR(5),
    PRIMARY KEY (code_d, code_e),
    FOREIGN KEY (code_d) REFERENCES DIAGWNIZOMENOS(code_d)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (code_e) REFERENCES EKPOMPH(code_e)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Συσχέτιση: krithei (N:M) μεταξύ Διαγωνιζόμενου και Κριτή
CREATE TABLE KRITHEI (
    code_k CHAR(6),
    code_d INT,
    vathmos DECIMAL(5,2),
    sxolia VARCHAR(200),
    PRIMARY KEY (code_k, code_d),
    FOREIGN KEY (code_k) REFERENCES KRITHS(code_k)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (code_d) REFERENCES DIAGWNIZOMENOS(code_d)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Συσχέτιση: psifos (N:M) μεταξύ Διαγωνιζόμενου και θεατη
CREATE TABLE PSIFOS (
    code_th CHAR(6),
    code_d INT,
    code_e CHAR(5),
    voto BOOLEAN DEFAULT 1,
    PRIMARY KEY (code_th, code_e),
    FOREIGN KEY (code_th) REFERENCES THEATIS(code_th)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (code_d) REFERENCES DIAGWNIZOMENOS(code_d)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (code_e) REFERENCES EKPOMPH(code_e)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Συσχέτιση: SPONSORS_EKPOMPH (N:M) μεταξύ ekpompi και θ sponsor
CREATE TABLE SPONSORS_EKPOMPH (
    code_s CHAR(5),
    code_e CHAR(5),
    sponsorship_amount DECIMAL(10,2),
    PRIMARY KEY (code_s, code_e),
    FOREIGN KEY (code_s) REFERENCES SPONSOR(code_s)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (code_e) REFERENCES EKPOMPH(code_e)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- TICKET = Συσχέτιση 1:N:
-- EKPOMPH (1) —— (N) TICKET
-- Κάθε εισιτήριο ανήκει σε μία εκπομπή
-- Κάθε εκπομπή έχει πολλά εισιτήρια



-- SPONSORSHIP = Συσχέτιση N:M:
-- SPONSOR (N) —— (M) EKPOMPH
-- Ένας χορηγός μπορεί να χορηγεί πολλές εκπομπές
-- Μία εκπομπή μπορεί να έχει πολλούς χορηγούς



-- KRITHS_DETAILS = Συσχέτιση 1:1:
-- KRITHS (1) —— (1) KRITHS_DETAILS
-- Κάθε κριτής έχει ένα σύνολο λεπτομερειών


-- BIO_DIAGWNIZOMENOU = Συσχέτιση 1:1:
-- DIAGWNIZOMENOS (1) —— (1) BIO_DIAGWNIZOMENOU
--
-- Ερμηνεία:
-- - Κάθε Διαγωνιζόμενος έχει ακριβώς ένα Bio (βιογραφικό προφίλ)
-- - Κάθε Bio ανήκει σε έναν μόνο Διαγωνιζόμενο
--



-- PSIFOS = Συσχέτιση N:M για τον Θεατή:
-- THEATIS (Θεατής) N:M DIAGWNIZOMENOS (Διαγωνιζόμενος)
-- Κάθε ψήφος συνδέεται επίσης με μία EKPOMPH (Εκπομπή)
--
-- Ερμηνεία:
-- - Ένας Θεατής μπορεί να ψηφίσει πολλούς Διαγωνιζόμενους
-- - Ένας Διαγωνιζόμενος μπορεί να λάβει ψήφους από πολλούς Θεατές
-- - Η ψήφος αφορά συγκεκριμένη Εκπομπή
--
-- Περιορισμός συμμετοχής:
-- Ένας Θεατής μπορεί να ψηφίσει μόνο ΕΝΑΝ Διαγωνιζόμενο ανά Εκπομπή.

