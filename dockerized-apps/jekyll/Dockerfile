FROM jekyll/jekyll:3.8

COPY ./blog /usr/src/app

WORKDIR /usr/src/app

RUN jekyll build .

FROM nginx:1.15.11-alpine

COPY --from=0 /usr/src/app/_site/ /usr/share/nginx/html/

