# social-engineering.md

## cheat sheet - Ingénierie sociale (Faille humaine)

Ce document présente les techniques d’ingénierie sociale, leurs mécanismes et les moyens de s’en protéger, à des fins éducatives et légales uniquement.

---

## 1. Comprendre l’ingénierie sociale

L’ingénierie sociale exploite la psychologie humaine pour obtenir un accès non autorisé ou des informations sensibles.

| **Aspect**           | **Description**                                      |
|----------------------|-----------------------------------------------------|
| **Cible**            | Utilisateurs, employés, individus                  |
| **Objectif**         | Accès, données, manipulation                      |
| **Moyen**            | Tromperie, confiance, pression                     |
| **Impact**           | Vol d’identifiants, compromission de systèmes      |

---

## 2. Techniques courantes

### Phishing
| **Exemple**                  | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| Email : "Votre compte est suspendu, cliquez ici" | Piège pour voler des identifiants                 |

### Pretexting
| **Exemple**                  | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| Appel : "Je suis de l’IT, donnez-moi votre mot de passe" | Fausse identité pour obtenir des infos          |

### Baiting
| **Exemple**                  | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| Clé USB laissée dans un parking | Incite à connecter un dispositif infecté           |

### Tailgating
| **Exemple**                  | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| Suivre un employé dans un bâtiment sécurisé | Accès physique sans autorisation                  |

### Quid Pro Quo
| **Exemple**                  | **Description**                                      |
|------------------------------|-----------------------------------------------------|
| "Je répare votre PC si vous me donnez l’accès" | Échange de service contre informations             |

---

## 3. Signes d’attaque

| **Indicateur**               | **Explication**                                      |
|------------------------------|-----------------------------------------------------|
| Urgence                      | Pression pour agir vite (ex. : "Compte bloqué")     |
| Fausse autorité              | Prétend venir d’une source fiable                   |
| Offre trop belle             | Promesse irréaliste (ex. : gain facile)             |
| Demande inhabituelle         | Infos ou actions hors procédure                     |
| Erreurs grammaticales        | Souvent dans les emails phishing                   |

---

## 4. Préventions

| **Moyen**                    | **Explication**                                      |
|------------------------------|-----------------------------------------------------|
| Formation régulière          | Sensibiliser les employés aux techniques            |
| Vérification d’identité      | Toujours confirmer par un canal officiel            |
| Politiques strictes          | Ne pas partager d’infos sensibles sans validation   |
| Filtrage des emails          | Bloquer les phishing avec des outils (ex. : SPF, DMARC) |
| Contrôle d’accès physique    | Badges, surveillance des entrées                    |
| Simulation d’attaques        | Tester la résilience via faux phishing              |
| Méfiance par défaut          | Ne pas cliquer sur liens suspects                   |
| Mise à jour des processus    | Réviser les procédures de sécurité                  |
| Signalement rapide           | Encourager à rapporter les incidents                |
| Authentification forte       | MFA pour limiter les dégâts                        |

---

## 5. Exemples pratiques

| **Scénario**                 | **Technique**            | **Contre-mesure**          |
|------------------------------|--------------------------|----------------------------|
| Email avec lien suspect      | Phishing                 | Vérifier l’URL, ne pas cliquer |
| Appel d’un "technicien"      | Pretexting              | Confirmer via canal officiel |
| Clé USB trouvée              | Baiting                 | Ne pas connecter, signaler  |
| Entrée derrière un employé   | Tailgating              | Vérifier les badges         |
| Offre d’aide technique       | Quid Pro Quo            | Refuser sans validation     |

---

## 6. Précautions

- **Usage légal** : Techniques à des fins éducatives ou tests autorisés uniquement.
- **Sensibilisation** : Prioriser la prévention plutôt que l’exploitation.
- **Outils** : Utiliser des simulateurs comme SET (Social-Engineer Toolkit) dans un cadre légal.
  
