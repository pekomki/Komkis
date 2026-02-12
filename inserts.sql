00INSERT INTO DIAGWNIZOMENOS (code_d, name_d, age_d, talent)
VALUES
(1, 'Γιάννης Παπαδόπουλος', 25, 'Τραγούδι'),
(2, 'Μαρία Κωνσταντίνου', 30, 'Χορός'),
(3, 'Νίκος Δημητρίου', 22, 'Μαγικά');

INSERT INTO EKPOMPH (code_e, name_e, hmerominia, location)
VALUES
('E001', 'Talent Show 1', '2025-01-10', 'Αθήνα'),
('E002', 'Talent Show 2', '2025-01-17', 'Θεσσαλονίκη'),
('E003', 'Talent Show 3', '2025-02-01', 'Πάτρα');

INSERT INTO KRITHS (code_k, name_k, empeiria, eidikotita)
VALUES
('K0001', 'Αντώνης Ρέμος', 10, 'Τραγούδι'),
('K0002', 'Ελένη Φουρέιρα', 7, 'Χορός'),
('K0003', 'Κώστας Μακεδόνας', 12, 'Μουσική');

INSERT INTO SYMMETEXEI (code_d, code_e)
VALUES
(1, 'E001'),
(1, 'E002'),   -- Ο Γιάννης εμφανίζεται σε 2 εκπομπές
(2, 'E001'),
(2, 'E003'),   -- Η Μαρία εμφανίζεται σε 2 εκπομπές
(3, 'E002');   -- Η εκπομπή E002 έχει 2 διαγωνιζόμενους



INSERT INTO KRITHEI (code_k, code_d, vathmos, sxolia)
VALUES
('K0001', 1, 9.5, 'Εξαιρετική εμφάνιση'),
('K0002', 1, 8.7, 'Πολύ καλός'),

('K0001', 2, 8.9, 'Δυναμική παρουσία'),
('K0003', 2, 9.1, 'Πολύ καλή τεχνική'),

('K0002', 3, 8.2, 'Καλός συνολικά'),
('K0003', 3, 8.8, 'Εντυπωσιακός');

select * from SYMMETEXEI;
SHOW TABLES;