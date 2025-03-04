# cheat sheet ssh

Une référence rapide pour les commandes courantes de **ssh**, un outil de connexion sécurisée à des machines distantes, avec fonctions, commandes et exemples.

---

## 1. Se connecter à un hôte distant
**Fonction** : Établir une connexion SSH avec un serveur.  
**Commande** : `ssh <user>@<host>`  
**Exemple** : `ssh user@192.168.1.10`  
- Se connecte à 192.168.1.10 avec l’utilisateur "user".

---

## 2. Spécifier un port différent
**Fonction** : Utiliser un port autre que le défaut (22).  
**Commande** : `ssh -p <port> <user>@<host>`  
**Exemple** : `ssh -p 2222 user@192.168.1.10`  
- Se connecte au port 2222 sur 192.168.1.10.

---

## 3. Utiliser une clé privée
**Fonction** : Authentifier avec une clé SSH au lieu d’un mot de passe.  
**Commande** : `ssh -i <key_file> <user>@<host>`  
**Exemple** : `ssh -i ~/.ssh/id_rsa user@192.168.1.10`  
- Se connecte avec la clé privée id_rsa.

---

## 4. Exécuter une commande à distance
**Fonction** : Lancer une commande sur l’hôte distant sans shell interactif.  
**Commande** : `ssh <user>@<host> "<command>"`  
**Exemple** : `ssh user@192.168.1.10 "ls -l"`  
- Exécute "ls -l" sur le serveur et affiche le résultat localement.

---

## 5. Activer le mode verbeux
**Fonction** : Afficher des détails pour le débogage.  
**Commande** : `ssh -v <user>@<host>`  
**Exemple** : `ssh -v user@192.168.1.10`  
- Affiche des informations détaillées sur la connexion.

---

## 6. Transférer un port local (tunneling)
**Fonction** : Rediriger un port local vers un hôte distant.  
**Commande** : `ssh -L <local_port>:<remote_host>:<remote_port> <user>@<host>`  
**Exemple** : `ssh -L 8080:localhost:80 user@192.168.1.10`  
- Redirige le port local 8080 vers le port 80 du serveur distant.

---

## 7. Transférer un port distant (reverse tunneling)
**Fonction** : Rediriger un port distant vers le local.  
**Commande** : `ssh -R <remote_port>:<local_host>:<local_port> <user>@<host>`  
**Exemple** : `ssh -R 2222:localhost:22 user@192.168.1.10`  
- Expose le port 22 local sur le port 2222 du serveur distant.

---

## 8. Désactiver la vérification de l’hôte
**Fonction** : Ignorer la vérification de la clé de l’hôte (non sécurisé).  
**Commande** : `ssh -o StrictHostKeyChecking=no <user>@<host>`  
**Exemple** : `ssh -o StrictHostKeyChecking=no user@192.168.1.10`  
- Se connecte sans vérifier la clé de l’hôte (utile pour scripts).

---

## 9. Garder la connexion active
**Fonction** : Maintenir la session SSH ouverte avec des pings.  
**Commande** : `ssh -o ServerAliveInterval=<seconds> <user>@<host>`  
**Exemple** : `ssh -o ServerAliveInterval=60 user@192.168.1.10`  
- Envoie un ping toutes les 60 secondes pour éviter la déconnexion.

---

## 10. Copier un fichier avec SCP via SSH
**Fonction** : Transférer un fichier sécurisé via SSH.  
**Commande** : `scp <source> <user>@<host>:<destination>`  
**Exemple** : `scp /local/file.txt user@192.168.1.10:/remote/file.txt`  
- Copie file.txt local vers /remote/file.txt sur le serveur.

---

## Notes importantes
- **Permissions** : Nécessite un accès SSH valide (clé ou mot de passe).
- **Installation** : Inclus avec OpenSSH :  
  ```bash
  sudo apt update && sudo apt install -y openssh-client
