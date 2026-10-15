USE tifosi;

-- Création Table "focaccia"
CREATE TABLE focaccia (
    id_focaccia INT NOT NULL,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (id_focaccia)
);