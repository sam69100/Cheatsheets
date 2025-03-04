# OWASP Top 10 2021 + Failles Pentest Systèmes et Réseaux

Ce document présente le **Top 10 OWASP 2021** (version la plus récente largement adoptée à ce jour, sauf mise à jour en 2025 non précisée), suivi des failles courantes en pentests systèmes et réseaux. Pour chaque faille : emplacement (frontend, backend ou les deux), explication, et 8 moyens de sécurisation avec exemples concrets.

---

## 1. Top 10 OWASP 2021

### A01:2021 - Contrôle d'accès défaillant
- **Description** : Les utilisateurs accèdent à des ressources ou fonctionnalités sans autorisation appropriée.
- **Côté** : Backend (principalement), mais influencé par une mauvaise implémentation frontend.
- **Exemple** : Modification de `user_id=123` en `user_id=456` dans une requête pour voir les données d’un autre utilisateur.
- **Moyens de sécurisation** :
  1. Vérifier les permissions côté serveur : `if (user.role !== "admin") return 403;` (Node.js).
  2. Utiliser un contrôle d’accès basé sur les rôles (RBAC) : `@PreAuthorize("hasRole('ADMIN')")` (Spring Security).
  3. Ne pas exposer les ID sensibles dans les URL : Utiliser des UUID (`/profile/8f4e3b2a` au lieu de `/profile/1`).
  4. Implémenter une validation stricte des sessions : `session.userId === requestedId` (Backend).
  5. Utiliser des tokens JWT avec vérification : `jwt.verify(token, secret)` (Node.js).
  6. Limiter les endpoints sensibles : Restreindre `/admin` avec un middleware (ex. : Express.js).
  7. Auditer les accès : Logger chaque tentative (`log.info("Access to /admin by user {}", userId);`).
  8. Tester les autorisations : Simuler des utilisateurs avec Burp Suite.

### A02:2021 - Défaillances cryptographiques
- **Description** : Mauvais usage ou absence de chiffrement pour protéger les données sensibles.
- **Côté** : Backend (principalement), mais le frontend peut exposer des données s’il les manipule mal.
- **Exemple** : Transmission de mots de passe en clair via HTTP.
- **Moyens de sécurisation** :
  1. Forcer HTTPS : `Redirect permanent / http://example.com/` (Nginx).
  2. Chiffrer les données sensibles : `openssl_encrypt(data, "AES-256-CBC", key)` (PHP).
  3. Hacher les mots de passe : `bcrypt.hash(password, 12)` (Node.js).
  4. Utiliser des clés fortes : `openssl genrsa -out private.key 2048`.
  5. Désactiver les algorithmes faibles : `SSLCipherSuite !MD5 !RC4` (Apache).
  6. Implémenter HSTS : `Strict-Transport-Security: max-age=31536000` (Header HTTP).
  7. Valider les certificats : `curl --cert-status` (côté serveur).
  8. Stocker les clés en sécurité : HashiCorp Vault.

### A03:2021 - Injection
- **Description** : Données non fiables exécutées comme code (SQL, OS, LDAP, etc.).
- **Côté** : Backend (principalement), mais le frontend peut contribuer s’il envoie des données non validées.
- **Exemple** : `SELECT * FROM users WHERE name = 'admin' OR '1'='1';`.
- **Moyens de sécurisation** :
  1. Utiliser des requêtes paramétrées : `stmt = conn.prepare("SELECT * FROM users WHERE name = ?")` (Java).
  2. Échapper les entrées : `htmlspecialchars(input, ENT_QUOTES)` (PHP).
  3. Valider les entrées : Regex `^[a-zA-Z0-9]+$` pour les noms d’utilisateur.
  4. Utiliser un ORM sécurisé : `User.findById(id)` (Sequelize).
  5. Désactiver l’exécution dynamique : `disable_functions = exec,shell_exec` (PHP.ini).
  6. Limiter les privilèges de la BDD : `GRANT SELECT ON users TO 'app_user';` (SQL).
  7. Filtrer les caractères spéciaux : Rejeter `;` ou `--` dans les inputs.
  8. Auditer les journaux : Vérifier les requêtes suspectes avec un SIEM.

### A04:2021 - Conception non sécurisée
- **Description** : Mauvaise architecture ou absence de principes sécurisés dès la conception.
- **Côté** : Backend et Frontend (les deux, dépend du design global).
- **Exemple** : Absence de validation des limites d’API entraînant une surcharge.
- **Moyens de sécurisation** :
  1. Appliquer le principe du moindre privilège : `chmod 600 fichier_sensible`.
  2. Implémenter une limitation de débit : `app.use(rateLimit({ windowMs: 15 * 60 * 1000, max: 100 }))` (Express.js).
  3. Utiliser des modèles de menace : STRIDE pour identifier les risques.
  4. Valider les flux de données : Vérifier chaque étape d’une transaction.
  5. Tester les scénarios d’abus : Simuler avec OWASP ZAP.
  6. Documenter les exigences de sécurité : Inclure dans le SDLC.
  7. Former les équipes : Sessions sur Secure Design Patterns.
  8. Réviser l’architecture : Audits réguliers par des experts.

