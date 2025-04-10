# cwe-categories.md

## Cheat Sheet - Principales catégories CWE

Ce document détaille les principales catégories CWE avec 10 moyens de sécurisation chacune, pour des audits et développements sécurisés.



---

## 1. Injection (ex. : CWE-89, CWE-79, CWE-77)

**Description** : Données non fiables interprétées comme du code ou des commandes.

| **Moyen de sécurisation**          | **Explication**                                      |
|-----------------------------------|-----------------------------------------------------|
| Requêtes paramétrées              | Éviter l’injection directe                         |
| Échappement des caractères        | Neutraliser les caractères spéciaux                |
| Validation/Sanitisation           | Filtrer les données utilisateur                    |
| ORM sécurisées                    | Réduire les risques                                |
| Liste blanche                     | Accepter uniquement les entrées prévues            |
| WAF                               | Bloquer les attaques courantes                     |
| Privilèges limités                | Réduire l’impact                                   |
| Frameworks sécurisés              | Protection intégrée                                |
| Encodage des sorties              | Prévenir l’exécution hors contexte                 |
| Tests (SQLMap, Burp)              | Détecter les vulnérabilités                        |

---

## 2. Gestion de la mémoire (ex. : CWE-120, CWE-787, CWE-416)

**Description** : Manipulation incorrecte des tampons ou de la mémoire.

| **Moyen de sécurisation**          | **Explication**                                      |
|-----------------------------------|-----------------------------------------------------|
| Langages sécurisés                | Réduire les erreurs (Java, Python)                 |
| Vérification des limites          | Contrôler les accès mémoire                        |
| Fonctions sécurisées              | Utiliser `strncpy` au lieu de `strcpy`             |
| ASLR                              | Rendre les adresses imprévisibles                  |
| Drapeaux de compilation           | Activer `-fstack-protect`                          |
| Validation des tailles            | Limiter les entrées                                |
| Analyse statique                  | Détecter les failles (Coverity)                    |
| Éviter fonctions dangereuses      | Remplacer `gets`, `sprintf`                        |
| Mise à jour des dépendances       | Corriger les failles connues                       |
| Tests de fuzzing                  | Identifier les débordements                        |

---

## 3. Authentification et sessions (ex. : CWE-287, CWE-384)

**Description** : Vérification ou gestion des sessions défaillante.

| **Moyen de sécurisation**          | **Explication**                                      |
|-----------------------------------|-----------------------------------------------------|
| MFA                               | Ajouter une couche de sécurité                     |
| Hachage des mots de passe         | Protéger avec bcrypt                               |
| Régénération des sessions         | Prévenir le vol                                    |
| Jetons CSRF                       | Sécuriser les formulaires                          |
| SSL/TLS                           | Garantir une connexion sécurisée                   |
| Limitation des tentatives         | Bloquer le bruteforce                              |
| Expiration des sessions           | Réduire les fenêtres d’attaque                     |
| Cookies sécurisés                 | Utiliser `HttpOnly`, `Secure`                      |
| Standards (OAuth2, OpenID)        | Simplifier l’authentification                      |
| Audit des logs                    | Détecter les anomalies                             |

---

## 4. Mauvaise configuration (ex. : CWE-16, CWE-552)

**Description** : Exposition due à des paramètres mal définis.

| **Moyen de sécurisation**          | **Explication**                                      |
|-----------------------------------|-----------------------------------------------------|
| Désactivation des inutiles        | Réduire la surface d’attaque                       |
| Changement des mots de passe      | Éviter les défauts                                 |
| Restriction des permissions       | Limiter l’accès                                    |
| Masquer les erreurs               | Ne pas exposer d’infos                             |
| Mises à jour                      | Corriger les failles                               |
| Durcissement                      | Appliquer CIS Benchmarks                           |
| En-têtes HTTP                     | Protéger contre clickjacking                       |
| TLS                               | Sécuriser les communications                       |
| Audits automatisés                | Vérifier avec OpenSCAP                             |
| Documentation                     | Assurer la conformité                              |

---

## 5. Gestion des permissions (ex. : CWE-732, CWE-639)

**Description** : Mauvais contrôle des privilèges ou accès.

| **Moyen de sécurisation**          | **Explication**                                      |
|-----------------------------------|-----------------------------------------------------|
| Moindre privilège                 | Donner le minimum nécessaire                       |
| Vérification serveur              | Valider chaque action                              |
| RBAC                              | Structurer les accès                               |
| Chiffrement                       | Protéger les données                               |
| Audit des permissions             | Maintenir un contrôle                              |
| Prévention IDOR                   | Éviter les références directes                     |
| Restriction des API               | Limiter l’exposition                               |
| Jetons d’accès                    | Sécuriser dynamiquement                            |
| Tests avec comptes                | Vérifier les privilèges                            |
| Journalisation                    | Tracer les activités                               |

