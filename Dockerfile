FROM node:16.13.0

RUN apt-get update && \
  apt-get install -y \
  nodejs \
  wget \
  ffmpeg \
  imagemagick \
  graphicsmagick \
  webp \
  neofetch \
  chromium && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

RUN npm install
RUN npm install pm2 -g
RUN pm2 save

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install ./google-chrome-stable_current_amd64.deb

CMD ["npm", "start"]
