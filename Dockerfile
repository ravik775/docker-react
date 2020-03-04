FROM node:alpine as build_step1

WORKDIR /app

COPY ./package.json ./

RUN npm install

COPY . .

RUN ["npm", "run", "build"]

FROM nginx

COPY --from=build_step1 /app/build /usr/share/nginx/html
EXPOSE 80