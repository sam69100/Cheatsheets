# cheat sheet ftp

Une référence rapide pour les commandes courantes de **ftp**, un outil de transfert de fichiers via le protocole FTP, avec fonctions, commandes et exemples.

---

## 1. Se connecter à un serveur FTP
**Fonction** : Établir une connexion FTP avec un hôte distant.  
**Commande** : `ftp <host>`  
**Exemple** : `ftp 192.168.1.10`  
- Se connecte au serveur FTP à 192.168.1.10 (prompt pour login/mot de passe).

---

## 2. Télécharger un fichier
**Fonction** : Récupérer un fichier du serveur vers le local.  
**Commande** : `get <remote_file> <local_file>`  
**Exemple** : `get file.txt /home/user/file.txt`  
- Télécharge file.txt du serveur vers /home/user/file.txt localement.

---

## 3. Uploader un fichier
**Fonction** : Envoyer un fichier local vers le serveur.  
**Commande** : `put <local_file> <remote_file>`  
**Exemple** : `put /home/user/file.txt file.txt`  
- Envoie file.txt local vers le serveur sous le nom file.txt.

---

## 4. Lister les fichiers distants
**Fonction** : Afficher le contenu du répertoire distant.  
**Commande** : `dir`  
**Exemple** : `dir`  
- Liste les fichiers et dossiers dans le répertoire courant du serveur FTP.

---

## 5. Lister les fichiers locaux
**Fonction** : Afficher le contenu du répertoire local.  
**Commande** : `!dir` (Windows) ou `!ls` (Linux)  
**Exemple** : `!ls`  
- Liste les fichiers dans le répertoire courant local (Linux).

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

## 8. Télécharger plusieurs fichiers
**Fonction** : Récupérer plusieurs fichiers avec des wildcards.  
**Commande** : `mget <pattern>`  
**Exemple** : `mget *.txt`  
- Télécharge tous les fichiers .txt du répertoire courant du serveur.

---

## 9. Uploader plusieurs fichiers
**Fonction** : Envoyer plusieurs fichiers avec des wildcards.  
**Commande** : `mput <pattern>`  
**Exemple** : `mput *.txt`  
- Envoie tous les fichiers .txt locaux vers le répertoire courant du serveur.

---

## 10. Quitter la session FTP
**Fonction** : Fermer la connexion FTP.  
**Commande** : `bye`  
**Exemple** : `bye`  
- Termine la session FTP et revient au terminal local.

---

## Notes importantes
- **Permissions** : Nécessite un compte FTP valide (login/mot de passe).
- **Installation** :  
  ```bash
  sudo apt update && sudo apt install -y ftp
