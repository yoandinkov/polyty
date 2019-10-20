FROM node:10-alpine
COPY ./ /src
WORKDIR /src
RUN npm install && npm run docs:build

FROM nginx
RUN mkdir /src
COPY --from=0 /src/docs/.vuepress/dist /src
COPY nginx.conf /etc/nginx/nginx.conf