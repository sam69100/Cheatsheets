# nslookup.md

## Cheat Sheet - nslookup

Ce document présente les commandes `nslookup` essentielles pour effectuer des recherches DNS et diagnostiquer des noms de domaine.


---

## 1. Comprendre nslookup

`nslookup` (Name Server Lookup) est un outil pour interroger les serveurs DNS et obtenir des enregistrements (A, MX, NS, etc.) sur un domaine.

| **Aspect**           | **Description**                                      |
|----------------------|-----------------------------------------------------|
| **Utilisation**      | Recherche DNS, résolution, dépannage réseau        |
| **Syntaxe de base**  | `nslookup [options] [nom_de_domaine] [serveur]`    |
| **Modes**            | Interactif ou non interactif                       |

---

## 2. Commandes de base

| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `nslookup example.com`       | Résout l’adresse IP d’un domaine                    |
| `nslookup -type=mx example.com` | Récupère les serveurs de messagerie (MX)         |
| `nslookup 8.8.8.8`          | Résolution inverse (IP vers domaine)                |

---

## 3. Options courantes (non interactif)

### Types d’enregistrements
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `-type=A`           | `nslookup -type=A example.com`     | Récupère l’adresse IPv4             |
| `-type=AAAA`        | `nslookup -type=AAAA example.com`  | Récupère l’adresse IPv6             |
| `-type=MX`          | `nslookup -type=MX example.com`    | Liste les serveurs de mail          |
| `-type=NS`          | `nslookup -type=NS example.com`    | Liste les serveurs de noms         |
| `-type=SOA`         | `nslookup -type=SOA example.com`   | Enregistrement SOA (autorité)       |

### Configuration
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `[serveur]`         | `nslookup example.com 8.8.8.8`     | Utilise un serveur DNS spécifique   |
| `-debug`            | `nslookup -debug example.com`      | Affiche les détails de la requête   |
| `-port=`            | `nslookup -port=5353 example.com`  | Spécifie un port DNS personnalisé  |

---

## 4. Mode interactif

### Commandes internes
| **Commande**         | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `nslookup`           | Lance le mode interactif           |                                     |
| `server 8.8.8.8`    | `server 8.8.8.8`                  | Change le serveur DNS               |
| `set type=A`         | `set type=A`                       | Définit le type d’enregistrement    |
| `example.com`        | `example.com`                      | Interroge le domaine spécifié       |
| `exit`               | `exit`                             | Quitte le mode interactif           |

---

## 5. Exemples pratiques

### Recherche DNS
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `nslookup google.com`        | Résout l’IP de google.com                           |
| `nslookup -type=MX gmail.com` | Liste les serveurs mail de Gmail                   |
| `nslookup -type=NS example.com` | Liste les serveurs de noms                       |

### Diagnostic
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `nslookup 1.2.3.4`          | Résolution inverse d’une IP                         |
| `nslookup -debug example.com` | Affiche les détails de résolution                  |

### Avec serveur spécifique
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `nslookup example.com 1.1.1.1` | Utilise le DNS de Cloudflare                    |
| `nslookup -type=TXT example.com 8.8.8.8` | Récupère TXT via Google DNS           |

---

## 6. Mode interactif - Exemple

nslookup
server 8.8.8.8
set type=MX
gmail.com
(Affiche les enregistrements MX de gmail.com)
exit


---

## 7. Précautions

- **Usage légal** : Ne pas abuser des requêtes sur des domaines non autorisés.
- **Limites** : Peut varier selon l’OS (Windows vs Linux).
- **Compléments** : Utiliser avec `dig` ou `host` pour plus de précision.

