CREATE DATABASE salons_db;
USE salons_db;

CREATE TABLE salons(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    ville VARCHAR(100) NOT NULL
);

CREATE TABLE coiffeurs(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    specialite VARCHAR(100),
    date_embauche DATE NOT NULL,
    id_salon INT,
    FOREIGN KEY (id_salon) REFERENCES salons(id) ON DELETE SET NULL
);

CREATE TABLE clients(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    telephone VARCHAR(30) UNIQUE,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE prestations(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prix DECIMAL(6,2) NOT NULL
);

CREATE TABLE rendezvous(
    id INT PRIMARY KEY AUTO_INCREMENT,
    date_heure DATETIME,
    id_client INT,
    id_coiffeur INT,
    FOREIGN KEY (id_client) REFERENCES clients(id) ON DELETE CASCADE,
    FOREIGN KEY (id_coiffeur) REFERENCES coiffeurs(id) ON DELETE SET NULL
);

CREATE TABLE rdv_prest(
    id_rdv INT,
    id_prestation INT,
    prix_paye DECIMAL(6,2),
    PRIMARY KEY (id_rdv,id_prestation),
    FOREIGN KEY (id_rdv) REFERENCES rendezvous(id),
    FOREIGN KEY (id_prestation) REFERENCES prestations(id)
);

INSERT INTO salons (id, nom, adresse, ville) VALUES
(1, 'Style & Coupe Rivoli', '12 Rue de Rivoli', 'Paris'),
(2, 'Style & Coupe Bastille', '8 Place de la Bastille', 'Paris'),
(3, 'Style & Coupe Lyon Centre', '25 Rue de la République', 'Lyon'),
(4, 'Style & Coupe Marseille Vieux-Port', '3 Quai du Port', 'Marseille');

INSERT INTO coiffeurs (id, nom, prenom, specialite, date_embauche, id_salon) VALUES
(1, 'Martin', 'Claire', 'Coloration', '2022-06-15', 1),
(2, 'Bernard', 'Lucas', 'Coupe homme', '2023-02-10', 1),
(3, 'Petit', 'Sonia', 'Brushing', '2024-01-05', 2),
(4, 'Robert', 'Nadia', 'Coloration', '2023-03-12', 2),
(5, 'Richard', 'Yassine', 'Barbe', '2021-11-20', 3),
(6, 'Durand', 'Emma', 'Soin capillaire', '2023-09-01', 3),
(7, 'Moreau', 'Ines', 'Coupe femme', '2025-01-15', 4),
(8, 'Simon', 'Karim', 'Coloration', '2022-12-01', 4);

INSERT INTO clients (id, nom, prenom, telephone, email) VALUES
(1, 'Dupont', 'Marie', '0600000001', 'marie.dupont@mail.com'),
(2, 'Leroy', 'Paul', '0600000002', 'paul.leroy@mail.com'),
(3, 'Garcia', 'Lea', '0600000003', NULL),
(4, 'Morel', 'Yanis', '0600000004', 'yanis.morel@mail.com'),
(5, 'Fournier', 'Sarah', '0600000005', 'sarah.fournier@mail.com'),
(6, 'Andre', 'Nora', '0600000006', NULL),
(7, 'Mercier', 'Hugo', '0600000007', 'hugo.mercier@mail.com'),
(8, 'Lambert', 'Jade', '0600000008', 'jade.lambert@mail.com');

INSERT INTO prestations (id, nom, prix) VALUES
(1, 'Coupe homme', 25.00),
(2, 'Coupe femme', 45.00),
(3, 'Coloration', 60.00),
(4, 'Shampoing', 20.00),
(5, 'Brushing', 35.00),
(6, 'Barbe', 15.00),
(7, 'Soin capillaire', 50.00),
(8, 'Balayage', 90.00);

INSERT INTO rendezvous (id, date_heure, id_client, id_coiffeur) VALUES
(1,  '2026-01-10 09:00:00', 1, 1),
(2,  '2026-01-12 11:00:00', 2, 1),
(3,  '2026-01-15 14:00:00', 4, 4),
(4,  '2026-01-20 10:30:00', 5, 1),
(5,  '2026-02-02 15:00:00', 1, 4),
(6,  '2026-02-10 16:00:00', 7, 1),
(7,  '2026-02-15 09:30:00', 8, 4),
(8,  '2026-02-20 12:00:00', 2, 1),
(9,  '2026-03-01 10:00:00', 4, 4),
(10, '2026-03-05 13:00:00', 5, 1),
(11, '2026-03-10 17:00:00', 7, 4),
(12, '2026-03-15 11:30:00', 8, 1),
(13, '2026-03-20 09:00:00', 1, 3),
(14, '2026-03-21 10:00:00', 2, 5),
(15, '2026-03-22 14:00:00', 3, 6),
(16, '2026-03-23 15:30:00', 4, 7),
(17, '2026-03-24 16:00:00', 5, 8),

(18, '2026-04-17 09:00:00', 1, 2),
(19, '2026-04-17 10:00:00', 2, 3),
(20, '2026-04-17 11:00:00', 4, 4),
(21, '2026-04-17 14:00:00', 5, 1),
(22, '2026-04-17 16:00:00', 7, 7),

(23, '2026-04-05 10:00:00', 1, 1),
(24, '2026-04-06 10:30:00', 2, 4),
(25, '2026-04-07 11:00:00', 4, 1),
(26, '2026-04-08 11:30:00', 5, 4),
(27, '2026-04-09 12:00:00', 7, 1),
(28, '2026-04-10 13:00:00', 8, 4);

INSERT INTO rdv_prest (id_rdv, id_prestation, prix_paye) VALUES
(1, 3, 60.00),
(1, 4, 20.00),

(2, 3, 55.00),
(2, 5, 35.00),

(3, 3, 60.00),
(3, 4, 18.00),

(4, 3, 50.00),

(5, 3, 60.00),
(5, 7, 45.00),

(6, 3, 58.00),

(7, 3, 60.00),

(8, 3, 52.00),
(8, 4, 20.00),

(9, 3, 60.00),

(10, 3, 57.00),

(11, 3, 60.00),

(12, 3, 54.00),

(13, 5, 35.00),
(13, 4, 20.00),

(14, 1, 25.00),
(14, 6, 15.00),

(15, 7, 50.00),

(16, 2, 45.00),
(16, 4, 20.00),

(17, 3, 60.00),

(18, 1, 25.00),
(18, 6, 15.00),

(19, 5, 35.00),
(19, 4, 20.00),

(20, 3, 60.00),

(21, 3, 48.00),
(21, 4, 20.00),

(22, 2, 45.00),

(23, 3, 60.00),

(24, 3, 56.00),

(25, 3, 59.00),

(26, 3, 60.00),

(27, 3, 53.00),

(28, 3, 60.00);

SELECT * FROM salons
WHERE ville = 'paris';

SELECT coiffeurs.nom,coiffeurs.prenom FROM coiffeurs
WHERE date_embauche > '2023-01-01';

SELECT * FROM prestations
WHERE prix BETWEEN 20 AND 50
ORDER BY prix ASC;

SELECT c.nom,coif.nom,rdv.date_heure FROM rendezvous rdv
JOIN coiffeurs coif ON coif.id = rdv.id_coiffeur
JOIN clients c ON c.id = rdv.id_client
WHERE CAST(rdv.date_heure AS date) = CURDATE();

SELECT sal.id,sal.nom, COUNT(*) AS total_coifs FROM salons sal
JOIN coiffeurs coif ON coif.id_salon = sal.id
GROUP BY sal.id;

SELECT c.id,c.nom,c.prenom FROM clients c
WHERE c.email IS NOT NULL;

SELECT sal.id,sal.nom, SUM(rdv_prest.prix_paye) AS montant_total FROM salons sal
JOIN coiffeurs coif ON coif.id_salon = sal.id
JOIN rendezvous rdv ON rdv.id_coiffeur = coif.id
JOIN rdv_prest ON rdv_prest.id_rdv = rdv.id
GROUP BY sal.id,sal.nom;

SELECT coif.id,coif.nom,pres.nom, COUNT(*) AS total_prest FROM coiffeurs coif
JOIN rendezvous rdv ON rdv.id_coiffeur = coif.id
JOIN rdv_prest ON rdv_prest.id_rdv = rdv.id
JOIN prestations pres ON pres.id = rdv_prest.id_prestation
WHERE pres.nom = 'Coloration'
GROUP BY coif.id;

SELECT sal.id,sal.nom, SUM(rdv_prest.prix_paye) AS montant_total FROM salons sal
JOIN coiffeurs coif ON coif.id_salon = sal.id
JOIN rendezvous rdv ON rdv.id_coiffeur = coif.id
JOIN rdv_prest ON rdv_prest.id_rdv = rdv.id
GROUP BY sal.id,sal.nom
ORDER BY montant_total DESC
LIMIT 1;

SELECT pres.nom,rdv_prest.prix_paye FROM rdv_prest
RIGHT JOIN prestations pres ON pres.id = rdv_prest.id_prestation
GROUP BY pres.nom
HAVING prix_paye IS NULL;

SELECT coif.nom, AVG(prix_paye) AS moy_coif, COUNT(rdv.id) FROM coiffeurs coif
JOIN rendezvous rdv ON rdv.id_coiffeur = coif.id
JOIN rdv_prest ON rdv_prest.id_rdv = rdv.id
GROUP BY coif.nom;