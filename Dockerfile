FROM node:20-slim

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
  ffmpeg \
  imagemagick \
  webp \
  git \
  && apt-get upgrade -y \
  && rm -rf /var/lib/apt/lists/*

# Créer le dossier de travail
WORKDIR /root

# Cloner le vrai bot (remplace par ton vrai repo)
RUN git clone https://github.com/kurameshinatsuki/Supremus-IA bot-reel

WORKDIR /root/bot-reel

# Installer les dépendances
RUN npm install --production --legacy-peer-deps

# Exposer le port si nécessaire (ajuste selon ton bot)
EXPOSE 3000

# Lancer le bot (ajuste selon ton bot)
CMD ["npm", "start"]
