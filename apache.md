# apache.md

## cheat sheet - Apache HTTP Server

Ce document présente les commandes et configurations essentielles pour gérer un serveur Apache sous Linux.

---

## 1. Commandes de gestion

| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `sudo systemctl start apache2` | Démarre le service Apache                         |
| `sudo systemctl stop apache2` | Arrête le service Apache                           |
| `sudo systemctl restart apache2` | Redémarre Apache                                |
| `sudo systemctl reload apache2` | Recharge la configuration sans interruption       |
| `sudo apachectl configtest`  | Vérifie la syntaxe des fichiers de configuration    |
| `sudo a2enmod <module>`      | Active un module (ex. : rewrite)                    |
| `sudo a2dismod <module>`     | Désactive un module                                 |
| `sudo a2ensite <site>`       | Active un site virtuel                              |
| `sudo a2dissite <site>`      | Désactive un site virtuel                           |

---

## 2. Fichiers de configuration

| **Fichier**                  | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `/etc/apache2/apache2.conf`  | Configuration principale                           |
| `/etc/apache2/ports.conf`    | Ports écoutés (ex. : 80, 443)                      |
| `/etc/apache2/sites-available/` | Configurations des sites virtuels                 |
| `/etc/apache2/sites-enabled/` | Liens vers les sites actifs                        |
| `/etc/apache2/mods-available/` | Modules disponibles                               |
| `/etc/apache2/mods-enabled/` | Modules activés                                     |

---

<VirtualHost *:80>
    ServerName example.com
    ServerAlias www.example.com
    DocumentRoot /var/www/example
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    <Directory /var/www/example>
        Options -Indexes
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>


---

## 4. Sécurisation

| **Action**                   | **Commande/Configuration**                          |
|------------------------------|-----------------------------------------------------|
| Désactiver ServerSignature   | `ServerSignature Off` (apache2.conf)                |
| Masquer la version           | `ServerTokens Prod`                                 |
| Activer SSL                  | `sudo a2enmod ssl` + VirtualHost sur 443            |
| Désactiver TRACE             | `TraceEnable Off`                                   |
| Limiter les méthodes         | `<LimitExcept GET POST>`                            |
| Restreindre accès            | `Require ip 192.168.1.0/24`                         |
| Activer HSTS                 | `Header always set Strict-Transport-Security "max-age=31536000"` |
| Désactiver répertoires       | `Options -Indexes`                                  |
| Configurer .htaccess         | `AllowOverride All`                                 |
| Mettre à jour Apache         | `sudo apt update && sudo apt upgrade`               |

---

## 5. Logs et dépannage

| **Commande**                 | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| `tail -f /var/log/apache2/error.log` | Affiche les erreurs en temps réel            |
| `tail -f /var/log/apache2/access.log` | Affiche les accès en temps réel             |
| `apachectl -M`               | Liste les modules chargés                           |
| `netstat -tulnp | grep 80`   | Vérifie les ports utilisés                          |

---

## 6. Précautions

- **Permissions** : Vérifiez les droits sur `/var/www` (ex. : `chown -R www-data:www-data`).
- **Usage légal** : Modifications uniquement sur serveurs autorisés.
- **Sauvegarde** : Sauvegardez les fichiers de config avant modification.



## 3. Configuration de base (Virtual Host)
