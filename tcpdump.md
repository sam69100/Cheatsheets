# cheat sheet tcpdump

Une référence rapide pour les commandes courantes de **tcpdump**, un outil d’analyse de paquets réseau, avec fonctions, commandes et exemples.

---

## 1. Capturer tout le trafic sur une interface
**Fonction** : Écouter tout le trafic réseau sur une interface spécifique.  
**Commande** : `tcpdump -i <interface>`  
**Exemple** : `tcpdump -i eth0`  
- Capture tous les paquets sur l’interface eth0.

---

## 2. Limiter le nombre de paquets capturés
**Fonction** : Arrêter après un nombre spécifique de paquets.  
**Commande** : `tcpdump -c <count> -i <interface>`  
**Exemple** : `tcpdump -c 100 -i eth0`  
- Capture 100 paquets sur eth0 et s’arrête.

---

## 3. Filtrer par adresse IP source ou destination
**Fonction** : Capturer le trafic d’une IP spécifique.  
**Commande** : `tcpdump host <ip>`  
**Exemple** : `tcpdump host 192.168.1.10`  
- Capture le trafic entrant et sortant de 192.168.1.10.

---

## 4. Filtrer par port spécifique
**Fonction** : Capturer le trafic sur un port donné.  
**Commande** : `tcpdump port <port>`  
**Exemple** : `tcpdump port 80`  
- Capture uniquement le trafic HTTP (port 80).

---

## 5. Filtrer par protocole
**Fonction** : Capturer un type de protocole spécifique (ex. : TCP, UDP).  
**Commande** : `tcpdump <protocol>`  
**Exemple** : `tcpdump tcp`  
- Capture uniquement les paquets TCP.

---

## 6. Sauvegarder la capture dans un fichier
**Fonction** : Enregistrer les paquets pour une analyse ultérieure.  
**Commande** : `tcpdump -w <filename> -i <interface>`  
**Exemple** : `tcpdump -w capture.pcap -i eth0`  
- Sauvegarde la capture dans capture.pcap.

---

## 7. Lire un fichier de capture
**Fonction** : Analyser un fichier .pcap précédemment enregistré.  
**Commande** : `tcpdump -r <filename>`  
**Exemple** : `tcpdump -r capture.pcap`  
- Lit et affiche le contenu de capture.pcap.

---

## 8. Afficher les détails des paquets
**Fonction** : Montrer plus d’informations sur chaque paquet.  
**Commande** : `tcpdump -v -i <interface>`  
**Exemple** : `tcpdump -v -i eth0`  
- Affiche des détails verbeux (ex. : TTL, longueur des paquets).

---

## 9. Filtrer par réseau
**Fonction** : Capturer le trafic d’un sous-réseau spécifique.  
**Commande** : `tcpdump net <network>`  
**Exemple** : `tcpdump net 192.168.1.0/24`  
- Capture le trafic du sous-réseau 192.168.1.0/24.

---

## 10. Capturer uniquement les en-têtes
**Fonction** : Limiter la capture aux en-têtes des paquets.  
**Commande** : `tcpdump -s <size> -i <interface>`  
**Exemple** : `tcpdump -s 64 -i eth0`  
- Capture les 64 premiers octets (en-têtes) des paquets sur eth0.

---

## Notes importantes
- **Permissions** : Nécessite des privilèges root (ex. : `sudo tcpdump`).
- **Installation** :  
  ```bash
  sudo apt update && sudo apt install -y tcpdump
