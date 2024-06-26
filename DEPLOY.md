### Étape 1 : Installation et configuration de Docker

1. Se connecter au VPS via SSH :  
   Dans une terminal, entrer par exemple `ssh student@nicolaschambon-server.eddi.cloud`

2. Pour installer Docker (et Docker Compose) sur Ubuntu, suivre la [documentation officielle](https://docs.docker.com/engine/install/ubuntu/).  
   Lancer les commandes suivantes, une par une :

   ```bash
   sudo apt update
   sudo apt install -y ca-certificates curl
   sudo install -m 0755 -d /etc/apt/keyrings
   sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
   sudo chmod a+r /etc/apt/keyrings/docker.asc
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt update
   sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   ```

3. Une fois toutes les commandes lancées, se déconnecter de la session en tapant `exit`, puis se reconnecter

4. Une fois reconnecté, lancer les commandes suivantes pour vérifier la version de Docker et de Docker Compose installée :

   ```bash
   docker --version
   docker compose version
   ```

5. Ajouter son utilisateur au groupe `docker` pour pouvoir exécuter des commandes Docker sans `sudo`. Remplacer `<nom_utilisateur>` par le nom de son utilisateur :

   ```
   sudo usermod -aG docker <nom_utilisateur>
   ```

6. Se déconnecter (commande : `exit`) puis se reconnecter (via clé SSH) au VPS pour appliquer les modifications.

### Étape 3. Lier le VPS à votre compte GitHub

1. Générer une clé SSH sur votre VPS :

```bash
ssh-keygen -t rsa -b 4096 -C "votre.email@example.com"
```

   Appuyer sur Entrée pour accepter l'emplacement par défaut, puis saisir (ou non) une phrase de passe. 

2. Ajouter la clé SSH à l'agent SSH

Démarrer l'agent SSH et ajouter la clé :

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

3. Ajouter la clé SSH au compte GitHub

Afficher la clé publique générée :

```bash
cat ~/.ssh/id_rsa.pub
```

Copier la clé affichée et l'ajouter à votre compte GitHub sous **Settings > SSH and GPG keys > New SSH key**.

### Étape 3 : Préparation de l'application Node.js

1. Créer un dossier pour ranger l'application à déployer
    ```
    sudo mkdir -p /var/www/
    ```

2. Y cloner le repo github de l'application
    
    ```
    cd /var/www/
    sudo git clone git@github.com:NicolasChambon/Mountify-backend.git
    ```

3. Configurer npm

   3.1. **Supprimer les installations précédentes de npm** :
   
   Avant de procéder, assurez-vous de nettoyer les installations précédentes de npm :

   ```bash
   sudo apt remove npm
   sudo apt autoremove
   ```

   3.2. **Installer npm à nouveau en utilisant npm version manager (nvm)** :

   nvm est une alternative à considérer car il permet une gestion plus souple des versions de Node.js et npm sans nécessiter sudo pour les commandes d'installation.

   - **Installer nvm** si ce n'est pas déjà fait :

     ```bash
     curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
     source ~/.bashrc
     ```

   - **Installer une version récente de Node.js via nvm** :

     ```bash
     nvm install node # Installe la dernière version de Node.js
     ```

   3.3. **Régler les permissions pour npm global** :

   Après avoir installé npm via nvm, s'assurer que le dossier où les packages npm globaux sont installés soit accessible sans sudo. Configurer npm pour installer globalement les packages dans le répertoire utilisateur. Pour cela, configurer npm pour utiliser un répertoire local pour les packages globaux (par exemple `~/.npm-global`).

   - Créer un répertoire pour les packages npm globaux dans le répertoire personnel :

     ```bash
     mkdir ~/.npm-global
     ```

   - Configurer npm pour utiliser ce répertoire :

     ```bash
     npm config set prefix '~/.npm-global'
     ```

   - Ajouter le chemin du répertoire `~/.npm-global/bin` au PATH utilisateur en éditant le fichier de profil (`~/.bashrc`, `~/.zshrc`, ou autre) :

     ```bash
     export PATH=~/.npm-global/bin:$PATH
     ```

     S'assurer de recharger le shell ou d'exécuter 
     ```
     nvm use --delete-prefix v22.3.0 --silent
     source ~/.bashrc
     ```
      pour appliquer les modifications.

4. **Installer les packages sans sudo** :

  - S'assurer que l'utilisateur possède les droits d'accès au répertoire :

  ```bash
  sudo chown -R $USER:$USER /var/www/Mountify-backend
  ```

- S'assurer que les permissions sont correctement définies :

  ```bash
  chmod -R 755 /var/www/Mountify-backend
  ```

   ```bash
   cd /var/www/Mountify-backend
   npm install
   ```

   Si cela fonctionne correctement sans sudo, npm est correctement configuré pour utiliser un répertoire local pour les packages globaux.

Cela devrait résoudre les problèmes liés aux versions non supportées de Node.js.  
Il est également conseillé d'exécuter une mise à jour des paquets et vérifier s'il y a des vulnérabilités restantes :

```sh
npm audit fix
npm audit
```

### Étape 4 : Préparation du conteneur Docker pour l'application

1. Modifier le fichier `.env`

Pour que l'application Node.js se connecte à PostgreSQL correctement dans un environnement Docker, il faut modifier l'URL de connexion à la base de données dans le fichier `.env` pour qu'elle utilise le nom du conteneur PostgreSQL au lieu de `localhost`.

**Remplacer `localhost` par le nom du conteneur PostgreSQL (`mountify-postgres`) dans la variable `PG_URL`**. Cela devrait ressembler à ceci :
   ```env
   BASE_URL=http://localhost
   MOUNTIFY_PORT=3000
   PG_URL=postgres://<YourUserName>:<YourPassword>@mountify-postgres:5432/<YourDatabaseName>
   JWT_SECRET="<YourJwtSecret>"
   ```

2. **Créer un fichier `Dockerfile`** à la racine de ton projet. Ce fichier décrit comment construire l'image Docker pour l'application. Voici un exemple de `Dockerfile` pour une application Node.js :

   ```Dockerfile
   # Utiliser une image Node.js de base
   FROM node:20

   # Définir le répertoire de travail dans le conteneur
   WORKDIR /app

   # Copier le fichier package.json et package-lock.json dans le répertoire de travail
   COPY package*.json ./

   # Installer les dépendances de l'application
   RUN npm install

   # Copier le reste des fichiers de l'application dans le répertoire de travail
   COPY . .

   # Exposer le port sur lequel l'application écoute
   EXPOSE 3000

   # Démarrer l'application
   CMD ["npm", "start"]
   ```

   Ajuste ce `Dockerfile` si nécessaire pour le projet (par exemple, le numéro de version de Node.js ou le port utilisé par ton application).

3. **Créer un fichier `.dockerignore`** pour exclure les fichiers et répertoires inutiles de l'image Docker (similaire à `.gitignore`). Voici un exemple de `.dockerignore` :

   ```
   node_modules
   npm-debug.log
   Dockerfile
   .dockerignore
   ```

### Étape 5 : Déploiement de PostgreSQL avec Docker

1. **Créer un réseau Docker** pour permettre la communication entre les conteneurs de l'application et de PostgreSQL. Utiliser la commande suivante pour créer un réseau nommé `mountify-network` :
   ```sh
   docker network create mountify-network
   ```

2. **Exécuter un conteneur PostgreSQL**. Utiliser la commande suivante pour démarrer un conteneur PostgreSQL :
   ```sh
   docker run --name mountify-postgres -e POSTGRES_PASSWORD=<YourPassword> -e POSTGRES_USER=<YourUserName> -e POSTGRES_DB=<YourDatabaseName> --network mountify-network -d postgres
   ```

3. **Vérifier que le conteneur PostgreSQL est en cours d'exécution** en listant les conteneurs Docker :
   ```sh
   docker ps
   ```
   `mountify-postgres` devrait figurer dans la liste.

4. **Créer et démarrer le conteneur de l'application** avec le réseau Docker. Utiliser les commandes suivantes :
   ```sh
   docker build -t mountify-backend-node .
   docker run -d -p 3000:3000 --name mountify-backend-container --network mountify-network mountify-backend-node
   ```

5. **Vérifier que l'application et la base de données fonctionnent ensemble**. Ouvrer le navigateur et accèder à `http://<rou_vps_ip>:3000`. L'application devrait maintenant être capable de se connecter à PostgreSQL et d'afficher le message d'accueil.

### Étape 6 : Copier et exécuter les fichiers SQL (DDL et DML) dans le conteneur PostgreSQL

1. **Copier les fichiers SQL dans le conteneur PostgreSQL** :
   ```sh
   docker cp /var/www/Mountify-backend/data/create_tables.sql mountify-postgres:/schema.sql
   docker cp /var/www/Mountify-backend/data/seeding.sql mountify-postgres:/data.sql
   ```

2. **Exécuter les scripts SQL à l'intérieur du conteneur PostgreSQL** :
   ```sh
   docker exec -it mountify-postgres psql -U mountify -d mountify -f /schema.sql
   docker exec -it mountify-postgres psql -U mountify -d mountify -f /data.sql
   ```

Ces commandes exécutent les fichiers `schema.sql` et `data.sql` en utilisant le client `psql` à l'intérieur du conteneur PostgreSQL.