### A05:2021 - Mauvaise configuration de sécurité
- **Description** : Paramètres par défaut ou exposés laissant des failles.
- **Côté** : Backend (principalement), mais le frontend peut révéler des configs mal protégées.
- **Exemple** : Port 22 SSH ouvert avec mot de passe par défaut.
- **Moyens de sécurisation** :
  1. Désactiver les services inutiles : `systemctl disable apache2`.
  2. Changer les valeurs par défaut : Modifier `admin/admin` en credentials uniques.
  3. Restreindre les ports : `ufw deny 22` (pare-feu).
  4. Supprimer les métadonnées : Désactiver `Server: Apache` dans les headers.
  5. Mettre à jour les logiciels : `apt update && apt upgrade`.
  6. Utiliser des fichiers .env : `DATABASE_URL=secret` hors du code source.
  7. Vérifier les permissions : `chmod 644 config.php`.
  8. Scanner les configs : Outils comme Nessus ou OpenVAS.

### A06:2021 - Composants vulnérables et obsolètes
- **Description** : Utilisation de bibliothèques ou logiciels non maintenus.
- **Côté** : Backend et Frontend (les deux, selon les dépendances).
- **Exemple** : jQuery 1.9 avec une faille XSS connue.
- **Moyens de sécurisation** :
  1. Mettre à jour les dépendances : `npm update` ou `composer update`.
  2. Vérifier les CVE : Consulter `cve.mitre.org` pour chaque composant.
  3. Utiliser des outils d’analyse : Dependabot ou Snyk.
  4. Supprimer les dépendances inutiles : `npm prune`.
  5. Tester les versions : `docker run -it old_version`.
  6. Documenter les composants : Maintenir un fichier `dependencies.md`.
  7. Appliquer des patches temporaires : Si mise à jour impossible.
  8. Surveiller les alertes : Abonnement aux flux RSS de sécurité.

### A07:2021 - Défaillances d’authentification et de gestion de sessions
- **Description** : Mauvaise gestion des identifiants ou des sessions.
- **Côté** : Backend (principalement), mais le frontend peut exposer des tokens.
- **Exemple** : Session ID dans l’URL.
- **Moyens de sécurisation** :
  1. Utiliser des cookies sécurisés : `Set-Cookie: session_id=abc; HttpOnly; Secure`.
  2. Implémenter 2FA : `totp.verify(token)` (Node.js).
  3. Régénérer les sessions : `session_regenerate_id(true)` (PHP).
  4. Limiter les tentatives : Bloquer après 5 échecs (`fail2ban`).
  5. Hacher les mots de passe : `Argon2.hash(password)`.
  6. Expirer les sessions : Timeout de 15 min (`session.gc_maxlifetime = 900`).
  7. Vérifier les tokens : `jwt.verify(token, secret)` (Backend).
  8. Sensibiliser les utilisateurs : Messages sur les mots de passe forts.

### A08:2021 - Défaillances d’intégrité des données et logiciels
- **Description** : Données ou logiciels compromis par manque de validation ou signature.
- **Côté** : Backend (principalement), mais le frontend peut être affecté par des scripts tiers.
- **Exemple** : Téléchargement d’un package non signé.
- **Moyens de sécurisation** :
  1. Signer les mises à jour : `gpg --sign package.tar.gz`.
  2. Vérifier les hachages : `sha256sum fichier` vs valeur officielle.
  3. Utiliser HTTPS pour les téléchargements : `wget https://site/trusted`.
  4. Valider les inputs : `if (!isValidJson(data)) reject();`.
  5. Scanner les dépendances : `npm audit`.
  6. Contrôler les sources : Restreindre à des dépôts officiels (`apt sources.list`).
  7. Chiffrer les backups : `tar -czf - | openssl enc -aes-256-cbc`.
  8. Auditer les intégrations : Vérifier les API tierces.

### A09:2021 - Défaillances de journalisation et de surveillance
- **Description** : Absence ou mauvaise gestion des logs pour détecter les attaques.
- **Côté** : Backend (principalement).
- **Exemple** : Aucune trace d’une connexion suspecte.
- **Moyens de sécurisation** :
  1. Activer les logs : `error_log = /var/log/app.log` (PHP).
  2. Centraliser les logs : Utiliser un SIEM comme ELK Stack.
  3. Inclure des détails : `log.info("Login failed for {}", user)` (Java).
  4. Protéger les logs : `chmod 640 /var/log/auth.log`.
  5. Surveiller en temps réel : `tail -f /var/log/syslog`.
  6. Définir des alertes : Notify sur `error 500` (ex. : via Slack).
  7. Tester la détection : Simuler une attaque avec Metasploit.
  8. Sauvegarder les logs : `rsync -a /var/log/ backup_server`.

