# cheat sheet wireshark

Une référence rapide pour les fonctionnalités courantes de **Wireshark**, un outil d’analyse de paquets réseau avec interface graphique, avec fonctions, filtres et exemples. Inclut quelques commandes CLI.

---

## 1. Filtrer par adresse IP
**Fonction** : Afficher le trafic d’une IP spécifique.  
**Commande** : `ip.addr == <ip>`  
**Exemple** : `ip.addr == 192.168.1.10`  
- Montre le trafic entrant et sortant de 192.168.1.10 dans l’interface Wireshark.

---

## 2. Filtrer par port
**Fonction** : Afficher le trafic sur un port spécifique.  
**Commande** : `tcp.port == <port>`  
**Exemple** : `tcp.port == 80`  
- Affiche uniquement le trafic HTTP (port 80).

---

## 3. Filtrer par protocole
**Fonction** : Afficher uniquement un protocole spécifique.  
**Commande** : `<protocol>`  
**Exemple** : `http`  
- Montre uniquement les paquets HTTP dans la capture.

---

## 4. Capturer le trafic sur une interface (CLI)
**Fonction** : Lancer Wireshark avec capture sur une interface.  
**Commande** : `wireshark -i <interface>`  
**Exemple** : `wireshark -i eth0`  
- Démarre Wireshark et capture sur eth0.

---

## 5. Sauvegarder une capture
**Fonction** : Enregistrer les paquets capturés dans un fichier.  
**Commande** : `File > Save As > <filename>.pcap`  
**Exemple** : `File > Save As > capture.pcap`  
- Sauvegarde la capture dans capture.pcap via l’interface graphique.

---

## 6. Lire un fichier de capture
**Fonction** : Ouvrir un fichier .pcap existant.  
**Commande** : `File > Open > <filename>.pcap`  
**Exemple** : `File > Open > capture.pcap`  
- Charge capture.pcap dans Wireshark pour analyse.

---

## 7. Suivre une conversation TCP
**Fonction** : Suivre un flux TCP spécifique.  
**Commande** : `Right-click paquet > Follow > TCP Stream`  
**Exemple** : `Right-click paquet > Follow > TCP Stream`  
- Affiche le contenu d’une conversation TCP (ex. : requête/réponse HTTP).

---

## 8. Filtrer par plage d’IP
**Fonction** : Afficher le trafic d’un sous-réseau.  
**Commande** : `ip.addr >= <start_ip> && ip.addr <= <end_ip>`  
**Exemple** : `ip.addr >= 192.168.1.0 && ip.addr <= 192.168.1.255`  
- Montre le trafic du sous-réseau 192.168.1.0/24.

---

## 9. Statistiques sur le trafic
**Fonction** : Générer des statistiques (ex. : conversations).  
**Commande** : `Statistics > Conversations`  
**Exemple** : `Statistics > Conversations`  
- Affiche les conversations IP, TCP, UDP avec volumes de données.

---

## 10. Exporter des objets HTTP
**Fonction** : Extraire des fichiers transférés via HTTP.  
**Commande** : `File > Export Objects > HTTP`  
**Exemple** : `File > Export Objects > HTTP`  
- Extrait les fichiers (ex. : images, documents) d’une capture HTTP.

---

## Notes importantes
- **Permissions** : Nécessite des privilèges root pour capturer (ex. : `sudo wireshark`).
- **Installation** :  
  ```bash
  sudo apt update && sudo apt install -y wireshark
