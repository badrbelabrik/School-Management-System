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
    FOREIGN KEY (id_salon) REFERENCES salons(id)
);

CREATE TABLE clients(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    telephone INT UNIQUE,
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
    id_prestation INT,
    FOREIGN KEY (id_client) REFERENCES clients(id) ON DELETE CASCADE,
    FOREIGN KEY (id_coiffeur) REFERENCES coiffeurs(id) ON DELETE SET NULL
);

CREATE TABLE rdv_prest(
    id_rdv INT,
    id_prestation INT,
    PRIMARY KEY (id_rdv,id_prestation),
    FOREIGN KEY (id_rdv) REFERENCES rendezvous(id),
    FOREIGN KEY (id_prestation) REFERENCES prestations(id)
)