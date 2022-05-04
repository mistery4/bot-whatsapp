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

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install ./google-chrome-stable_current_amd64.deb

CMD ["npm", "start"]
EXPOSE 6892
