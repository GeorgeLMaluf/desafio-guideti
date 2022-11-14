FROM node:14-alpine
RUN mkdir /app
WORKDIR /app
COPY package*.json /app/
RUN npm install && npm install -g @angular/cli@14.2.9
COPY . /app/
EXPOSE 4200