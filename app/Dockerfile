FROM node:14-alpine
RUN npm install -g @angular/cli
RUN npm install -g @angular-devkit/build-angular
RUN mkdir /home/node/app && chown node:node /home/node/app
RUN mkdir /home/node/app/node_modules && chown node:node /home/node/app/node_modules
USER node
WORKDIR /home/node/app
COPY --chown=node:node package*.json ./
RUN npm ci
EXPOSE 4200