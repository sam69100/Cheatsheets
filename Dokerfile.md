# cheat sheet Dockerfile

Une référence rapide pour les instructions courantes dans un **Dockerfile**, avec fonctions, commandes et exemples.

---

## 1. Définir l’image de base
**Fonction** : Spécifier l’image de départ pour le conteneur.  
**Commande** : `FROM <image>:<tag>`  
**Exemple** : `FROM ubuntu:20.04`  
- Utilise Ubuntu 20.04 comme image de base.

---

## 2. Définir le répertoire de travail
**Fonction** : Définir le dossier dans lequel les commandes suivantes s’exécutent.  
**Commande** : `WORKDIR <path>`  
**Exemple** : `WORKDIR /app`  
- Définit /app comme répertoire de travail dans le conteneur.

---

## 3. Copier des fichiers
**Fonction** : Ajouter des fichiers locaux dans l’image.  
**Commande** : `COPY <source> <destination>`  
**Exemple** : `COPY . /app`  
- Copie tous les fichiers du répertoire courant local vers /app dans l’image.

---

## 4. Exécuter une commande pendant la construction
**Fonction** : Lancer une commande lors de la création de l’image.  
**Commande** : `RUN <command>`  
**Exemple** : `RUN apt-get update && apt-get install -y python3`  
- Met à jour les paquets et installe Python 3 dans l’image.

---

## 5. Définir la commande par défaut
**Fonction** : Spécifier la commande exécutée au démarrage du conteneur.  
**Commande** : `CMD ["executable", "param1", "param2"]`  
**Exemple** : `CMD ["python3", "app.py"]`  
- Exécute app.py avec Python 3 quand le conteneur démarre.

---

## 6. Définir le point d’entrée
**Fonction** : Spécifier une commande de base modifiable par des arguments.  
**Commande** : `ENTRYPOINT ["executable", "param1"]`  
**Exemple** : `ENTRYPOINT ["nginx", "-g", "daemon off;"]`  
- Lance Nginx en mode foreground comme commande de base.

---

## 7. Exposer un port
**Fonction** : Indiquer les ports écoutés par le conteneur (documentation).  
**Commande** : `EXPOSE <port>`  
**Exemple** : `EXPOSE 80`  
- Signale que le conteneur écoute sur le port 80.

---

## 8. Ajouter des variables d’environnement
**Fonction** : Définir des variables accessibles dans le conteneur.  
**Commande** : `ENV <key>=<value>`  
**Exemple** : `ENV APP_VERSION=1.0`  
- Définit la variable d’environnement APP_VERSION à 1.0.

---

## 9. Ajouter des fichiers depuis une URL
**Fonction** : Télécharger et ajouter des fichiers dans l’image.  
**Commande** : `ADD <source_url> <destination>`  
**Exemple** : `ADD https://example.com/file.tar.gz /app/`  
- Télécharge file.tar.gz et le place dans /app (extrait automatiquement si archive).

---

## 10. Définir un utilisateur
**Fonction** : Spécifier l’utilisateur exécutant les commandes dans le conteneur.  
**Commande** : `USER <username>`  
**Exemple** : `USER appuser`  
- Exécute les commandes suivantes en tant qu’utilisateur appuser.

---

## Notes importantes
- **Bonnes pratiques** : Minimisez les couches (ex. : `RUN` avec `&&`), utilisez des tags spécifiques.
- **Documentation** : Consultez `docker build --help` ou la doc officielle pour plus d’instructions.
- **Dépendances** : Un Dockerfile nécessite Docker installé pour être construit.

---

