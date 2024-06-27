# Welcome to Mountify-backend repository

## Presentation

Mountify is a web application that allows users to discover and catalog mountains and peaks around the world. Users can add new mountains, share photos and descriptions, and explore mountains created by other mountain and nature enthusiasts.

## Needs

A centralized platform for cataloging and discovering mountains around the world would be highly appreciated by many mountain enthusiasts.

## Objectives

- Enable users to discover and catalog mountains worldwide.
- Facilitate the sharing of information and experiences about mountains among users.
- Create a community of mountain adventure enthusiasts.

## Project Features

### MVP

- View the list of mountains on the site.
- Sign up on the site and authenticate.
- View details of a mountain.
- Add new mountains with a photo, description, and location.
- View user profiles with lists of created, to-visit, and already-visited peaks.
- Filter the list of mountains by country, region, and name.

### Potential Enhancements

- Comment on mountains.
- Add local species (flora, fauna).
- Communicate with other users via a private messaging system.
- ...

## Technologies Used

### Frontend

- Sass
- JS
- React / Redux

### Backend Technologies

- Node.js
- Express
- Sequelize

## Target Audience

- Mountain sports enthusiasts.
- Mountain and nature lovers.
- Travelers looking for new challenges and experiences in the mountains.

## How to deploy

#### Step 1 : Docker installation
If it is not installed, install docker [official documentation](https://docs.docker.com/engine/install/ubuntu/).  

#### Step 2 : Clone repository

  ```sh
  cd /var/www/
  sudo git clone git@github.com:NicolasChambon/Mountify-backend.git
  ```

#### Step 3 : Install node and npm

   1. **Remove previous npm versions** :
   
   ```sh
   sudo apt remove npm
   sudo apt autoremove
   ```

   2. **Install npm using nvm** :

  ```sh
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  source ~/.bashrc
  ```

  3. **Install Node.js using nvm** :

  ```sh
  nvm install node
  ```

#### Step 4 : Lauch npm install

  ```sh
  cd /path/to/Mountify-backend
  npm install
  ```

#### Step 5 : docker.compose.yml 

1. Rename `exemple.docker-compose.yml` in `docker-compose.yml`

2. Replace following fields : `<YourUserName>`, `<YourPassword>`, `<YourDatabaseName>` and `<YourJwtSecret>` by your personnal values.

#### Step 6 : Docker Compose launching

```sh
sudo docker-compose up --build
```
