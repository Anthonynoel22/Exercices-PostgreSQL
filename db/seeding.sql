BEGIN;

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



COMMIT;