USE tifosi;

-- Création Table "client"
CREATE TABLE client (
    id_client INT NOT NULL,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT,
    PRIMARY KEY (id_client)
);