### Étape 1 : Installation et configuration de Docker

1. Se connecter au VPS via SSH :  
   Dans une terminal, entrer par exemple `ssh student@nicolaschambon-server.eddi.cloud`

2. Pour installer Docker (et Docker Compose) sur Ubuntu, suivre la [documentation officielle](https://docs.docker.com/engine/install/ubuntu/).  
   Lancer les commandes suivantes, une par une :

   ```sh
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

   ```sh
   docker --version
   docker compose version
   ```

5. Ajouter son utilisateur au groupe `docker` pour pouvoir exécuter des commandes Docker sans `sudo`. Remplacer `<nom_utilisateur>` par le nom de son utilisateur :

   ```
   sudo usermod -aG docker <nom_utilisateur>
   ```

6. Se déconnecter (commande : `exit`) puis se reconnecter (via clé SSH) au VPS pour appliquer les modifications.

### Étape 2. Lier le VPS à votre compte GitHub

1. Générer une clé SSH sur votre VPS :

```sh
ssh-keygen -t rsa -b 4096 -C "votre.email@example.com"
```

   Appuyer sur Entrée pour accepter l'emplacement par défaut, puis saisir (ou non) une phrase de passe. 

2. Ajouter la clé SSH à l'agent SSH

Démarrer l'agent SSH et ajouter la clé :

```sh
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

3. Ajouter la clé SSH au compte GitHub

Afficher la clé publique générée :

```sh
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

   ```sh
   sudo apt remove npm
   sudo apt autoremove
   ```

   3.2. **Installer npm à nouveau en utilisant npm version manager (nvm)** :

   nvm est une alternative à considérer car il permet une gestion plus souple des versions de Node.js et npm sans nécessiter sudo pour les commandes d'installation.

   - **Installer nvm** si ce n'est pas déjà fait :

     ```sh
     curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
     source ~/.bashrc
     ```

   - **Installer une version récente de Node.js via nvm** :

     ```sh
     nvm install node # Installe la dernière version de Node.js
     ```

   3.3. **Régler les permissions pour npm global** :

   Après avoir installé npm via nvm, s'assurer que le dossier où les packages npm globaux sont installés soit accessible sans sudo. Configurer npm pour installer globalement les packages dans le répertoire utilisateur. Pour cela, configurer npm pour utiliser un répertoire local pour les packages globaux (par exemple `~/.npm-global`).

   - Créer un répertoire pour les packages npm globaux dans le répertoire personnel :

     ```sh
     mkdir ~/.npm-global
     ```

   - Configurer npm pour utiliser ce répertoire :

     ```sh
     npm config set prefix '~/.npm-global'
     ```

   - Ajouter le chemin du répertoire `~/.npm-global/bin` au PATH utilisateur en éditant le fichier de profil (`~/.bashrc`, `~/.zshrc`, ou autre) :

     ```sh
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

  ```sh
  sudo chown -R $USER:$USER /var/www/Mountify-backend
  ```

- S'assurer que les permissions sont correctement définies :

  ```sh
  chmod -R 755 /var/www/Mountify-backend
  ```

   ```sh
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

### Étape 4 : Préparation et lancement des conteneurs Docker 

1. Renommer le fichier exemple.env en .env

2. Attribuer vos valeurs personnelles.

3. Lancer la commander

```bash
sudo docker-compose up --build
```

### Étape 5 : Changement du nom de domaine

1. : **Installer Nginx**

   Installer Nginx avec la commande suivante :

   ```sh
   sudo apt update
   sudo apt install nginx
   ```

2. **Modifier la configuration Nginx pour utiliser l'IP du conteneur :**

   Récupérer l'adresse IP du conteneur en utilisant la commande `docker inspect` :

   ```sh
   docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mountify-backend-api-1
   ```

   Utiliser cette adresse IP dans votre configuration Nginx.

   Ouvrir le fichier de configuration :

   ```sh
   sudo nano /etc/nginx/sites-available/default
   ```

   Remplacer le contenu par le code suivant


   ```nginx
   server {
       listen 80;
       server_name www.mountify.ovh mountify.ovh;

       location / {
           proxy_pass http://172.18.0.3:3000;  # Remplacez 172.18.0.3 par l'adresse IP de votre conteneur
           proxy_http_version 1.1;
           proxy_set_header Upgrade $http_upgrade;
           proxy_set_header Connection 'upgrade';
           proxy_set_header Host $host;
           proxy_cache_bypass $http_upgrade;
       }
   }
   ```

3. **Vérifiez la configuration Nginx :**

   ```sh
   sudo nginx -t
   ```

4. **Redémarrez Nginx :**

   ```sh
   sudo systemctl restart nginx
   ```

5. **Ajuster les pare-feux si nécessaire**

   Si un pare-feu est utilisé (comme `ufw`), s'assurer que le port 80 est ouvert :

   ```sh
   sudo ufw allow 'Nginx Full'
   ```

### Étape 6 : Passer le site en https

Utiliser Let's Encrypt pour obtenir un certificat SSL gratuit. Voici les étapes pour le faire avec Certbot :

1. **Installer snapd pour installer certbot :** 

   ```sh
   sudo apt update
   sudo apt install snapd
   ```

2. **Désinstaller les éventuelles précédentes version de Cartbot :**

   ```sh
   sudo apt-get remove certbot
   ```

3. ** Installer Certbot **

   ```sh
   sudo snap install --classic certbot
   ```

4. ** Préparer la commande Certbot **

   ```sh
   sudo ln -s /snap/bin/certbot /usr/bin/certbot
   ```

5. ** Obtenir et installer un certificat SSL pour les domaines souhaité **

   ```sh
   sudo certbot --nginx -d mountify.ovh -d www.mountify.ovh
   ```
