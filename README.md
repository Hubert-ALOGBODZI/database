Base de donnée de LOCATION DE FILM

L'utilisation:

======> Pour ajouter un film:

INSERT INTO films('titre',' date de sortie', 'durée', 'réalisateur') VALUES ([value-1],[value-2],[value-3],[value-4])

=====> Pour modifier un film:

UPDATE films SET titre=[value-1], date de sortie=[value-2], durée=[value-3], réalisateur=[value-4], WHERE idfilms= [idfilms]

=====> Pour supprimer un film:

DELETE FROM films WHERE idfilms= [idfilms]

======> Pour ajouter un utilisateur :

INSERT INTO clients ('nom' , 'prénom' , 'email') VALUES ('', '', '')

======> Pour supprimer un Utilisateur: DELETE FROM clients WHERE clients.idclients = idclients;

======> Pour modifier l'utilisateur: UPDATE clients SET nom = '', prénom = '' WHERE clients.idclients = idclients

======>Requête pour afficher les 3 derniers films ajoutés:

SELECT * FROM films ORDER BY films.date de sortie DESC WHERE idfilms<=3
