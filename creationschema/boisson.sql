USE tifosi;

-- Création table "boisson"
CREATE TABLE boisson (
    id_boisson INT NOT NULL,
    nom VARCHAR(50) NOT NULL UNIQUE,
    id_marque INT NOT NULL,
    PRIMARY KEY (id_boisson),
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);