---

## 6. Cryptographie (ex. : CWE-327, CWE-330)

**Description** : Utilisation faible ou incorrecte de la crypto.

| **Moyen de sécurisation**          | **Explication**                                      |
|-----------------------------------|-----------------------------------------------------|
| Algorithmes forts                 | Utiliser AES-256, SHA-256                          |
| Entropie élevée                   | Générer des clés robustes                          |
| Bibliothèques sécurisées          | OpenSSL, Bouncy Castle                             |
| Protocoles modernes               | TLS 1.3                                            |
| Éviter les obsolètes              | Pas de MD5, DES                                    |
| Salage des hachages               | Salt unique par hachage                            |
| Validation des certificats        | Vérifier client/serveur                            |
| Tests de robustesse               | Utiliser CryptCheck                                |
| Stockage sécurisé                 | HSM pour les clés                                  |
| Documentation                     | Justifier les choix                                |

---

## 7. Gestion des erreurs (ex. : CWE-209, CWE-755)

**Description** : Exposition ou plantages dus aux erreurs.

| **Moyen de sécurisation**          | **Explication**                                      |
|-----------------------------------|-----------------------------------------------------|
| Masquer les erreurs               | Ne pas exposer d’infos sensibles                   |
| Exceptions génériques             | Messages neutres en production                     |
| Journalisation                    | Enregistrer sans afficher                          |
| Validation avant traitement       | Prévenir les erreurs                               |
| Tests des edge cases              | Simuler les échecs                                 |
| Gestionnaires robustes            | Gérer proprement les exceptions                    |
| Pas de stack traces               | Éviter les détails visibles                        |
| Pages d’erreur personnalisées     | Rediriger les utilisateurs                         |
| Monitoring                        | Utiliser Sentry                                    |
| Audit des logs                    | Détecter les anomalies                             |

---

## 8. Validation des entrées (ex. : CWE-20)

**Description** : Vérification insuffisante des données entrantes.

| **Moyen de sécurisation**          | **Explication**                                      |
|-----------------------------------|-----------------------------------------------------|
| Validation type/longueur          | Vérifier avant usage                               |
| Regex sécurisées                  | Filtrer précisément                                |
| Sanitisation                      | Nettoyer les données                               |
| Liste blanche                     | Accepter uniquement le prévu                       |
| Rejet par défaut                  | Bloquer les invalides                              |
| Frameworks avec validation        | Simplifier la vérification                         |
| Tests avec payloads               | Simuler des attaques                               |
| Limiter les tailles               | Contrôler les buffers                              |
| Vérification des uploads          | Type, taille des fichiers                          |
| Audit des points d’entrée         | Scanner les vulnérabilités                         |

---

## 9. Gestion de fichiers (ex. : CWE-22, CWE-434)

**Description** : Accès ou manipulation non autorisée de fichiers.

| **Moyen de sécurisation**          | **Explication**                                      |
|-----------------------------------|-----------------------------------------------------|
| Validation des chemins            | Liste blanche des accès                            |
| Restriction des répertoires       | Limiter les zones accessibles                      |
| Sanitisation des noms             | Éviter les traversées                              |
| Vérification des uploads          | Contrôler extensions/MIME                          |
| Stockage hors racine web          | Protéger les fichiers                              |
| Permissions limitées              | Restreindre l’écriture                             |
| Sandbox                           | Isoler les uploads                                 |
| Chiffrement                       | Protéger les données                               |
| Tests avec outils                 | Simuler des traversées (Burp)                      |
| Journalisation                    | Tracer les accès                                   |

---

## 10. Synchronisation et concurrence (ex. : CWE-362, CWE-367)

**Description** : Problèmes de threads ou d’accès concurrents.

| **Moyen de sécurisation**          | **Explication**                                      |
|-----------------------------------|-----------------------------------------------------|
| Verrous (locks)                   | Synchroniser les accès                             |
| Transactions atomiques            | Garantir l’intégrité                               |
| Vérification avant/après          | Prévenir les TOCTOU                                |
| Minimiser sections critiques      | Réduire les risques                                |
| Tests sous charge                 | Simuler la concurrence                             |
| Bibliothèques thread-safe         | Simplifier la gestion                              |
| Éviter variables globales         | Réduire les conflits                               |
| Audit des points concurrents      | Identifier les failles                             |
| Mise à jour des dépendances       | Corriger les bugs                                  |
| Documentation                     | Expliquer les scénarios                            |

---

## Précautions
- **Usage légal** : Tests sur systèmes autorisés uniquement.
- **Standards** : Suivre OWASP, NIST, MITRE.
- **Outils** : Nikto, Wfuzz, SonarQube pour audits.
