BEGIN;

TRUNCATE TABLE author, book, loan RESTART IDENTITY CASCADE;

-- Auteurs
INSERT INTO author (lastname, firstname) VALUES
('Dupont','Axelle'),
('Dubois', 'Fabien'),
('Rossignol', 'Albert');

-- Livres
INSERT INTO book (title, year, id_author) VALUES
('Les aventures de Milou', 2007, 1),
('Les pôts cassées', 1995, 2),
('Le chagrin',2010, 3),
('Le dauphin bleu',2022, 1 ),
('La grotte du lac',1993, 2);

-- Emprunt
INSERT INTO loan ( name_client, loan_date, return_date, id_book) VALUES
('Henry','22-07-2025', NULL, 2),
('Abigael','19-01-2025', NULL, 1),
('Théo','06-11-2025','12-12-2025', 4),
('Léo','15-06-2025','07-07-2025', 5);

-- Tous les emprunts commencés en juillet 2025

SELECT *
FROM loan
WHERE loan_date BETWEEN '2025-07-01' AND '2025-07-31';

-- Calculer la durée moyenne (en jours) des emprunts terminés.
SELECT AVG (return_date - loan_date) AS duree_moyenne_jours
FROM loan
WHERE return_date IS NOT NULL

-- Classer les auteurs par nombre de livres empruntés (même en cours).
SELECT  author.id, author.firstname, author.lastname, COUNT(loan.id) as nb_emprunts
FROM author
JOIN book ON author.id = book.id_author
JOIN loan ON book.id = loan.id_book
GROUP BY author.id, author.firstname, author.lastname
ORDER BY nb_emprunts DESC;

-- Trouver les livres qui n'apparaissent dans aucune table loan.
SELECT *
FROM book
LEFT JOIN loan 
ON book.id = loan.id_book
WHERE loan.id IS NULL

SELECT title, lastname, firstname 
FROM book
JOIN author
ON book.id_author = author.id

SELECT *
FROM book
WHERE year > 2015;

SELECT *
FROM loan 
WHERE return_date IS NULL

SELECT name_client, COUNT(*) AS nb_emprunts
FROM loan
GROUP BY name_client;

SELECT  a.lastname, a.firstname
FROM author a
JOIN book b ON a.id = b.id_author
JOIN loan l ON b.id = l.id_book
WHERE l.return_date IS NULL;





-- Mets à jour un emprunt pour ajouter une date_retour (le livre a été rendu).
UPDATE loan
SET return_date = '15-08-2025'
WHERE id = 2;

-- Supprime un livre qui n’a jamais été emprunté (utilise éventuellement une sous-requête pour vérifier)
DELETE 
FROM book
WHERE id NOT IN (
    SELECT id_book
    FROM loan
);


COMMIT;