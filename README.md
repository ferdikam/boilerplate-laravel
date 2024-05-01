# Template Laravel avec Docker

Ce dépôt contient un template Laravel prêt à l'emploi, configuré avec Docker. Il inclut plusieurs services préconfigurés pour faciliter le développement et le déploiement des applications Laravel.

## Services Inclus

- **FrankenPHP**: Serveur PHP et HTTP conçu pour des performances optimales.
- **Minio**: Stockage d'objets compatible avec Amazon S3 pour gérer les fichiers en développement.
- **Redis**: Système de gestion de base de données en mémoire, utilisé comme cache et pour le stockage de sessions.
- **Adminer**: Outil de gestion de base de données via une interface web.

## Prérequis

Assurez-vous d'avoir Docker et Docker Compose installés sur votre machine avant de continuer. Visitez [Docker](https://www.docker.com/get-started) pour les instructions d'installation.

## Installation

1. Clonez le dépôt Git :
   ```bash
   git clone https://github.com/votre-username/votre-repo.git
   cd votre-repo

2. Copiez le fichier d'environnement exemple et configurez-le selon vos besoins :
    ```bash
    cp .env.example .env

3. Lancez les conteneurs Docker :
    ```bash
    docker-compose up -d

4. Installez les dépendances de Laravel :
    ```bash
    docker-compose exec app composer install

5. Générez une clé d'application :
    ```bash
    docker-compose exec app php artisan key:generate

6. Effectuez les migrations de base de données (si nécessaire) :
    ```bash
    docker-compose exec app php artisan migrate

## Utilisation
- Accéder à l'application: Ouvrez votre navigateur et allez à http://localhost:8000.
- Adminer: Pour gérer la base de données, accédez à http://localhost:8080.
- Minio: Accédez à http://localhost:9000 pour utiliser Minio.
