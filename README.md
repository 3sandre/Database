# Database
_REQUETE POUR AJOUTER UN FILM : 
SELECT * FROM Données.`Categorie-films`;
insert into `Categorie-films`(`Action`, `Comedie`, `Aventure`, 
`Drame`,`Horreur`) values('Heloo', 'helo', 'hel', 'hi','ho');

_REQUETE POUR SUPPRIMER UN FILM :
DELETE FROM `Categorie-films` where id = 10;

_REQUETE POUR MODIFIER UN FILM:
update `Categorie-films` set action = 'Aam' where id = 3;




_REQUETE POUR AJOUTER UN CLIENT : 
SELECT * FROM Données.`info-clients`;
insert into `info-clients`(`Titre`, `Date se sortie`, `Durer`, 
`Réalisateur`) values(‘Backbone’, ‘2000/1/1’, ‘1’, ’Sandrine’);

_REQUETE POUR SUPPRIMER UN CLIENT:
DELETE FROM `info-clients` where id = 1;

_REQUETE POUR MODIFIER UN CLIENT:
update `info-clients` set Titre = ’Teen wolf’ where id = 3;



_REQUETE POUR AJOUTER UN FILM : 
SELECT * FROM Données.`Categorie-films`;
insert into `Categorie-films`(`Action`, `Comedie`, `Aventure`, 
`Drame`,`Horreur`) values('Heloo', 'helo', 'hel', 'hi','ho');

_REQUETE POUR SUPPRIMER UN FILM :
DELETE FROM `Categorie-films` where id = 10;

_REQUETE POUR MODIFIER UN FILM :
update `Categorie-films` set action = 'Aam' where id = 3;

_REQUETE POUR AFFICHER LES TROIS DERNIERS FILMS :
SELECT * FORM Données.info-films ORDER BY idfilms DESC LIMIT 3;
