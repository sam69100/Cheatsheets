# gophish.md

## cheat sheet - gophish

Ce document présente les étapes et commandes essentielles pour configurer et utiliser GoPhish, un outil de simulation de phishing, dans un cadre légal et autorisé.

---

## 1. Installation

| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `wget https://github.com/gophish/gophish/releases/download/v0.12.1/gophish-v0.12.1-linux-64bit.zip` | Télécharge la dernière version |
| `unzip gophish-v0.12.1-linux-64bit.zip` | Décompresse l’archive                           |
| `chmod +x gophish`                   | Rend le binaire exécutable                          |
| `./gophish`                          | Lance GoPhish (port 3333 par défaut)                |

---

## 2. Configuration de base

### Fichier `config.json`

{
  "admin_server": {
    "listen_url": "0.0.0.0:3333",
    "use_tls": true,
    "cert_path": "gophish.crt",
    "key_path": "gophish.key"
  },
  "phish_server": {
    "listen_url": "0.0.0.0:80",
    "use_tls": false
  },
  "db_name": "sqlite3",
  "db_path": "gophish.db"
}


| **Paramètre**                | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `admin_server.listen_url`    | Port admin (ex. : 3333)                             |
| `phish_server.listen_url`    | Port du serveur phishing (ex. : 80 ou 443)          |
| `use_tls`                    | Active HTTPS (certificat requis)                    |

---

## 3. Commandes courantes

| **Commande**                         | **Description**                                      |
|--------------------------------------|-----------------------------------------------------|
| `./gophish`                          | Démarre le serveur GoPhish                          |
| `sudo setcap cap_net_bind_service=+ep ./gophish` | Autorise ports <1024 sans root                  |
| `openssl req -newkey rsa:2048 -nodes -keyout gophish.key -x509 -days 365 -out gophish.crt` | Crée un certificat auto-signé |

---

## 4. Utilisation dans l’interface web

- **URL par défaut** : `https://localhost:3333`
- **Identifiants par défaut** : `admin` / `gophish` (changez-les immédiatement).

### Étapes principales
| **Étape**                    | **Action**                                          |
|------------------------------|-----------------------------------------------------|
| Créer un groupe               | Users > New Group > Ajouter cibles (CSV ou manuel)  |
| Configurer un email          | Sending Profiles > SMTP + Template HTML             |
| Créer une landing page       | Landing Pages > Importer ou éditer manuellement     |
| Lancer une campagne          | Campaigns > Configurer groupe, email, page          |
| Vérifier les résultats       | Dashboard > Stats (clics, soumissions)              |

---

## 5. Exemples pratiques

### Campagne de phishing simple
1. Configurez `config.json` pour utiliser un domaine (ex. : `phish.example.com`).
2. Ajoutez une cible : `Users > New Group > email@example.com`.
3. Créez un template : `Emails > New Template > "Votre mot de passe expire, cliquez ici"`.
4. Définissez une landing page : `Landing Pages > Importer un site légitime`.
5. Lancez : `Campaigns > New Campaign`.

### Variables utiles
| **Variable**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `{{.FirstName}}`             | Prénom de la cible                                  |
| `{{.Email}}`                 | Email de la cible                                   |
| `{{.URL}}`                   | Lien vers la landing page                           |
| `{{.TrackingURL}}`           | URL de suivi des clics                              |

---

## 6. Précautions

- **Usage légal** : Simulations uniquement avec autorisation explicite.
- **Sécurité** : Utilisez HTTPS et changez les identifiants par défaut.
- **Logs** : Vérifiez `/var/log/syslog` ou stdout pour les erreurs.
  

