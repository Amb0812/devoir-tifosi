USE tifosi;

-- Création Table "comprend"
CREATE TABLE comprend (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);




