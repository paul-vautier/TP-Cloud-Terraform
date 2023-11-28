# TP Cloud : Matthis HOULES, Paul VAUTIER 

## Résumé 

- [x] Partie 1 : Entièrement complétée. Pas de configuration nécessaire.
- [x] Partie 2 : Entièrement complétée. Utilisation des modules Il est nécessaire d'ajouter la clé API au format json dans le fichier désigné par la variable api_key 
- [ ] Partie 3 : Non complétée. Le déploiement de la base de donnée REDIS est fonctionnel. Il faut fournir la clé OPENSTACK dans le fichier v3/os-admin.pem

## CI-CD

La CI-CD est basique : En cas de nouveau push sur main, on ajoute terraform (template de base). 
On a aussi un secret stocké dans le repo : Le fichier de clé api stocké en .base64, il est décodé  la volée sur le serveur qui va effectuer le déploiement.
