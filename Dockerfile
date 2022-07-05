FROM node:16-alpine as build_phase
WORKDIR /usr/app
COPY ./package.json ./
RUN npm install
COPY public ./public
COPY src ./src
RUN npm run build

FROM nginx
COPY --from=build_phase /usr/app/build /usr/share/nginx/html