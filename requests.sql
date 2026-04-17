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