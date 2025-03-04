# wfuzz.md

## Cheat Sheet - Wfuzz

Ce document présente les commandes `wfuzz` essentielles pour le fuzzing web, la découverte de ressources et le test de sécurité, à utiliser dans des environnements autorisés uniquement.


---

## 1. Comprendre Wfuzz

Wfuzz est un outil de fuzzing pour tester les applications web en remplaçant des parties d’une URL ou de requêtes par des valeurs d’une liste (wordlist).

| **Aspect**           | **Description**                                      |
|----------------------|-----------------------------------------------------|
| **Utilisation**      | Découverte de fichiers, bruteforce, tests de vulnérabilités |
| **Syntaxe de base**  | `wfuzz [options] -u [URL] -w [wordlist]`           |
| **Mot-clé**          | `FUZZ` : Placeholder pour les valeurs à tester     |

---

## 2. Commandes de base

| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `wfuzz -u http://example.com/FUZZ -w wordlist.txt` | Fuzze une URL avec une wordlist         |
| `wfuzz -u http://example.com/ -d "user=FUZZ" -w users.txt` | Bruteforce un paramètre POST      |
| `wfuzz -u http://example.com/FUZZ.php -w list.txt --hc 404` | Ignore les erreurs 404             |

---

## 3. Options courantes

### Configuration de la requête
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `-u`                | `-u http://example.com/FUZZ`       | URL cible avec placeholder FUZZ     |
| `-w`                | `-w /path/to/wordlist.txt`         | Chemin vers la wordlist             |
| `-d`                | `-d "key=FUZZ"`                    | Données POST à fuzzer               |
| `-H`                | `-H "Cookie: session=abc123"`      | Ajoute un en-tête HTTP              |

### Filtrage des réponses
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `--hc`              | `--hc 404`                         | Cache les réponses avec code 404    |
| `--hw`              | `--hw 100`                         | Cache les réponses avec 100 mots    |
| `--hl`              | `--hl 50`                          | Cache les réponses avec 50 lignes   |
| `--sc`              | `--sc 200`                         | Montre uniquement les codes 200     |

### Performance
| **Option**           | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| `-z`                | `-z range,1-100`                   | Génère une liste (ex. : 1 à 100)    |
| `-t`                | `-t 50`                            | Nombre de threads (défaut : 10)     |
| `-s`                | `-s 0.1`                           | Délai entre requêtes (en secondes)  |

---

## 4. Exemples pratiques

### Découverte de répertoires/fichiers
| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `wfuzz -u http://example.com/FUZZ -w dirlist.txt --hc 404` | Cherche des répertoires/fichiers     |
| `wfuzz -u http://example.com/FUZZ.php -w files.txt --sc 200` | Trouve les fichiers PHP existants  |

### Bruteforce de paramètres
| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `wfuzz -u http://example.com/?id=FUZZ -w ids.txt --hc 404` | Teste des ID dans une URL            |
| `wfuzz -u http://example.com/login -d "user=FUZZ&pass=admin" -w users.txt` | Bruteforce un login POST |

### Tests avancés
| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `wfuzz -u http://example.com/FUZZ -w list.txt -H "User-Agent: FuzzTest"` | Ajoute un en-tête personnalisé    |
| `wfuzz -u http://example.com/?q=FUZZ -w payloads.txt --hw 0` | Teste les payloads XSS/SQLi         |

---

## 5. Wordlists utiles

| **Type**             | **Exemple**                        | **Description**                     |
|----------------------|------------------------------------|-------------------------------------|
| Répertoires         | `dirb/common.txt`                  | Liste de répertoires courants       |
| Fichiers            | `dirb/big.txt`                     | Liste de fichiers potentiels        |
| Paramètres          | `raft-medium-words.txt`            | Noms de paramètres ou mots clés     |

---

## 6. Précautions

- **Usage légal** : Tests uniquement sur des cibles autorisées.
- **Performance** : Ajuster `-t` pour éviter de surcharger le serveur.
- **Compléments** : Utiliser avec Burp Suite ou `curl` pour analyser les résultats.

  
