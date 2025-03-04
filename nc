___________________________________________________________________________
                    [ cheat sheet nc ]
___________________________________________________________________________
1. Écouter sur un port
Fonction : Mettre Netcat en mode écoute sur un port donné.
Commande : nc -l <port>
Exemple : nc -l 1234
Écoute sur le port 1234 pour une connexion entrante.
___________________________________________________________________________

2. Se connecter à un hôte
Fonction : Établir une connexion vers un hôte distant.
Commande : nc <host> <port>
Exemple : nc 192.168.1.10 1234
Se connecte à 192.168.1.10 sur le port 1234.
___________________________________________________________________________

3. Transférer un fichier (serveur)
Fonction : Envoyer un fichier depuis le serveur vers un client.
Commande : nc -l <port> < fichier
Exemple : nc -l 1234 < secret.txt
Écoute sur 1234 et envoie secret.txt au client qui se connecte.
___________________________________________________________________________

4. Recevoir un fichier (client)
Fonction : Recevoir un fichier envoyé par le serveur.
Commande : nc <host> <port> > fichier
Exemple : nc 192.168.1.10 1234 > secret.txt
Se connecte à 192.168.1.10:1234 et sauvegarde le fichier reçu dans secret.txt.
___________________________________________________________________________

5. Chat simple entre deux machines
Fonction : Établir une communication bidirectionnelle.
Commande : nc -l <port> (serveur) et nc <host> <port> (client)
Exemple : nc -l 1234 (serveur) et nc 192.168.1.10 1234 (client)
Permet un chat texte entre les deux hôtes via le port 1234.
___________________________________________________________________________

6. Scanner un port
Fonction : Vérifier si un port est ouvert sur une cible.
Commande : nc -zv <host> <port>
Exemple : nc -zv 192.168.1.10 80
Teste si le port 80 est ouvert sur 192.168.1.10 (-z pour scan, -v pour verbeux).
___________________________________________________________________________

7. Transférer un fichier avec compression (serveur)
Fonction : Compresser et envoyer un fichier.
Commande : tar czf - <fichier> | nc -l <port>
Exemple : tar czf - data.tar.gz | nc -l 1234
Compresse data.tar.gz et l’envoie via le port 1234.
___________________________________________________________________________

8. Recevoir un fichier compressé (client)
Fonction : Recevoir et décompresser un fichier.
Commande : nc <host> <port> | tar xzf -
Exemple : nc 192.168.1.10 1234 | tar xzf -
Reçoit et décompresse le fichier envoyé depuis 192.168.1.10:1234.
___________________________________________________________________________

9. Relayer un port (proxy simple)
Fonction : Rediriger le trafic d’un port vers un autre hôte.
Commande : nc -l <local_port> | nc <remote_host> <remote_port>
Exemple : nc -l 1234 | nc 192.168.1.20 80
Redirige le trafic de 1234 local vers 192.168.1.20:80.
___________________________________________________________________________

10. Exécuter une commande à distance
Fonction : Lancer un shell ou une commande sur connexion.
Commande : nc -l <port> -e <command>
Exemple : nc -l 1234 -e /bin/bash
Écoute sur 1234 et exécute un shell Bash pour le client (attention : option -e pas toujours disponible).
___________________________________________________________________________

Notes importantes :
Permissions : Peut nécessiter sudo pour les ports < 1024.
Installation : sudo apt install netcat (Ubuntu/Debian).
Variantes : Certaines versions (nc.traditional, nc.openbsd) diffèrent légèrement.
