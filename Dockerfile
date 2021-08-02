# syntax=docker/dockerfile:1
FROM ubuntu:18.04

# Install libs for Chromium supporting, need more libs for Firefox and Webkit
RUN apt update && apt-get install -y \
gconf-service \
libasound2 \
libatk1.0-0 \
libc6 \
libcairo2 \
libcups2 \
libdbus-1-3 \
libexpat1 \
libfontconfig1 \
libgcc1 \
libgconf-2-4 \
libgdk-pixbuf2.0-0 \
libglib2.0-0 \
libgtk-3-0 \
libnspr4 \
libpango-1.0-0 \
libpangocairo-1.0-0 \
libstdc++6 \
libx11-6 \
libx11-xcb1 \
libxcb1 \
libxcomposite1 \
libxcursor1 \
libxdamage1 \
libxext6 \
libxfixes3 \
libxi6 \
libxrandr2 \
libxrender1 \
libxss1 \
libxtst6 \
ca-certificates \
fonts-liberation \
libappindicator1 \
libnss3 \
xdg-utils \
libgbm-dev

# Nodejs application
FROM node:14

# Create app directory for UAT project
WORKDIR /usr/src/handow-uat

# Install app dependencies
COPY package*.json ./
RUN npm install

# copy code to image
COPY . .

# Launch shm server with specified mode and port. (Run the comtainer with publishing the port, e.g. $ docker run -dp 8080:80 [image]
CMD [ "node", "node_modules/handow-shm/launch.js", "--secure", "--80" ]