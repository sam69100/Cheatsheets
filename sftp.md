# cheat sheet sftp

Une référence rapide pour les commandes courantes de **sftp**, un outil de transfert de fichiers sécurisé via SSH, avec fonctions, commandes et exemples.

---

## 1. Se connecter à un serveur SFTP
**Fonction** : Établir une connexion SFTP avec un hôte distant.  
**Commande** : `sftp <user>@<host>`  
**Exemple** : `sftp user@192.168.1.10`  
- Se connecte au serveur SFTP à 192.168.1.10 avec l’utilisateur "user".

---

## 2. Télécharger un fichier
**Fonction** : Récupérer un fichier du serveur vers le local.  
**Commande** : `get <remote_file> <local_file>`  
**Exemple** : `get /remote/path/file.txt /home/user/file.txt`  
- Télécharge file.txt depuis le serveur vers /home/user/file.txt localement.

---

## 3. Uploader un fichier
**Fonction** : Envoyer un fichier local vers le serveur.  
**Commande** : `put <local_file> <remote_file>`  
**Exemple** : `put /home/user/file.txt /remote/path/file.txt`  
- Envoie file.txt local vers /remote/path/file.txt sur le serveur.

---

## 4. Lister les fichiers distants
**Fonction** : Afficher le contenu d’un répertoire distant.  
**Commande** : `ls`  
**Exemple** : `ls`  
- Liste les fichiers dans le répertoire courant sur le serveur SFTP.

---

## 5. Lister les fichiers locaux
**Fonction** : Afficher le contenu du répertoire local.  
**Commande** : `lls`  
**Exemple** : `lls`  
- Liste les fichiers dans le répertoire courant local.

---

## 6. Changer de répertoire distant
**Fonction** : Naviguer dans un répertoire sur le serveur.  
**Commande** : `cd <directory>`  
**Exemple** : `cd /remote/path`  
- Change le répertoire courant à /remote/path sur le serveur.

---

## 7. Changer de répertoire local
**Fonction** : Naviguer dans un répertoire local.  
**Commande** : `lcd <directory>`  
**Exemple** : `lcd /home/user/downloads`  
- Change le répertoire courant local à /home/user/downloads.

---

## 8. Télécharger un répertoire complet
**Fonction** : Récupérer un répertoire et son contenu du serveur.  
**Commande** : `get -r <remote_dir> <local_dir>`  
**Exemple** : `get -r /remote/path/folder /home/user/folder`  
- Télécharge récursivement le dossier "folder" du serveur.

---

## 9. Uploader un répertoire complet
**Fonction** : Envoyer un répertoire et son contenu vers le serveur.  
**Commande** : `put -r <local_dir> <remote_dir>`  
**Exemple** : `put -r /home/user/folder /remote/path/folder`  
- Envoie récursivement le dossier "folder" local vers le serveur.

---

## 10. Quitter la session SFTP
**Fonction** : Fermer la connexion SFTP.  
**Commande** : `exit`  
**Exemple** : `exit`  
- Termine la session SFTP et revient au terminal local.

---

## Notes importantes
- **Permissions** : Nécessite un accès SSH valide (clé ou mot de passe).
- **Installation** : Inclus avec OpenSSH :  
  ```bash
  sudo apt update && sudo apt install -y openssh-client
