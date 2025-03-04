# cheat sheet docker

Une référence rapide pour les commandes courantes de **Docker**, avec fonctions, commandes et exemples.

---

## 1. Lancer un conteneur
**Fonction** : Démarrer un conteneur à partir d’une image.  
**Commande** : `docker run <options> <image>`  
**Exemple** : `docker run -d -p 80:80 nginx`  
- Lance un conteneur Nginx en arrière-plan (-d) et mappe le port 80 local au port 80 du conteneur.

---

## 2. Lister les conteneurs
**Fonction** : Afficher les conteneurs actifs ou tous.  
**Commande** : `docker ps <options>`  
**Exemple** : `docker ps -a`  
- Liste tous les conteneurs, y compris ceux arrêtés.

---

## 3. Arrêter un conteneur
**Fonction** : Stopper un conteneur en cours d’exécution.  
**Commande** : `docker stop <container_id>`  
**Exemple** : `docker stop 1a2b3c4d`  
- Arrête le conteneur avec l’ID 1a2b3c4d.

---

## 4. Supprimer un conteneur
**Fonction** : Supprimer un conteneur arrêté.  
**Commande** : `docker rm <container_id>`  
**Exemple** : `docker rm 1a2b3c4d`  
- Supprime le conteneur avec l’ID 1a2b3c4d.

---

## 5. Lister les images
**Fonction** : Afficher les images Docker disponibles localement.  
**Commande** : `docker images`  
**Exemple** : `docker images`  
- Liste toutes les images téléchargées (ex. : nginx, ubuntu).

---

## 6. Télécharger une image
**Fonction** : Récupérer une image depuis Docker Hub.  
**Commande** : `docker pull <image>`  
**Exemple** : `docker pull ubuntu:20.04`  
- Télécharge l’image Ubuntu version 20.04.

---

## 7. Supprimer une image
**Fonction** : Supprimer une image locale.  
**Commande** : `docker rmi <image_id>`  
**Exemple** : `docker rmi nginx:latest`  
- Supprime l’image nginx avec le tag latest.

---

## 8. Accéder à un conteneur
**Fonction** : Ouvrir un shell dans un conteneur en cours d’exécution.  
**Commande** : `docker exec -it <container_id> <shell>`  
**Exemple** : `docker exec -it 1a2b3c4d /bin/bash`  
- Ouvre un terminal Bash interactif dans le conteneur 1a2b3c4d.

---

## 9. Construire une image
**Fonction** : Créer une image à partir d’un Dockerfile.  
**Commande** : `docker build -t <name:tag> <path>`  
**Exemple** : `docker build -t myapp:1.0 .`  
- Construit une image nommée myapp avec le tag 1.0 à partir du Dockerfile dans le répertoire courant.

---

## 10. Voir les logs d’un conteneur
**Fonction** : Afficher les journaux d’un conteneur.  
**Commande** : `docker logs <container_id>`  
**Exemple** : `docker logs 1a2b3c4d`  
- Affiche les logs du conteneur avec l’ID 1a2b3c4d.

---

## Notes importantes
- **Permissions** : Assurez-vous d’avoir les droits pour exécuter Docker (ex. : ajout au groupe docker).
- **Documentation** : Consultez `docker --help` ou `man docker` pour plus d’options.
- **Dépendances** : Docker doit être installé (ex. : `sudo apt install docker.io` sous Ubuntu).

---
