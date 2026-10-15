USE tifosi;

-- Création Table "menu"
CREATE TABLE menu (
    id_menu INT NOT NULL,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL,
    id_focaccia INT NOT NULL,
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);