# cheat sheet nmap

Une référence rapide pour les commandes courantes de **Nmap** (Network Mapper), avec fonctions, commandes et exemples.

---

## 1. Scan de base
**Fonction** : Scanner une cible pour vérifier les ports ouverts.  
**Commande** : `nmap <cible>`  
**Exemple** : `nmap 192.168.1.1`  
- Scanne les 1000 ports les plus courants sur l’hôte 192.168.1.1.

---

## 2. Scan rapide
**Fonction** : Scanner rapidement sans vérification approfondie.  
**Commande** : `nmap -F <cible>`  
**Exemple** : `nmap -F scanme.nmap.org`  
- Scanne uniquement les 100 ports les plus populaires sur la cible.

---

## 3. Scan de ports spécifiques
**Fonction** : Vérifier des ports spécifiques.  
**Commande** : `nmap -p <ports> <cible>`  
**Exemple** : `nmap -p 22,80,443 192.168.1.10`  
- Scanne les ports 22 (SSH), 80 (HTTP) et 443 (HTTPS) sur la cible.

---

## 4. Scan de plage de ports
**Fonction** : Scanner une plage de ports.  
**Commande** : `nmap -p <début-fin> <cible>`  
**Exemple** : `nmap -p 1-1000 192.168.1.1`  
- Scanne les ports de 1 à 1000 sur l’hôte.

---

## 5. Détection de système d’exploitation
**Fonction** : Identifier l’OS et sa version.  
**Commande** : `nmap -O <cible>`  
**Exemple** : `nmap -O 192.168.1.254`  
- Affiche les ports ouverts et tente de deviner l’OS (ex. : Linux, Windows).

---

## 6. Détection de services et versions
**Fonction** : Identifier les services et leurs versions sur les ports ouverts.  
**Commande** : `nmap -sV <cible>`  
**Exemple** : `nmap -sV 10.0.0.1`  
- Retourne par ex. "Apache 2.4.41" sur le port 80.

---

## 7. Scan furtif (SYN)
**Fonction** : Scanner discrètement sans établir de connexion complète.  
**Commande** : `nmap -sS <cible>`  
**Exemple** : `nmap -sS 192.168.1.1`  
- Utilise un scan SYN, souvent indétectable par les journaux basiques.

---

## 8. Scan d’un réseau entier
**Fonction** : Scanner une plage d’adresses IP.  
**Commande** : `nmap <plage_IP>`  
**Exemple** : `nmap 192.168.1.0/24`  
- Scanne toutes les adresses de 192.168.1.0 à 192.168.1.255.

---

## 9. Scan avec découverte d’hôtes
**Fonction** : Vérifier quels hôtes sont actifs avant de scanner.  
**Commande** : `nmap -sn <plage_IP>`  
**Exemple** : `nmap -sn 192.168.1.0/24`  
- Effectue un ping scan pour lister les hôtes actifs sans scanner les ports.

---

## 10. Scan agressif
**Fonction** : Combiner détection OS, versions, et scan rapide.  
**Commande** : `nmap -A <cible>`  
**Exemple** : `nmap -A scanme.nmap.org`  
- Scan détaillé avec OS, versions, et scripts par défaut.

---

## 11. Sauvegarde des résultats
**Fonction** : Enregistrer les résultats dans un fichier.  
**Commande** : `nmap -oN <fichier> <cible>`  
**Exemple** : `nmap -oN resultats.txt 192.168.1.1`  
- Sauvegarde les résultats dans "resultats.txt".

---

## 12. Scan avec timing personnalisé
**Fonction** : Ajuster la vitesse du scan (T0 à T5, T5 étant le plus rapide).  
**Commande** : `nmap -T<0-5> <cible>`  
**Exemple** : `nmap -T4 192.168.1.1`  
- Scan rapide et agressif avec timing T4.

---

## 13. Scan UDP
**Fonction** : Scanner les ports UDP (plus lent que TCP).  
**Commande** : `nmap -sU <cible>`  
**Exemple** : `nmap -sU 192.168.1.10`  
- Vérifie les ports UDP ouverts (ex. : 53 pour DNS).

---

## 14. Scripts NSE (Nmap Scripting Engine)
**Fonction** : Utiliser des scripts pour des tâches avancées (ex. : vulnérabilités).  
**Commande** : `nmap --script <script> <cible>`  
**Exemple** : `nmap --script vuln 192.168.1.1`  
- Exécute des scripts de détection de vulnérabilités.

---

## 15. Scan avec résolution DNS désactivée
**Fonction** : Accélérer le scan en évitant les requêtes DNS.  
**Commande** : `nmap -n <cible>`  
**Exemple** : `nmap -n 192.168.1.0/24`  
- Scanne sans résoudre les noms d’hôtes.

---

## Notes importantes
- **Permissions** : Assurez-vous d’avoir l’autorisation de scanner les cibles (surtout hors de votre réseau privé).
- **Documentation** : Consultez `man nmap` ou `nmap --help` pour plus d’options.
- **Exemple public** : Utilisez `scanme.nmap.org` pour tester légalement.

---

*Cheat sheet créée le 04 mars 2025 par Grok (xAI).*
