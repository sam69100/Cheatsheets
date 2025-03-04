# host.md

## Cheat Sheet - host

Ce document présente les commandes `host` essentielles pour effectuer des recherches DNS et obtenir des informations sur les noms de domaine.


---

## 1. Comprendre host

`host` est un utilitaire pour interroger les serveurs DNS et récupérer des enregistrements (A, MX, NS, etc.) associés à un domaine.

| **Aspect**           | **Description**                                      |
|----------------------|-----------------------------------------------------|
| **Utilisation**      | Recherche DNS, résolution de noms, diagnostic      |
| **Syntaxe de base**  | `host [options] [nom_de_domaine] [serveur]`        |
| **Sortie par défaut** | Adresses IP ou enregistrements DNS                |

---

## 2. Commandes de base

| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `host example.com`           | Résout l’adresse IP d’un domaine                    |
| `host -t mx example.com`     | Récupère les serveurs de messagerie (MX)            |
| `host 8.8.8.8`              | Résolution inverse (IP vers domaine)                |

---

## 3. Options courantes

### Types d’enregistrements
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `-t A`              | `host -t A example.com`            | Récupère l’adresse IPv4             |
| `-t AAAA`           | `host -t AAAA example.com`         | Récupère l’adresse IPv6             |
| `-t MX`             | `host -t MX example.com`           | Liste les serveurs de mail          |
| `-t NS`             | `host -t NS example.com`           | Liste les serveurs de noms         |
| `-t SOA`            | `host -t SOA example.com`          | Enregistrement SOA (autorité)       |

### Configuration
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `-a`                | `host -a example.com`              | Affiche tous les enregistrements    |
| `-v`                | `host -v -t A example.com`         | Mode verbeux                        |
| `[serveur]`         | `host example.com 8.8.8.8`         | Utilise un serveur DNS spécifique   |

### Autres
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `-r`                | `host -r example.com`              | Désactive la récursion              |
| `-4`                | `host -4 example.com`              | Force IPv4 uniquement               |
| `-6`                | `host -6 example.com`              | Force IPv6 uniquement               |

---

## 4. Exemples pratiques

### Recherche DNS
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `host google.com`            | Résout l’IP de google.com                           |
| `host -t MX gmail.com`       | Liste les serveurs mail de Gmail                    |
| `host -a example.com`        | Affiche tous les enregistrements DNS                |

### Diagnostic
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `host 1.2.3.4`              | Résolution inverse d’une IP                         |
| `host -v example.com 8.8.8.8` | Détails avec serveur DNS Google                   |

### Tests spécifiques
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `host -t TXT example.com`    | Récupère les enregistrements TXT (ex. SPF)          |
| `host -t CNAME sub.example.com` | Résout un alias CNAME                            |

---

## 5. Utilisations avancées

### Vérification de configuration
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `host -t NS example.com`     | Vérifie les serveurs de noms actifs                 |
| `host -t SOA example.com`    | Vérifie l’autorité du domaine                       |

### Debugging
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `host -v -t A example.com`   | Affiche les détails de résolution                   |
| `host example.com 1.1.1.1`   | Teste avec un serveur DNS alternatif (Cloudflare)   |

---

## 6. Précautions

- **Usage légal** : Ne pas abuser des requêtes sur des domaines non autorisés.
- **Limites** : Dépend des réponses du serveur DNS interrogé.
- **Compléments** : Utiliser avec `dig` ou `nslookup` pour plus de détails.
