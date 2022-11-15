FROM node:14-alpine
RUN mkdir /app
WORKDIR /app
ADD package.json /app/
ADD package-lock.json /app/
ADD . /app
RUN npm install -g @angular/cli@14.2.9 @angular-devkit/build-angular@14.2.9
RUN npm install
EXPOSE 4200