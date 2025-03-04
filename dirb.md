# cheat sheet dirb

Une référence rapide pour les commandes courantes de **Dirb**, avec fonctions, commandes et exemples.

---

## 1. Énumération de répertoires
**Fonction** : Scanner un site pour trouver des répertoires cachés.  
**Commande** : `dirb <URL> <wordlist>`  
**Exemple** : `dirb http://example.com /usr/share/wordlists/dirb/common.txt`  
- Scanne http://example.com avec la liste de mots common.txt pour trouver des répertoires.

---

## 2. Énumération avec extensions
**Fonction** : Rechercher des fichiers avec des extensions spécifiques.  
**Commande** : `dirb <URL> <wordlist> -X <extensions>`  
**Exemple** : `dirb http://192.168.1.10 /usr/share/wordlists/dirb/common.txt -X .php,.txt,.html`  
- Cherche des fichiers .php, .txt et .html sur l’hôte spécifié.

---

## 3. Scan récursif
**Fonction** : Explorer les répertoires trouvés de manière récursive.  
**Commande** : `dirb <URL> <wordlist> -r`  
**Exemple** : `dirb http://example.com /usr/share/wordlists/dirb/common.txt -r`  
- Scanne récursivement les répertoires découverts.

---

## 4. Ignorer certains codes HTTP
**Fonction** : Exclure les réponses avec des codes HTTP spécifiques (ex. : 404).  
**Commande** : `dirb <URL> <wordlist> -N <code>`  
**Exemple** : `dirb http://example.com /usr/share/wordlists/dirb/common.txt -N 404`  
- Ignore les réponses avec le code 404.

---

## 5. Utilisation d’un proxy
**Fonction** : Scanner via un proxy (ex. : pour anonymisation).  
**Commande** : `dirb <URL> <wordlist> -p <proxy>`  
**Exemple** : `dirb http://example.com /usr/share/wordlists/dirb/common.txt -p http://127.0.0.1:8080`  
- Utilise un proxy local sur le port 8080.

---

## 6. Ajout d’en-têtes personnalisés
**Fonction** : Inclure des en-têtes HTTP (ex. : cookies).  
**Commande** : `dirb <URL> <wordlist> -H "<header>"`  
**Exemple** : `dirb http://example.com /usr/share/wordlists/dirb/common.txt -H "Cookie: session=abc123"`  
- Ajoute un cookie personnalisé au scan.

---

## 7. Scan silencieux
**Fonction** : Réduire les sorties pour un scan discret.  
**Commande** : `dirb <URL> <wordlist> -S`  
**Exemple** : `dirb http://192.168.1.10 /usr/share/wordlists/dirb/common.txt -S`  
- N’affiche que les résultats pertinents, sans bruit supplémentaire.

---

## 8. Sauvegarde des résultats
**Fonction** : Enregistrer les résultats dans un fichier.  
**Commande** : `dirb <URL> <wordlist> -o <fichier>`  
**Exemple** : `dirb http://example.com /usr/share/wordlists/dirb/common.txt -o results.txt`  
- Sauvegarde les résultats dans results.txt.

---

## 9. Ignorer les certificats SSL non valides
**Fonction** : Scanner un site HTTPS avec un certificat invalide.  
**Commande** : `dirb <URL> <wordlist> -Z`  
**Exemple** : `dirb https://example.com /usr/share/wordlists/dirb/common.txt -Z`  
- Ignore les erreurs de certificat SSL.

---

## 10. Définition d’un User-Agent
**Fonction** : Simuler un navigateur ou personnaliser l’User-Agent.  
**Commande** : `dirb <URL> <wordlist> -a "<user-agent>"`  
**Exemple** : `dirb http://example.com /usr/share/wordlists/dirb/common.txt -a "Mozilla/5.0"`  
- Utilise un User-Agent personnalisé pour le scan.

---

## Notes importantes
- **Permissions** : Assurez-vous d’avoir l’autorisation de scanner les cibles.
- **Wordlists** : Utilisez des listes comme celles incluses avec Dirb ou SecLists.
- **Dépendances** : Dirb doit être installé (ex. : `sudo apt install dirb`).

---

