# curl.md

## cheat sheet - cURL

Ce document présente les commandes cURL essentielles pour effectuer des requêtes HTTP, télécharger des fichiers et tester des API, à utiliser dans des environnements contrôlés.


---

## 1. Comprendre cURL

cURL (Client URL) est un outil pour transférer des données via divers protocoles (HTTP, HTTPS, FTP, etc.) depuis ou vers un serveur.

| **Aspect**           | **Description**                                      |
|----------------------|-----------------------------------------------------|
| **Utilisation**      | Requêtes HTTP, téléchargements, tests API          |
| **Syntaxe de base**  | `curl [options] [URL]`                            |
| **Sortie par défaut** | Contenu brut dans le terminal                     |

---

## 2. Commandes de base

| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `curl http://example.com`    | Récupère le contenu d’une page web                  |
| `curl -o file.html http://example.com` | Sauvegarde la réponse dans un fichier     |
| `curl -O http://example.com/file.zip` | Télécharge avec le nom d’origine          |

---

## 3. Options courantes

### Requêtes HTTP
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `-X`                | `curl -X POST http://api.com`      | Spécifie la méthode HTTP (GET, POST, etc.) |
| `-H`                | `curl -H "Authorization: Bearer token" url` | Ajoute un en-tête HTTP     |
| `-d`                | `curl -d "key=value" -X POST url`  | Envoie des données POST             |
| `-i`                | `curl -i http://example.com`       | Inclut les en-têtes dans la réponse |

### Gestion des fichiers
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `-o`                | `curl -o output.html url`          | Sauvegarde sous un nom spécifique   |
| `-O`                | `curl -O http://site.com/file.zip` | Utilise le nom du fichier distant   |
| `--upload-file`      | `curl --upload-file file.txt url`  | Envoie un fichier au serveur        |

### Autres
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `-v`                | `curl -v http://example.com`       | Mode verbeux (détails de la requête) |
| `-k`                | `curl -k https://insecure.com`     | Ignore les erreurs SSL              |
| `-L`                | `curl -L http://example.com`       | Suit les redirections               |

---

## 4. Exemples pratiques

### Requêtes simples
| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `curl http://api.example.com/data`   | Récupère des données brutes                         |
| `curl -i http://example.com`         | Affiche en-têtes + corps de la réponse              |

### Requêtes API
| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `curl -X POST -H "Content-Type: application/json" -d '{"key":"value"}' http://api.com` | Envoie du JSON |
| `curl -u user:pass http://api.com`   | Authentification basique                    |

### Téléchargements
| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `curl -O http://site.com/image.jpg`  | Télécharge une image                        |
| `curl -C - -O http://site.com/bigfile.zip` | Reprend un téléchargement interrompu  |

---

## 5. Tests avancés

### Simulation d’attaques
| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `curl -d "user=admin' OR 1=1 --" url` | Test d’injection SQL                       |
| `curl -H "Referer: http://evil.com" url` | Test de falsification de Referer         |

### Debugging
| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `curl -v -X GET http://example.com`  | Affiche les détails de la requête/réponse           |
| `curl --trace-ascii log.txt url`     | Enregistre un log détaillé                  |

---

## 6. Précautions

- **Sécurité** : Évitez `-k` en production (ignore SSL).
- **Usage légal** : Tests uniquement sur des serveurs autorisés.
- **Outils complémentaires** : Associez avec `jq` pour traiter JSON.
