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

---------------------------------------------------------------
-- Πίνακας DIAGWNIZOMENOS (5 εγγραφές)
---------------------------------------------------------------
INSERT INTO DIAGWNIZOMENOS (code_d, name_d, age_d, talent)
VALUES
(1, 'Γιάννης Παπαδόπουλος', 25, 'Τραγούδι'),
(2, 'Μαρία Κωνσταντίνου', 30, 'Χορός'),
(3, 'Νίκος Δημητρίου', 22, 'Μαγικά'),
(4, 'Ελένη Καραγιάννη', 28, 'Stand-up'),
(5, 'Αντώνης Ζήσης', 19, 'Κρουστά');

---------------------------------------------------------------
-- Πίνακας EKPOMPH (5 εγγραφές)
---------------------------------------------------------------
INSERT INTO EKPOMPH (code_e, name_e, hmerominia, location)
VALUES
('E001', 'Talent Show 1', '2025-01-10', 'Αθήνα'),
('E002', 'Talent Show 2', '2025-01-17', 'Θεσσαλονίκη'),
('E003', 'Talent Show 3', '2025-02-01', 'Πάτρα'),
('E004', 'Live Show 1', '2025-02-10', 'Αθήνα'),
('E005', 'Semi Final', '2025-02-15', 'Ηράκλειο');
('E006', '2Hot 2Handle', '2026-01-11', 'Καβάλα');
---------------------------------------------------------------
-- Πίνακας KRITHS (5 εγγραφές)
---------------------------------------------------------------
INSERT INTO KRITHS (code_k, name_k, empeiria, eidikotita)
VALUES
('K0001', 'Αντώνης Ρέμος', 10, 'Τραγούδι'),
('K0002', 'Ελένη Φουρέιρα', 7, 'Χορός'),
('K0003', 'Κώστας Μακεδόνας', 12, 'Μουσική'),
('K0004', 'Σταύρος Θεοδωράκης', 9, 'Επικοινωνία'),
('K0005', 'Αγγελική Λάμπρη', 6, 'Υποκριτική');

---------------------------------------------------------------
-- Πίνακας THEATIS (5 εγγραφές)
---------------------------------------------------------------
INSERT INTO THEATIS (code_th, name_th, age_th, email)
VALUES
('T001', 'Πέτρος Λύρας', 25, 'petros@example.com'),
('T002', 'Μαρίνα Μυλωνά', 30, 'marina@example.com'),
('T003', 'Δήμητρα Χατζή', 28, 'dimitra@example.com'),
('T004', 'Αντώνης Ρήγας', 35, 'antonis@example.com'),
('T005', 'Σοφία Κρέμου', 22, 'sofia@example.com');

---------------------------------------------------------------
-- Πίνακας BIO_DIAGWNIZOMENOU (1:1 με Διαγωνιζόμενο)
---------------------------------------------------------------
INSERT INTO BIO_DIAGWNIZOMENOU (bio_id, code_d, birth_date, hometown, education, experience)
VALUES
('B001', 1, '2000-02-15', 'Αθήνα', 'Μουσική Σχολή', '5 χρόνια φωνητικής'),
('B002', 2, '1995-07-22', 'Λάρισα', 'Σχολή Χορού', '10 χρόνια χορού'),
('B003', 3, '2003-11-03', 'Θεσσαλονίκη', 'Σεμινάρια Ταχυδακτυλουργίας', 'Ειδίκευση σε illusions'),
('B004', 4, '1997-04-09', 'Πάτρα', 'Θεατρική σχολή', 'Stand-up σε μικρές σκηνές'),
('B005', 5, '2005-01-01', 'Ηράκλειο', 'Ωδείο', '5 χρόνια τύμπανα');

---------------------------------------------------------------
-- Πίνακας KRITHS_DETAILS (1:1 με Κριτή)
---------------------------------------------------------------
INSERT INTO KRITHS_DETAILS (code_kd, code_k, salary, experience_years, specialization, bonus)
VALUES
('KD001', 'K0001', 3000, 10, 'Φωνητική', 300),
('KD002', 'K0002', 2500, 7, 'Σύγχρονος Χορός', 250),
('KD003', 'K0003', 3500, 12, 'Μουσική Σκηνοθεσία', 400),
('KD004', 'K0004', 2700, 9, 'Παρουσίαση', 200),
('KD005', 'K0005', 2600, 6, 'Υποκριτική', 180);

---------------------------------------------------------------
-- Πίνακας SPONSOR (5 εγγραφές)
---------------------------------------------------------------
INSERT INTO SPONSOR (code_s, name_s, budget, contact)
VALUES
('S001', 'Coca Cola', 50000, 'coca@corp.com'),
('S002', 'Wind', 30000, 'wind@corp.com'),
('S003', 'Nike', 45000, 'nike@corp.com'),
('S004', 'Cosmote', 35000, 'cosmote@corp.com'),
('S005', 'AB Βασιλόπουλος', 25000, 'ab@corp.com');

---------------------------------------------------------------
-- Πίνακας TICKET (5 εγγραφές) — 1:N με EKPOMPH
---------------------------------------------------------------
INSERT INTO TICKET (code_t, code_e, buyer_name, price, seat_number, purchase_date)
VALUES
(101, 'E001', 'Πέτρος Λύρας', 15.00, 'A12', '2025-01-05'),
(102, 'E001', 'Μαρίνα Μυλωνά', 15.00, 'A13', '2025-01-06'),
(103, 'E002', 'Δήμητρα Χατζή', 15.00, 'B05', '2025-01-15'),
(104, 'E003', 'Αντώνης Ρήγας', 20.00, 'C20', '2025-01-30'),
(105, 'E003', 'Σοφία Κρέμου', 20.00, 'C21', '2025-01-30');

