FROM node:10-alpine
COPY ./ /src
WORKDIR /src
RUN npm run docs:build

FROM nginx-alpine
RUN mkdir /src
COPY --from=0 /src/.vuepress/dist /src
COPY nginx.conf /etc/nginx/nginx.conf