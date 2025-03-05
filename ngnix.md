# nginx.md

## cheat sheet - NGINX

Ce document présente les commandes et configurations essentielles pour gérer un serveur NGINX sous Linux.

---

## 1. Commandes de gestion

| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `sudo systemctl start nginx` | Démarre le service NGINX                            |
| `sudo systemctl stop nginx`  | Arrête le service NGINX                             |
| `sudo systemctl restart nginx` | Redémarre NGINX                                   |
| `sudo systemctl reload nginx` | Recharge la config sans interruption                |
| `nginx -t`                   | Teste la syntaxe des fichiers de configuration      |
| `sudo nginx -s reload`       | Recharge NGINX sans systemctl                       |
| `sudo nginx -v`              | Affiche la version de NGINX                         |

---

## 2. Fichiers de configuration

| **Fichier**                  | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `/etc/nginx/nginx.conf`      | Configuration principale                           |
| `/etc/nginx/sites-available/` | Configurations des sites virtuels                 |
| `/etc/nginx/sites-enabled/`  | Liens vers les sites actifs                        |
| `/etc/nginx/conf.d/`         | Configurations supplémentaires                     |
| `/var/log/nginx/error.log`   | Logs d’erreurs                                      |
| `/var/log/nginx/access.log`  | Logs d’accès                                        |

---

## 3. Configuration de base (Server Block)

server {
    listen 80;
    server_name example.com www.example.com;
    root /var/www/example;
    index index.html index.htm;
    access_log /var/log/nginx/example_access.log;
    error_log /var/log/nginx/example_error.log;
    location / {
        try_files $uri $uri/ =404;
    }
}


---

## 4. Sécurisation

| **Action**                   | **Commande/Configuration**                          |
|------------------------------|-----------------------------------------------------|
| Masquer la version           | `server_tokens off;`                                |
| Activer SSL                  | `listen 443 ssl;` + certificats                     |
| Désactiver méthodes          | `limit_except GET POST { deny all; }`               |
| Restreindre accès            | `allow 192.168.1.0/24; deny all;`                   |
| Activer HSTS                 | `add_header Strict-Transport-Security "max-age=31536000";` |
| Désactiver répertoires       | `autoindex off;`                                    |
| Limiter les requêtes         | `limit_req zone=one burst=5;`                       |
| Configurer SSL sécurisé      | `ssl_protocols TLSv1.3;`                            |
| Bloquer agents suspects      | `if ($http_user_agent ~* "malicious") { return 403; }` |
| Mettre à jour NGINX          | `sudo apt update && sudo apt upgrade`               |

---

## 5. Logs et dépannage

| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `tail -f /var/log/nginx/error.log` | Affiche les erreurs en temps réel             |
| `tail -f /var/log/nginx/access.log` | Affiche les accès en temps réel              |
| `nginx -V`                   | Affiche les détails de compilation                 |
| `netstat -tulnp | grep 80`   | Vérifie les ports utilisés                          |

---

## 6. Précautions

- **Permissions** : Assurez `www-data` ou `nginx` comme propriétaire de `/var/www`.
- **Usage légal** : Modifications uniquement sur serveurs autorisés.
- **Sauvegarde** : Sauvegardez les configs avant modification.
  



