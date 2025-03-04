# Exemples Dockerfile - Kali et Ubuntu

Une référence rapide avec des exemples complets de **Dockerfile** pour **Kali Linux** (pentest) et **Ubuntu** (application Python), incluant fonctions, commandes et exemples d’utilisation.

---

## 1. Exemple complet pour Kali Linux
**Fonction** : Dockerfile pour un environnement de pentest basé sur Kali.  
**Commande** :  
```dockerfile
# Utilise l’image officielle de Kali Linux comme base
FROM kalilinux/kali-rolling:latest
# Définir le répertoire de travail
WORKDIR /root
# Mettre à jour les paquets et installer des outils de base
RUN apt-get update && apt-get install -y nmap metasploit-framework sqlmap && apt-get clean
# Ajouter une variable d’environnement
ENV HACK_ENV="pentest"
# Copier un script local dans le conteneur
COPY scan.sh /root/scan.sh
# Rendre le script exécutable
RUN chmod +x /root/scan.sh
# Exposer le port 4444 (par exemple pour Metasploit)
EXPOSE 4444
# Définir une commande par défaut
CMD ["/bin/bash"]
 ```
docker build -t kali-pentest . && docker run -it kali-pentest

Description : Construit et lance un conteneur Kali avec des outils de pentest comme Nmap, Metasploit et SQLmap.

##  2 Exemple complet pour Ubuntu
**Fonction** : Dockerfile pour une application Python basée sur Ubuntu.
**Commande** :  
```dockerfile
# Utilise l’image officielle d’Ubuntu comme base
FROM ubuntu:20.04
# Définir le répertoire de travail
WORKDIR /app
# Éviter les interactions pendant l’installation
ENV DEBIAN_FRONTEND=noninteractive
# Mettre à jour les paquets et installer des outils
RUN apt-get update && apt-get install -y python3 python3-pip curl && apt-get clean
# Installer des dépendances Python
RUN pip3 install requests
# Copier un fichier Python local dans le conteneur
COPY app.py /app/app.py
# Exposer le port 8080 (pour une application web par exemple)
EXPOSE 8080
# Définir une commande par défaut pour lancer l’application
CMD ["python3", "app.py"]
```
docker build -t ubuntu-app . && docker run -p 8080:8080 ubuntu-app

Description : Construit et lance un conteneur Ubuntu avec une application Python.



