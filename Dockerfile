# Utiliser une image Node officielle en tant que base
FROM node:14

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier package.json
COPY package.json .

# Installer les dépendances
RUN npm install

# Copier les fichiers et dossiers du projet dans le répertoire de travail
# Le premier point fait référence au répertoire actuel de l'hôte
# Le deuxième point fait référence au répertoire de travail "/app"
COPY . .

# Exposer le port 3000
EXPOSE 3000

# Démarrer l'application
CMD ["npm", "src/server.js"]