---------------------------------------------------------------
-- Συσχέτιση SYMMETEXEI (N:M Διαγωνιζόμενος–Εκπομπή)
---------------------------------------------------------------
INSERT INTO SYMMETEXEI (code_d, code_e)
VALUES
(1, 'E001'),
(1, 'E002'),
(2, 'E001'),
(2, 'E003'),
(3, 'E002'),
(3, 'E003'),
(4, 'E004'),
(5, 'E003'),
(5, 'E005');

---------------------------------------------------------------
-- Συσχέτιση KRITHEI (N:M Κριτής–Διαγωνιζόμενος)
---------------------------------------------------------------
INSERT INTO KRITHEI (code_k, code_d, vathmos, sxolia)
VALUES
('K0001', 1, 9.5, 'Εξαιρετική εμφάνιση'),
('K0002', 1, 8.7, 'Πολύ καλός'),
('K0001', 2, 8.9, 'Δυναμική παρουσία'),
('K0003', 2, 9.1, 'Πολύ καλή τεχνική'),
('K0002', 3, 8.2, 'Καλός συνολικά'),
('K0003', 3, 8.8, 'Εντυπωσιακός'),
('K0004', 4, 8.0, 'Καλή ενέργεια'),
('K0005', 5, 7.9, 'Σταθερός ρυθμός');

---------------------------------------------------------------
-- Συσχέτιση PSIFOS (N:M Θεατής–Διαγωνιζόμενος–Εκπομπή)
---------------------------------------------------------------
INSERT INTO PSIFOS (code_th, code_d, code_e, voto)
VALUES
('T001', 1, 'E001', 1),
('T001', 2, 'E002', 1),
('T002', 3, 'E002', 1),
('T003', 5, 'E003', 1),
('T004', 1, 'E003', 1),
('T005', 4, 'E004', 1);

---------------------------------------------------------------
-- Συσχέτιση SPONSORS_EKPOMPH (N:M Sponsor–Ekpomph)
---------------------------------------------------------------
INSERT INTO SPONSORS_EKPOMPH (code_s, code_e, sponsorship_amount)
VALUES
('S001', 'E003', 10000),
('S001', 'E005', 8000),
('S002', 'E001', 5000),
('S003', 'E003', 12000),
('S004', 'E002', 7000),
('S005', 'E004', 6000);

-- like
SELECT * FROM KRITHS WHERE name_k like 'Α%';
SELECT * FROM EKPOMPH WHERE location like 'Θεσσαλονίκη';

--  ταξινομηση
SELECT * FROM KRITHEI WHERE vathmos > 8.5 ORDER BY vathmos;
-- φιλτραρισμα και χρηση and
SELECT name_th,age_th FROM THEATIS WHERE age_th <=30 and age_th>=25 ORDER BY age_th;
-- χρηση not
SELECT buyer_name,price,seat_number FROM TICKET WHERE NOT price = 15;

-- count και sum
SELECT sum(price) as esoda,code_e FROM TICKET GROUP BY code_e;
SELECT COUNT(*) as symmetexontes,code_e FROM SYMMETEXEI GROUP BY code_e;


-- inner-left join
SELECT DIAGWNIZOMENOS.name_d,PSIFOS.code_th FROM DIAGWNIZOMENOS INNER JOIN PSIFOS ON DIAGWNIZOMENOS.code_d = PSIFOS.code_d;
SELECT EKPOMPH.name_e,SPONSORS_EKPOMPH.code_s FROM EKPOMPH LEFT JOIN SPONSORS_EKPOMPH ON EKPOMPH.code_e = SPONSORS_EKPOMPH.code_e;


-- view

CREATE VIEW paiktisekpomph AS 
SELECT
DIAGWNIZOMENOS.name_d as ONOMA_D,
DIAGWNIZOMENOS.code_d as KWDIKOS_D,
DIAGWNIZOMENOS.talent as TALENTO,
EKPOMPH.name_e as ONOMA_E,
EKPOMPH.location as TOPOTHESIA

FROM DIAGWNIZOMENOS
JOIN SYMMETEXEI ON DIAGWNIZOMENOS.code_d = SYMMETEXEI.code_d
JOIN EKPOMPH ON SYMMETEXEI.code_e = EKPOMPH.code_e;

SELECT * FROM paiktisekpomph;

DELIMITER $$
CREATE PROCEDURE diadposo(IN timi INT)
BEGIN
    
    SELECT 
    name_s AS ETAIRIA,
    budget AS Poso
    FROM SPONSOR
    ORDER BY budget DESC
    LIMIT timi ;
    
END$$

DELIMITER ;

DROP PROCEDURE IF EXISTS diadposo;

CALL diadposo(3);

DELIMITER $$

CREATE TRIGGER ELEGXOSTHEATWN
BEFORE INSERT
ON THEATIS
FOR EACH ROW

BEGIN

IF NEW.email NOT LIKE '%@example.com'THEN
SET NEW.email = 'WRONG EMAIL';
END IF;

END$$

DELIMITER ;

DROP TRIGGER ELEGXOSTHEATWN;

INSERT INTO THEATIS()VALUES('T009', 'Πέτρος Λίγδας', 35, 'ligdas@exmple.com');
SELECT * FROM THEATIS;
DELETE FROM THEATIS WHERE code_th='T009';
