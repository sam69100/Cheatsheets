# cheat sheet john

Une référence rapide pour les commandes courantes de **John the Ripper**, un outil de cracking de mots de passe, avec fonctions, commandes et exemples.

---

## 1. Attaque par dictionnaire
**Fonction** : Craquer un hash avec une liste de mots.  
**Commande** : `john --wordlist=<wordlist> <hashfile>`  
**Exemple** : `john --wordlist=/usr/share/wordlists/rockyou.txt hashes.txt`  
- Tente de craquer les hashes dans hashes.txt avec rockyou.txt.

---

## 2. Attaque par force brute
**Fonction** : Tester toutes les combinaisons possibles.  
**Commande** : `john --incremental <hashfile>`  
**Exemple** : `john --incremental hashes.txt`  
- Lance une attaque par force brute sur hashes.txt (tous les caractères possibles).

---

## 3. Spécifier un type de hash
**Fonction** : Indiquer le format du hash à craquer.  
**Commande** : `john --format=<format> --wordlist=<wordlist> <hashfile>`  
**Exemple** : `john --format=md5crypt --wordlist=rockyou.txt hashes.txt`  
- Craque des hashes MD5crypt avec rockyou.txt.

---

## 4. Afficher les mots de passe craqués
**Fonction** : Voir les résultats après une attaque.  
**Commande** : `john --show <hashfile>`  
**Exemple** : `john --show hashes.txt`  
- Affiche les mots de passe trouvés pour hashes.txt.

---

## 5. Attaque avec règles personnalisées
**Fonction** : Appliquer des transformations à une liste de mots.  
**Commande** : `john --wordlist=<wordlist> --rules <hashfile>`  
**Exemple** : `john --wordlist=rockyou.txt --rules hashes.txt`  
- Utilise les règles par défaut pour modifier les mots de rockyou.txt.

---

## 6. Craquer un fichier shadow (Linux)
**Fonction** : Attaquer les hashes d’un fichier shadow.  
**Commande** : `john <shadow_file>`  
**Exemple** : `john /etc/shadow`  
- Craque les hashes dans /etc/shadow (nécessite privilèges root).

---

## 7. Restaurer une session interrompue
**Fonction** : Reprendre une attaque précédente.  
**Commande** : `john --restore`  
**Exemple** : `john --restore`  
- Reprend la dernière session interrompue.

---

## 8. Limiter les caractères (force brute)
**Fonction** : Restreindre les caractères testés.  
**Commande** : `john --incremental=<mode> <hashfile>`  
**Exemple** : `john --incremental=digits hashes.txt`  
- Teste uniquement les chiffres (0-9) pour hashes.txt.

---

## 9. Générer un fichier de mots de passe craqués
**Fonction** : Exporter les mots de passe trouvés.  
**Commande** : `john --show <hashfile> > <outputfile>`  
**Exemple** : `john --show hashes.txt > cracked.txt`  
- Sauvegarde les mots de passe craqués dans cracked.txt.

---

## 10. Tester un seul hash
**Fonction** : Craquer un hash spécifique sans fichier.  
**Commande** : `john --format=<format> --wordlist=<wordlist> <hash>`  
**Exemple** : `john --format=raw-md5 --wordlist=rockyou.txt "5f4dcc3b5aa765d61d8327deb882cf99"`  
- Craque le hash MD5 "password" avec rockyou.txt.

---

## Notes importantes
- **Permissions** : Peut nécessiter `sudo` pour certains fichiers (ex. : `/etc/shadow`).
- **Installation** :  
  ```bash
  sudo apt update && sudo apt install -y john
