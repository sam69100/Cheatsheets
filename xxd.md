
## cheat sheet - xxd

Ce document présente les commandes et options de `xxd` pour manipuler des données hexadécimales, avec des exemples utilisant `echo`.

---

## 1. Comprendre xxd

`xxd` génère des dumps hexadécimaux de fichiers ou d’entrées stdin et peut aussi reconvertir des hex en binaire.

| **Aspect**           | **Description**                                      |
|----------------------|-----------------------------------------------------|
| **Utilisation**      | Analyse de fichiers binaires, conversion hex        |
| **Syntaxe de base**  | `xxd [options] [fichier]` ou `echo "texte" | xxd`   |
| **Sortie par défaut** | Hex + ASCII côte à côte                            |

---

## 2. Options courantes

| **Option**           | **Description**                                      |
|----------------------|-----------------------------------------------------|
| `-b`                | Affiche en binaire au lieu d’hexadécimal            |
| `-c <n>`            | Définit le nombre de colonnes (octets par ligne)    |
| `-l <n>`            | Limite la longueur de la sortie (en octets)         |
| `-r`                | Reconverti hex en binaire (reverse)                 |
| `-p`                | Sortie en hex brut (plain, sans formatage)          |
| `-u`                | Utilise des majuscules pour l’hexadécimal           |
| `-i`                | Génère un format compatible C (tableau hex)         |

---

## 3. Exemples avec `echo` et `xxd`

### Dump hexadécimal simple
| **Commande**                 | **Sortie**                        | **Description**                     |
|------------------------------|-----------------------------------|-------------------------------------|
| `echo "Hello" | xxd`         | `00000000: 4865 6c6c 6f0a       Hello.` | Hex + ASCII de "Hello"            |
| `echo -n "Hello" | xxd`       | `00000000: 4865 6c6c 6f         Hello` | Sans retour à la ligne (-n)       |

### Format personnalisé
| **Commande**                 | **Sortie**                        | **Description**                     |
|------------------------------|-----------------------------------|-------------------------------------|
| `echo "Test" | xxd -b`       | `00000000: 01010100 01100101 ...` | Binaire au lieu d’hex             |
| `echo "ABC" | xxd -c 2`      | `00000000: 4142 0a              AB.` | 2 octets par ligne                |
| `echo "Data" | xxd -p`       | `446174610a`                      | Hex brut sans formatage           |

### Conversion inverse
| **Commande**                 | **Sortie**                        | **Description**                     |
|------------------------------|-----------------------------------|-------------------------------------|
| `echo "48656c6c6f" | xxd -r -p` | `Hello`                          | Hex → texte (sans retour ligne)   |
| `echo "4142" | xxd -r -p`     | `AB`                             | Hex brut → texte                  |

### Analyse avancée
| **Commande**                 | **Sortie**                        | **Description**                     |
|------------------------------|-----------------------------------|-------------------------------------|
| `echo "Secret" | xxd -u`     | `00000000: 5365 6372 6574 0a    SECRET.` | Hex en majuscules              |
| `echo "Code" | xxd -l 3`      | `00000000: 436f 64             Cod` | Limite à 3 octets                 |
| `echo "Array" | xxd -i`       | `unsigned char ... = { 0x41, ... };` | Format C                    |

---

## 4. Utilisations pratiques

| **Cas**                      | **Commande**                        | **Description**                     |
|------------------------------|------------------------------------|-------------------------------------|
| Analyse d’une chaîne         | `echo "Linux" | xxd`              | Voir l’hex d’une chaîne             |
| Créer un fichier binaire     | `echo "deadbeef" | xxd -r -p > file.bin` | Hex → fichier binaire           |
| Vérifier un encodage         | `echo "Test" | xxd -p`            | Hex brut pour analyse               |
| Débogage rapide              | `echo -n "Bug" | xxd -b`           | Binaire pour inspection             |

---

## 5. Précautions

- **Usage légal** : Analyse uniquement sur des données autorisées.
- **Entrée** : Utilisez `-n` avec `echo` pour éviter les retours à la ligne indésirables.
- **Compatibilité** : Disponible par défaut sur la plupart des distributions Linux.
