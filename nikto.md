# nikto.md

## cheat sheet - nikto

Ce document présente les commandes `nikto` essentielles pour scanner les vulnérabilités des serveurs web, à utiliser dans des environnements autorisés uniquement.

---

## 1. Comprendre Nikto

Nikto est un outil de sécurité qui scanne les serveurs web pour détecter les vulnérabilités, les mauvaises configurations et les fichiers sensibles.

| **Aspect**           | **Description**                                      |
|----------------------|-----------------------------------------------------|
| **Utilisation**      | Audit de sécurité, détection de failles            |
| **Syntaxe de base**  | `nikto -h [hôte] [options]`                        |
| **Sortie par défaut** | Liste des vulnérabilités détectées                |

---

## 2. Commandes de base

| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `nikto -h http://example.com` | Scan basique d’un site web                         |
| `nikto -h 192.168.1.1`      | Scan d’une IP                                      |
| `nikto -h example.com -p 8080` | Scan avec un port spécifique                     |

---

## 3. Options courantes

### Configuration du scan
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `-h`                | `-h http://example.com`            | Hôte ou URL cible                   |
| `-p`                | `-p 80,443`                       | Ports à scanner (séparés par ,)     |
| `-T`                | `-T 13`                            | Active des tests spécifiques (ex. : 1=files, 3=dirs) |
| `-id`               | `-id user:pass`                    | Authentification basique            |

### Sortie et format
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `-o`                | `-o report.html`                   | Sauvegarde dans un fichier (HTML, TXT, etc.) |
| `-F`                | `-F csv`                           | Format de sortie (csv, txt, xml)    |
| `-v`                | `-v`                               | Mode verbeux                        |

### Contrôle
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `-ssl`              | `-ssl`                             | Force l’utilisation de SSL/TLS      |
| `-nossl`            | `-nossl`                          | Désactive SSL/TLS                   |
| `-t`                | `-t 10`                            | Timeout par connexion (secondes)    |
| `-Pause`            | `-Pause 2`                         | Délai entre tests (secondes)        |

---

## 4. Exemples pratiques

### Scan basique
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `nikto -h http://example.com` | Analyse complète d’un site                         |
| `nikto -h https://example.com -ssl` | Scan HTTPS avec SSL                          |

### Scan personnalisé
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `nikto -h example.com -p 80,443 -o report.txt` | Ports multiples + rapport         |
| `nikto -h 192.168.1.1 -T 13` | Scan des fichiers et répertoires uniquement         |

### Authentification
| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `nikto -h example.com -id admin:pass123` | Scan avec login/mot de passe            |

---

## 5. Tests spécifiques (-T)

| **Code**             | **Description**                                      |
|----------------------|-----------------------------------------------------|
| `0`                 | Fichiers intéressants/dangereux                    |
| `1`                 | Mauvaises configurations                           |
| `3`                 | Répertoires sensibles                              |
| `b`                 | Injection XSS/SQL possibles                        |
| `x`                 | Tests de reverse proxy                             |

*Exemple :* `-T 03` teste les fichiers dangereux et les répertoires sensibles.

---

## 6. Précautions

- **Usage légal** : Scans uniquement sur des cibles autorisées.
- **Performance** : Ajuster `-Pause` ou `-t` pour éviter de surcharger le serveur.
- **Compléments** : Utiliser avec `nmap` ou `wfuzz` pour une analyse approfondie.

  
