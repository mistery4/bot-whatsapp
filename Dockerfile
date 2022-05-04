FROM node:16.13.0

RUN apt-get update && \
  apt-get install -y \
  nodejs \
  wget \
  ffmpeg \
  imagemagick \
  graphicsmagick \
  webp \
  chromium && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

RUN npm install
RUN npm install pm2 -g

CMD ["pm2-runtime", "index.js"]
EXPOSE 6892
