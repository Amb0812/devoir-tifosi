-- 1) Afficher la liste des noms focaccias par ordre croissant
SELECT nom FROM focaccia ORDER BY nom ASC;

-- Resultat obtenu et attendu : Americaine, Emmentalaccia, Gorgonzollaccia, Hawaienne, Mozaccia, Paysanne, Raclaccia, Tradizione.
-- Commentaire : tout est ok.

-- 2) Afficher le nombre total d'ingredients
SELECT COUNT(*) AS total_ingredients FROM ingredient;
--Resultat obtenu et attendu : total_ingredients:25

-- 3) Afficher le prix moyen des focaccias,
SELECT AVG(Prix) AS PrixMoyen FROM focaccia;
--Resultat attendu et obtenu : 10.37

-- 4) Afficher la liste des boissons avec leur marque, triee par nom de boisson
SELECT boi.nom AS boisson, mar.nom AS marque FROM boisson boi
JOIN marque mar ON boi.id_marque = mar.id_marque
ORDER BY boi.nom ASC;

--Resultat attendu et obtenu :
-- Capri-sun | Coca-cola
-- Coca-cola original | Coca-cola
-- Coca-cola zero | Coca-cola
-- Eau de source | Cristalline
-- Fanta citron | Coca-cola
-- Fanta orange | Coca-cola
-- Lipton Peach | Pepsico
-- Lipton zero citron | Pepsico
-- Monster energy ultra blue | Monster
-- Monster energy ultra gold | Monster
-- Pepsi | Pepsico
-- Pepsi Max Zero | Pepsico

-- 4) Afficher la liste des ingredients pour une Raclaccia
SELECT i.nom AS ingredient 
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE f.nom = 'Raclaccia';

--Resultat attendu et obtenu : 
--ingredient:
--Ail
--Base Tomate
--Champignon
--Cresson
--Parmesan
--Poivre
--Raclette

--Commentaires : ça a ete range dans l'ordre alphabetique sans que je le precise.

-- 6) Afficher le nom et le nombre d'ingredients pour chaque foccacia
SELECT f.nom, COUNT(c.id_ingredient) AS nombre_ingredients
FROM focaccia f
LEFT JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom;

--Résultats attendu et obtenu: 
-- nom      nombre_ingredients
--Mozaccia             10
--Gorgonzollaccia      8
--Raclaccia            7
--Emmentalaccia        7
--Tradizione           9
--Hawaienne            9
--Américaine           8
--Paysanne            12
