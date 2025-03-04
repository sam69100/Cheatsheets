# cheat sheet hashcat

Une référence rapide pour les commandes courantes de **Hashcat**, avec fonctions, commandes et exemples.

---

## 1. Attaque par dictionnaire
**Fonction** : Craquer un hash avec une liste de mots.  
**Commande** : `hashcat -m <type> -a 0 <hashfile> <wordlist>`  
**Exemple** : `hashcat -m 0 -a 0 hashes.txt /usr/share/wordlists/rockyou.txt`  
- Tente de craquer des hashes MD5 (-m 0) avec rockyou.txt.

---

## 2. Attaque par force brute
**Fonction** : Tester toutes les combinaisons possibles.  
**Commande** : `hashcat -m <type> -a 3 <hashfile> <mask>`  
**Exemple** : `hashcat -m 0 -a 3 hashes.txt ?a?a?a?a?a`  
- Teste toutes les combinaisons de 5 caractères (lettres, chiffres, symboles) pour MD5.

---

## 3. Attaque par règles
**Fonction** : Appliquer des règles à une liste de mots.  
**Commande** : `hashcat -m <type> -a 0 <hashfile> <wordlist> -r <rulefile>`  
**Exemple** : `hashcat -m 0 -a 0 hashes.txt /usr/share/wordlists/rockyou.txt -r rules/dive.rule`  
- Utilise le fichier de règles dive.rule pour modifier les mots de rockyou.txt.

---

## 4. Identifier le type de hash
**Fonction** : Déterminer le format d’un hash inconnu.  
**Commande** : `hashcat --identify <hashfile>`  
**Exemple** : `hashcat --identify hashes.txt`  
- Affiche les types de hashes détectés dans hashes.txt (ex. : MD5, SHA1).

---

## 5. Attaque combinée
**Fonction** : Combiner deux listes de mots.  
**Commande** : `hashcat -m <type> -a 1 <hashfile> <wordlist1> <wordlist2>`  
**Exemple** : `hashcat -m 0 -a 1 hashes.txt words1.txt words2.txt`  
- Combine chaque mot de words1.txt avec words2.txt pour craquer des MD5.

---

## 6. Utiliser un masque personnalisé
**Fonction** : Définir un motif spécifique pour le brute force.  
**Commande** : `hashcat -m <type> -a 3 <hashfile> -1 <charset> <mask>`  
**Exemple** : `hashcat -m 0 -a 3 hashes.txt -1 ?l?d ?1?1?1?1`  
- Teste un masque de 4 caractères (minuscules et chiffres) pour MD5.

---

## 7. Sauvegarde des résultats
**Fonction** : Enregistrer les mots de passe trouvés.  
**Commande** : `hashcat -m <type> -a 0 <hashfile> <wordlist> -o <outputfile>`  
**Exemple** : `hashcat -m 0 -a 0 hashes.txt /usr/share/wordlists/rockyou.txt -o cracked.txt`  
- Sauvegarde les mots de passe craqués dans cracked.txt.

---

## 8. Restaurer une session
**Fonction** : Reprendre une session interrompue.  
**Commande** : `hashcat --restore --session <session_name>`  
**Exemple** : `hashcat --restore --session mysession`  
- Reprend la session nommée "mysession".

---

## 9. Optimisation GPU
**Fonction** : Ajuster la charge pour utiliser le GPU efficacement.  
**Commande** : `hashcat -m <type> -a 0 <hashfile> <wordlist> -w <workload>`  
**Exemple** : `hashcat -m 0 -a 0 hashes.txt /usr/share/wordlists/rockyou.txt -w 3`  
- Utilise un workload élevé (-w 3) pour maximiser l’utilisation du GPU.

---

## 10. Afficher les hashes craqués
**Fonction** : Voir les mots de passe déjà trouvés.  
**Commande** : `hashcat -m <type> <hashfile> --show`  
**Exemple** : `hashcat -m 0 hashes.txt --show`  
- Affiche les hashes MD5 craqués avec leurs mots de passe en clair.

---

## Notes importantes
- **Permissions** : Assurez-vous d’avoir l’autorisation de craquer les hashes.
- **Types de hash** : Consultez `hashcat --help` pour la liste des `-m` (ex. : 0 = MD5, 100 = SHA1).
- **Dépendances** : Hashcat nécessite une installation avec support GPU si souhaité (ex. : CUDA/OpenCL).

---

