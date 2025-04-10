# cheat sheet ffuf

Une référence rapide pour les commandes courantes de **Ffuf** (Fuzz Faster U Fool), avec fonctions, commandes et exemples.

---

## 1. Énumération de répertoires
**Fonction** : Scanner un site pour trouver des répertoires cachés.  
**Commande** : `ffuf -u <URL>/FUZZ -w <wordlist>`  
**Exemple** : `ffuf -u http://example.com/FUZZ -w /usr/share/wordlists/dirb/common.txt`  
- Scanne http://example.com avec la liste common.txt pour trouver des répertoires.

---

## 2. Énumération de fichiers avec extensions
**Fonction** : Rechercher des fichiers avec des extensions spécifiques.  
**Commande** : `ffuf -u <URL>/FUZZ -w <wordlist> -e <extensions>`  
**Exemple** : `ffuf -u http://192.168.1.10/FUZZ -w /usr/share/wordlists/dirb/common.txt -e .php,.txt,.html`  
- Cherche des fichiers .php, .txt et .html sur l’hôte spécifié.

---

## 3. Scan avec threads personnalisés
**Fonction** : Ajuster la vitesse avec plusieurs threads.  
**Commande** : `ffuf -u <URL>/FUZZ -w <wordlist> -t <nombre>`  
**Exemple** : `ffuf -u http://example.com/FUZZ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 50`  
- Utilise 50 threads pour accélérer le scan.

---

## 4. Filtrer par code HTTP
**Fonction** : Exclure ou inclure des résultats selon les codes HTTP.  
**Commande** : `ffuf -u <URL>/FUZZ -w <wordlist> -fc <codes>`  
**Exemple** : `ffuf -u http://example.com/FUZZ -w /usr/share/wordlists/dirb/common.txt -fc 404`  
- Filtre les réponses avec le code 404 (exclut les "non trouvés").

---

## 5. Énumération de sous-domaines
**Fonction** : Trouver des sous-domaines valides.  
**Commande** : `ffuf -u http://FUZZ.example.com -w <wordlist> -H "Host: FUZZ.example.com"`  
**Exemple** : `ffuf -u http://FUZZ.example.com -w /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-5000.txt -H "Host: FUZZ.example.com"`  
- Cherche des sous-domaines pour example.com.

---

## 6. Ajout d’en-têtes personnalisés
**Fonction** : Inclure des en-têtes HTTP (ex. : cookies, tokens).  
**Commande** : `ffuf -u <URL>/FUZZ -w <wordlist> -H "<header>"`  
**Exemple** : `ffuf -u http://example.com/FUZZ -w /usr/share/wordlists/dirb/common.txt -H "Cookie: session=abc123"`  
- Ajoute un cookie personnalisé au scan.

---

## 7. Sauvegarde des résultats
**Fonction** : Enregistrer les résultats dans un fichier.  
**Commande** : `ffuf -u <URL>/FUZZ -w <wordlist> -o <fichier>`  
**Exemple** : `ffuf -u http://example.com/FUZZ -w /usr/share/wordlists/dirb/common.txt -o results.json`  
- Sauvegarde les résultats au format JSON dans results.json.

---

## 8. Ignorer les certificats SSL non valides
**Fonction** : Scanner un site HTTPS avec un certificat invalide.  
**Commande** : `ffuf -u <URL>/FUZZ -w <wordlist> -k`  
**Exemple** : `ffuf -u https://example.com/FUZZ -w /usr/share/wordlists/dirb/common.txt -k`  
- Ignore les erreurs de certificat SSL.

---

## 9. Filtrer par taille de réponse
**Fonction** : Exclure les résultats selon la taille de la réponse.  
**Commande** : `ffuf -u <URL>/FUZZ -w <wordlist> -fs <taille>`  
**Exemple** : `ffuf -u http://example.com/FUZZ -w /usr/share/wordlists/dirb/common.txt -fs 0`  
- Exclut les réponses de taille 0 (souvent erreurs ou pages vides).

---

## 10. Énumération de paramètres (GET/POST)
**Fonction** : Trouver des paramètres valides dans une URL ou une requête.  
**Commande** : `ffuf -u <URL>?FUZZ=test -w <wordlist> -mr "<regex>"`  
**Exemple** : `ffuf -u http://example.com/index.php?FUZZ=test -w /usr/share/wordlists/seclists/Discovery/Web-Content/burp-parameter-names.txt -mr "success"`  
- Cherche des paramètres GET avec une réponse contenant "success".

---

## Notes importantes
- **Permissions** : Assurez-vous d’avoir l’autorisation de scanner les cibles.
- **Wordlists** : Utilisez des listes comme celles de SecLists ou Dirb.
- **Dépendances** : Ffuf doit être installé (ex. : `go install github.com/ffuf/ffuf@latest`).

---
