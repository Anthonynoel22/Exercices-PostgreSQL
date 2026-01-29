BEGIN;

DROP TABLE IF EXISTS author, book, loan;
-- Table auteur
CREATE TABLE author (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    lastname TEXT NOT NULL,
    firstname TEXT NOT NULL
);

-- Table livre
CREATE TABLE book (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title TEXT NOT NULL,
    year INTEGER NOT NULL,
    id_author INTEGER NOT NULL REFERENCES author(id)
);

-- Table emprunt
CREATE TABLE loan (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name_client TEXT NOT NULL,
    loan_date DATE NOT NULL,
    return_date  DATE,
    id_book INTEGER NOT NULL REFERENCES book(id)
);

COMMIT;