### A10:2021 - Falsification de requêtes côté serveur (SSRF)
- **Description** : Application effectuant des requêtes non contrôlées vers des serveurs internes/externes.
- **Côté** : Backend (principalement).
- **Exemple** : `curl "http://internal.admin.local"` via un paramètre utilisateur.
- **Moyens de sécurisation** :
  1. Valider les URLs : `if (!url.startsWith("https://allowed.com")) reject();`.
  2. Utiliser une liste blanche : `allowed = ["trusted.com"];`.
  3. Désactiver les redirections : `curl_setopt(CURLOPT_FOLLOWLOCATION, false)` (PHP).
  4. Restreindre les ports : Bloquer `80`, `443` non nécessaires (`iptables`).
  5. Filtrer les adresses : Rejeter `127.0.0.1` ou `localhost`.
  6. Limiter les protocoles : Autoriser uniquement `https://`.
  7. Sandboxer les requêtes : Utiliser une VM ou un conteneur.
  8. Surveiller les appels : Logger chaque requête sortante.

---

## 2. Failles courantes dans les pentests systèmes

### a) Mots de passe faibles ou par défaut
- **Côté** : Backend (système).
- **Exemple** : `root/root` sur un serveur Linux.
- **Moyens de sécurisation** :
  1. Imposer des mots de passe forts : `passwd -l 12 -c 3` (Linux policy).
  2. Changer les défauts : `passwd root` immédiatement.
  3. Utiliser SSH par clés : `ssh-keygen -t rsa`.
  4. Désactiver les comptes inutiles : `usermod -L guest`.
  5. Activer 2FA : `google-authenticator` pour SSH.
  6. Surveiller les échecs : `fail2ban` sur `/var/log/auth.log`.
  7. Scanner les mots de passe : Outil comme John the Ripper.
  8. Former les admins : Sensibilisation aux bonnes pratiques.

### b) Services non patchés
- **Côté** : Backend (système).
- **Exemple** : OpenSSL vulnérable à Heartbleed.
- **Moyens de sécurisation** :
  1. Mettre à jour : `yum update openssl`.
  2. Vérifier les CVE : `nmap --script vuln`.
  3. Désactiver les anciens : `systemctl disable old_service`.
  4. Tester les patches : `docker run -it vuln_test`.
  5. Surveiller les annonces : Abonnement à `securityfocus.com`.
  6. Automatiser les mises à jour : `unattended-upgrades` (Ubuntu).
  7. Isoler les services : Conteneurs Docker.
  8. Auditer régulièrement : Avec Nessus ou Qualys.

---

## 3. Failles courantes dans les pentests réseaux

### a) Ports ouverts inutilement
- **Côté** : Backend (réseau).
- **Exemple** : Port 445 (SMB) exposé publiquement.
- **Moyens de sécurisation** :
  1. Fermer les ports : `ufw deny 445`.
  2. Scanner les ports : `nmap -p- localhost`.
  3. Limiter les accès : `iptables -A INPUT -p tcp --dport 445 -s trusted_ip -j ACCEPT`.
  4. Désactiver les services : `systemctl stop smb`.
  5. Utiliser un VPN : OpenVPN pour accès distant.
  6. Surveiller le trafic : `tcpdump port 445`.
  7. Segmenter le réseau : VLAN pour isoler les machines.
  8. Documenter les ports : Liste des services nécessaires.

### b) Protocoles non sécurisés
- **Côté** : Backend (réseau).
- **Exemple** : Telnet au lieu de SSH.
- **Moyens de sécurisation** :
  1. Remplacer par des alternatives : `apt install openssh-server`.
  2. Désactiver les anciens : `systemctl disable telnet`.
  3. Chiffrer les connexions : Forcer SSH avec `Protocol 2` dans `sshd_config`.
  4. Vérifier les usages : `netstat -tuln | grep 23`.
  5. Filtrer le trafic : `iptables -A INPUT -p tcp --dport 23 -j DROP`.
  6. Tester la sécurité : `telnet localhost` (doit échouer).
  7. Former les utilisateurs : Préférer SSH ou SFTP.
  8. Surveiller les protocoles : Avec Wireshark.

---

Ce guide couvre le **Top 10 OWASP 2021** ainsi que des failles typiques en pentests systèmes et réseaux, avec des moyens de sécurisation pratiques et des exemples concrets.
---
# Moyens de sécurisation globale d’un système

## 4. Dix Moyens de sécurisation globale d’un système
- **Description** : Pratiques générales pour sécuriser un système dans son ensemble.
- **Côté** : Backend, Frontend, Système, Réseau (selon applicabilité).
- **Moyens de sécurisation** :
  1. Mettre à jour régulièrement : `apt update && apt upgrade` (Linux).
  2. Activer un pare-feu : `ufw enable` avec règles strictes.
  3. Chiffrer les disques : `cryptsetup luksFormat /dev/sda`.
  4. Sauvegarder régulièrement : `rsync -a /data /backup`.
  5. Surveiller les logs : `tail -f /var/log/syslog` ou SIEM.
  6. Limiter les privilèges : `chmod 700 /sensitive_dir`.
  7. Désactiver root distant : `PermitRootLogin no` (sshd_config).
  8. Utiliser 2FA : `google-authenticator` pour SSH/users.
  9. Segmenter le réseau : VLAN ou règles `iptables`.
  10. Scanner les vulnérabilités : `nmap -sV --script vuln localhost`.
