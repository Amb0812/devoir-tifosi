-- 1) Afficher la liste des noms focaccias par ordre croissant
SELECT nom FROM focaccia ORDER BY nom ASC;

-- Resultat obtenu et attendu : Americaine, Emmentalaccia, Gorgonzollaccia, Hawaienne, Mozaccia, Paysanne, Raclaccia, Tradizione.
-- Commentaire : tout est ok.

-- 2) Afficher le nombre total d'ingredients
SELECT COUNT(*) AS total_ingredients FROM ingredient;
--Resultat obtenu et attendu : total_ingredients:25

-- 3) Afficher le prix moyen des focaccias,
SELECT AVG(Prix) AS PrixMoyen FROM focaccia; -- AVG: additionne toutes les valeurs de la colonne prix et divise par nbr tot de ligne.
-- Resultat attendu: 10,37
-- Résultat obtenu : 10.375000

-- Commentaire : un écart au niveau du nombre de chiffre après la virgule.

-- 4) Afficher la liste des boissons avec leur marque, triee par nom de boisson
SELECT boi.nom AS boisson, mar.nom AS marque FROM boisson boi
JOIN marque AS mar ON boi.id_marque = mar.id_marque
ORDER BY boi.nom ASC;

--Resultat attendu et obtenu :
-- Capri-sun  Coca-cola
-- Coca-cola original  Coca-cola
-- Coca-cola zero | Coca-cola
-- Eau de source | Cristalline
-- Fanta citron | Coca-cola
-- Fanta orange | Coca-cola
-- Lipton Peach  Pepsico
-- Lipton zero citron | Pepsico
-- Monster energy ultra blue | Monster
-- Monster energy ultra gold | Monster
-- Pepsi | Pepsico
-- Pepsi Max Zero | Pepsico

-- 4) Afficher la liste des ingredients pour une Raclaccia
SELECT i.nom AS ingredient 
FROM focaccia AS f
JOIN comprend AS c ON f.id_focaccia = c.id_focaccia
JOIN ingredient AS i ON c.id_ingredient = i.id_ingredient
WHERE f.nom = 'Raclaccia';

-- Resultat attendu: je m'attendais à ce résultat, mais pas qu'elles soient dans l'ordre alphabétique.

-- Résultat obtenu : 

-- ingredient:
-- Ail
-- Base Tomate
-- Champignon
-- Cresson
-- Parmesan
-- Poivre
-- Raclette

--Commentaire : ça a été rangée dans l'ordre alphabetique, alors que je n'ai pas mis d'ORDER BY ?

-- 6) Afficher le nom et le nombre d'ingredients pour chaque foccacia
SELECT f.nom, COUNT(c.id_ingredient) AS nombre_ingredients
FROM focaccia AS f
LEFT JOIN comprend AS c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom;

--Résultats attendu et obtenu: 
-- nom      nombre_ingredients
-- Mozaccia             10
-- Gorgonzollaccia      8
-- Raclaccia            7
-- Emmentalaccia        7
-- Tradizione           9
-- Hawaienne            9
-- Américaine           8
--Paysanne            12

-- 7) Afficher le nom de la focaccia qui a le plus d'ingrédients
SELECT f.nom, COUNT(c.id_ingredient) AS nombre_ingredients
FROM focaccia AS f -- à partir de la tab focaccia, avec alias f
JOIN comprend AS c ON f.id_focaccia = c.id_focaccia -- dans la tab comprend, on va coller chaque même id_focaccia des deux côtés
GROUP BY f.id_focaccia, f.nom -- On regroupe les noms des mêmes focaccias en un paquet et on compte dans chaque paquet
ORDER BY nombre_ingredients DESC -- Ici on range du plus grand au plus petit, (ASC =/ DESC)
LIMIT 1 -- Ici on va garder que la première ligne du résultat

-- Résultat attendu et obtenu : 
-- nom         nombre_ingredients
-- paysanne         12


-- 8) Afficher la liste des focaccias qui contiennent de l'ail,
SELECT f.nom 
FROM focaccia AS f
JOIN comprend AS c ON f.id_focaccia = c.id_focaccia
JOIN ingredient AS i ON c.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail';

-- résultat attendu et obtenu: 

-- nom
-- Mozaccia
-- Gorgonzollaccia
-- Raclaccia
-- Paysanne

-- 9) Afficher la liste des ingrédients inutilisés,
SELECT i.nom
FROM ingredient AS i
LEFT JOIN comprend AS c ON i.id_ingredient = c.id_ingredient
WHERE c.id_ingredient IS NULL;

-- Résultat attendu et obtenu : 

-- nom
-- Salami
-- Tomate cerise

-- 10) Afficher la liste des focaccia qui n'ont pas de champignons
SELECT f.nom
FROM focaccia f 
LEFT JOIN comprend c ON f.id_focaccia = c.id_focaccia
LEFT JOIN ingredient i ON i.id_ingredient = c.id_ingredient AND i.nom = 'Champignon'
WHERE i.id_ingredient IS NULL;

-- Résultat attendu : la liste des noms focaccias : hawaienne et américaine

-- résultat obtenu : 
-- nom: Mozaccia x8   Gorgonzollaccia x7   Raclaccia x6   Emmentalaccia x3 etc

-- commentaire : ce n'est pas le résultat attendu