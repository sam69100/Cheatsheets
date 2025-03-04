# cheat sheet gobuster

Une référence rapide pour les commandes courantes de **Gobuster**, avec fonctions, commandes et exemples.

---

## 1. Énumération de répertoires
**Fonction** : Scanner un site pour trouver des répertoires cachés.  
**Commande** : `gobuster dir -u <URL> -w <wordlist>`  
**Exemple** : `gobuster dir -u http://example.com -w /usr/share/wordlists/dirb/common.txt`  
- Scanne http://example.com avec la liste de mots common.txt pour trouver des répertoires.

---

## 2. Énumération de fichiers
**Fonction** : Rechercher des fichiers spécifiques (ex. : .php, .txt).  
**Commande** : `gobuster dir -u <URL> -w <wordlist> -x <extensions>`  
**Exemple** : `gobuster dir -u http://192.168.1.10 -w /usr/share/wordlists/dirb/common.txt -x php,txt,html`  
- Cherche des fichiers .php, .txt et .html sur l’hôte spécifié.

---

## 3. Scan avec threads personnalisés
**Fonction** : Ajuster la vitesse en utilisant plusieurs threads.  
**Commande** : `gobuster dir -u <URL> -w <wordlist> -t <nombre>`  
**Exemple** : `gobuster dir -u http://example.com -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 50`  
- Utilise 50 threads pour accélérer le scan.

---

## 4. Ajout d’un code de statut spécifique
**Fonction** : Filtrer les résultats par codes HTTP (ex. : ignorer 404).  
**Commande** : `gobuster dir -u <URL> -w <wordlist> -b <codes>`  
**Exemple** : `gobuster dir -u http://example.com -w /usr/share/wordlists/dirb/common.txt -b 404`  
- Ignore les réponses avec le code 404.

---

## 5. Scan avec authentification
**Fonction** : Scanner un site protégé par une authentification basique.  
**Commande** : `gobuster dir -u <URL> -w <wordlist> -U <username> -P <password>`  
**Exemple** : `gobuster dir -u http://example.com/admin -w /usr/share/wordlists/dirb/common.txt -U admin -P password123`  
- Se connecte avec les identifiants admin/password123 pour scanner.

---

## 6. Énumération DNS (sous-domaines)
**Fonction** : Trouver des sous-domaines valides.  
**Commande** : `gobuster dns -d <domaine> -w <wordlist>`  
**Exemple** : `gobuster dns -d example.com -w /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-5000.txt`  
- Cherche des sous-domaines pour example.com.

---

## 7. Mode verbeux
**Fonction** : Afficher plus de détails pendant le scan.  
**Commande** : `gobuster dir -u <URL> -w <wordlist> -v`  
**Exemple** : `gobuster dir -u http://192.168.1.10 -w /usr/share/wordlists/dirb/common.txt -v`  
- Affiche des informations supplémentaires comme les codes de statut.

---

## 8. Sauvegarde des résultats
**Fonction** : Enregistrer les résultats dans un fichier.  
**Commande** : `gobuster dir -u <URL> -w <wordlist> -o <fichier>`  
**Exemple** : `gobuster dir -u http://example.com -w /usr/share/wordlists/dirb/common.txt -o results.txt`  
- Sauvegarde les résultats dans results.txt.

---

## 9. Ignorer les certificats SSL non valides
**Fonction** : Scanner un site HTTPS avec un certificat invalide.  
**Commande** : `gobuster dir -u <URL> -w <wordlist> -k`  
**Exemple** : `gobuster dir -u https://example.com -w /usr/share/wordlists/dirb/common.txt -k`  
- Ignore les erreurs de certificat SSL.

---

## 10. Ajout d’en-têtes personnalisés
**Fonction** : Inclure des en-têtes HTTP (ex. : cookies, tokens).  
**Commande** : `gobuster dir -u <URL> -w <wordlist> -H "<header>"`  
**Exemple** : `gobuster dir -u http://example.com -w /usr/share/wordlists/dirb/common.txt -H "Cookie: session=abc123"`  
- Ajoute un cookie personnalisé au scan.

---

## Notes importantes
- **Permissions** : Assurez-vous d’avoir l’autorisation de scanner les cibles.
- **Wordlists** : Utilisez des listes comme celles de SecLists ou Dirb pour de meilleurs résultats.
- **Dépendances** : Gobuster doit être installé (ex. : `sudo apt install gobuster`).

---

